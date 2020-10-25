using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class basket : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();
        int KullanilacakDoviz = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();
        int KullaniciID;
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        #region Sepet için döngülerden fiyatları almak için
        List<double> ToplamTutar = new List<double>();
        List<double> ToplamKdv = new List<double>();
        List<double> Tutar = new List<double>();
        #endregion

        #region Kdvleri gruplamak için
        public List<SHOPObjeler.Tanimlar.KdvOran> L_KdvOran = new List<SHOPObjeler.Tanimlar.KdvOran>();
        #endregion

        // HY 02.11.2012 13:04 Bütün objeler el ele daha iyi bir sisteme :P
        #region Sistem objemiz
        SHOPObjeler.Tanimlar.Sistem Sistem { get; set; }
        #endregion

        #region Boş VIEWSTATE
        protected override void SavePageStateToPersistenceMedium(object viewState)
        {
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null;
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/login.aspx?ReturnUrl=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), true);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(117);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(97);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            #region Butonların texleri
            btn_sepet.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(110);
            btn_alisveristamamla.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(112);
            #endregion

            #region Gridin başlıkları
            grid_sepet.Columns[1].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(113).ToUpper();
            grid_sepet.Columns[2].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(114).ToUpper();
            grid_sepet.Columns[3].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(115).ToUpper();
            grid_sepet.Columns[4].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(116).ToUpper();
            #endregion

            /*
            #region Sepet için statik değişkenler siliniyor
            int index = -1;
            index = SHOPObjeler.Listeler.Sepet.FindIndex(delegate(SHOPObjeler.Tanimlar.Sepet p)
            {
                return (p.KullaniciID == KullaniciID);
            });
            if (index != -1)
            {
                SHOPObjeler.Listeler.Sepet.RemoveAt(index);
            }
            #endregion
            */

            Islemler();
            UrunSepeteAt();
            SepettekiStoksuzUrunler();
            Sepet();
        }

        protected void ObjeSetle()
        {
            try
            {
                Sistem = (from p in SHOPObjeler.Listeler.Sistem
                          where p.Key == KullaniciID
                          select p.Value).Cast<SHOPObjeler.Tanimlar.Sistem>().ToList()[0];
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        protected void Islemler()
        {
            if (Request.QueryString["p"] != null)
            {
                switch (Request.QueryString["p"].ToString())
                {
                    case "delete":
                        int UrunID = int.Parse(Request.QueryString["id"].ToString());
                        if (UrunID == 0)
                        {
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = from a in db.tbl_sepetler where a.kullanici_id == KullaniciID && a.durum == false select a;
                                foreach (var i in SQL)
                                {
                                    db.tbl_sepetler.DeleteObject(i);
                                }
                                db.SaveChanges();
                            }
                        }
                        else
                        {
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_sepetler sil = db.tbl_sepetler.First(p => p.id == UrunID && p.kullanici_id == KullaniciID && p.durum == false);
                                db.DeleteObject(sil);
                                db.SaveChanges();
                            }
                        }
                        break;
                }
                Response.Redirect("/basket.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void SepettekiStoksuzUrunler()
        {
            #region Eğer sepetteki ürünlerden stoğu olmayanlar varsa siliyor ve uyarı veriyor
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sepetler
                           where a.kullanici_id == KullaniciID
                           select new
                           {
                               a.id,
                               a.urun_id,
                               stok = db.tbl_urunler.Where(p => p.id == a.urun_id).Select(p => p.stok).FirstOrDefault()
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        if (i.stok == false)
                        {
                            using (BaglantiCumlesi dbsil = new BaglantiCumlesi())
                            {
                                tbl_sepetler sil = dbsil.tbl_sepetler.First(p => p.id == i.id);
                                dbsil.DeleteObject(sil);
                                dbsil.SaveChanges();
                            }

                            lit_uyarilar.Text = "<span style=\"color:#990000; font-weight:bold;\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(127) + "</span><div class=\"h10\"></div>";
                        }
                    }
                }
            }
            #endregion
        }

        protected void UrunSepeteAt()
        {
            if (!IsPostBack)
            {
                if (RouteData.Values["BasketID"] != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["BasketID"].ToString())))
                    {
                        if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(RouteData.Values["BasketID"].ToString()))
                        {
                            int UrunID = int.Parse(RouteData.Values["BasketID"].ToString());
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in db.tbl_sepetler
                                           where a.kullanici_id == KullaniciID && a.urun_id == UrunID && a.durum == false
                                           select new
                                           {
                                               a.id
                                           });

                                if (!SQL.Any())
                                {
                                    #region Sepete atılmak istenen ürün daha önce eklenmediyse sepet tablosuna kayıt ediliyor
                                    tbl_sepetler ekle = new tbl_sepetler();
                                    ekle.session_id = HttpContext.Current.Session.SessionID;
                                    ekle.urun_id = UrunID;
                                    ekle.kullanici_id = KullaniciID;
                                    ekle.durum = true;
                                    ekle.adet = 1;
                                    ekle.durum = false;
                                    db.AddTotbl_sepetler(ekle);
                                    db.SaveChanges();
                                    #endregion
                                }
                                else
                                {
                                    #region Sepete atılmak istenen ürün daha önce eklendiyse ürün adeti +1 yapılıyor
                                    tbl_sepetler guncelle = db.tbl_sepetler.First(p => p.urun_id == UrunID && p.kullanici_id == KullaniciID && p.durum == false);
                                    guncelle.adet = guncelle.adet + 1;
                                    guncelle.tarih = DateTime.Now;
                                    db.SaveChanges();
                                    #endregion
                                }
                            }
                            Response.Redirect("/basket.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }
                        else
                        {
                            Response.Redirect("/", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }
                    }
                    else
                    {
                        Response.Redirect("/", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                }
            }
        }

        protected void Sepet()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sepetler
                           where a.kullanici_id == KullaniciID && a.durum == false
                           select new
                           {
                               a.id,
                               a.adet,
                               urunadi = db.tbl_urunler.Where(p => p.id == a.urun_id).Select(p => p.ad).FirstOrDefault(),
                               urunid = db.tbl_urunler.Where(p => p.id == a.urun_id).Select(p => p.id).FirstOrDefault()
                           }).AsEnumerable();

                #region Eğer sepet boş ise tablo gizleniyor ve uyarı veriyor
                if (!SQL.Any())
                {
                    lit_sepetuyari.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(137);
                    div_sepeticerik.Visible = false;
                }
                #endregion

                grid_sepet.DataSource = SQL;
                grid_sepet.DataBind();
            }
        }

        protected void sepet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int UrunID = int.Parse(e.Row.Cells[2].Text);
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_urunler
                               where a.id == UrunID
                               select new
                               {
                                   a.id,
                                   a.ad,
                                   fiyat = a.fiyat == null ? 0 : a.fiyat,
                                   a.resim_id,
                                   a.kdv_id,
                                   a.para_birimi_id,
                                   a.indirim_id,
                                   a.kargo_hesaplama_id,
                                   a.stok,
                                   a.yeni,
                                   urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                   indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault(),
                                   kdv_yuzde = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.ad).FirstOrDefault(),
                                   kdv = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault()
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            e.Row.Cells[1].Text = "<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/product-image.ashx?i=" + i.resim_id + "&amp;w=60&amp;h=60&amp;k=t\" alt=\"" + i.ad + "\" align=\"left\" /></a>&nbsp;<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\">" + i.ad + "</a> (" + SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(293) + ": %" + i.kdv + ")";

                            if (!string.IsNullOrEmpty(i.urunkod))
                            {
                                e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br />&nbsp;" + Class.Fonksiyonlar.Uygulama.SabitlerText(208) + ": " + i.urunkod;
                            }

                            #region Ürün kargo bedava ise ikon çıkıyor
                            if (i.kargo_hesaplama_id == 1)
                            {
                                e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br />&nbsp;<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(216) + "\" src=\"/images/btn-ucretsizkargo.png\" /></a>";
                            }
                            #endregion

                            StringBuilder sb = new StringBuilder();
                            if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                            {
                                string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0));
                                string ToplamIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(IndirimliFiyat, "0", SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat, int.Parse(e.Row.Cells[3].Text)));
                                string ToplamKdvIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0));
                                string ToplamKdvMiktari = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0));

                                #region Üründe indirim varsa, indirimsiz ürün yazılıp üstüne strike etiketi ile üstüne çizgi atılıyor
                                sb.Append("<strike>" + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike><br />");
                                sb.Append(IndirimliFiyat + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));
                                #endregion

                                #region Eğer ürün dövizi, kullanılacak döviz değil ise sepette göstermek için döviz çevirme işlemi
                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                }
                                #endregion

                                e.Row.Cells[4].Text = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                #region Sepetteki ürünün fiyat ve kdv değeri listeye ekleniyor
                                Tutar.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)));
                                ToplamTutar.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)));
                                ToplamKdv.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)));

                                L_KdvOran.Add(new SHOPObjeler.Tanimlar.KdvOran() { Fiyat = double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)), Yuzde = double.Parse(i.kdv.ToString()) });
                                #endregion
                            }
                            else
                            {
                                string ToplamIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), "0", SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat, int.Parse(e.Row.Cells[3].Text)));
                                string ToplamKdvIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0));
                                string ToplamKdvMiktari = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0));

                                sb.Append(SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));

                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                }

                                e.Row.Cells[4].Text = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                #region Sepetteki ürünün fiyat ve kdv değeri listeye ekleniyor
                                Tutar.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)));
                                ToplamTutar.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)));
                                ToplamKdv.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)));

                                L_KdvOran.Add(new SHOPObjeler.Tanimlar.KdvOran() { Fiyat = double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)), Yuzde = double.Parse(i.kdv.ToString()) });
                                #endregion
                            }

                            e.Row.Cells[2].Text = sb.ToString();
                        }

                        #region Kdvleri grupluyoruz
                        var L = (from a in L_KdvOran select a.Yuzde).Distinct();

                        if (L.Any())
                        {
                            StringBuilder str_kdv = new StringBuilder();

                            foreach (var i in L)
                            {
                                str_kdv.Append("<tr>");
                                str_kdv.Append("<td class=\"baslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(293) + " (%" + i.ToString() + ")</td>");
                                str_kdv.Append("<td class=\"baslik\">:</td>");
                                str_kdv.Append("<td>" + SHOPClass.Finans.Cevirme.ParaFormat(L_KdvOran.Where(p => p.Yuzde == i).Select(p => p.Fiyat).Sum().ToString()) + " " + KullanilacakDovizAd + "</td>");
                                str_kdv.Append("</tr>");
                            }

                            lit_kdvler.Text = str_kdv.ToString();
                        }
                        #endregion

                        #region Sepetteki ürünler için oluşturulan List lerdeki de
                        lit_tutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Tutar.Sum().ToString()) + " " + KullanilacakDovizAd;
                        lit_indirimtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat((double.Parse(Tutar.Sum().ToString()) - double.Parse(ToplamTutar.Sum().ToString())).ToString()) + " " + KullanilacakDovizAd;
                        lit_toplamtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(ToplamTutar.Sum().ToString()) + " " + KullanilacakDovizAd;
                        lit_toplamkdv.Text = SHOPClass.Finans.Cevirme.ParaFormat(ToplamKdv.Sum().ToString()) + " " + KullanilacakDovizAd;
                        lit_geneltoplam.Text = SHOPClass.Finans.Cevirme.ParaFormat((double.Parse(ToplamTutar.Sum().ToString()) + double.Parse(ToplamKdv.Sum().ToString())).ToString()) + " " + KullanilacakDovizAd;
                        #endregion

                        if (Tutar.Sum() - ToplamTutar.Sum() == 0)
                        {
                            pnl_indirim.Visible = false;
                        }
                    }
                }

                TextBox txt = new TextBox();
                txt.ID = "adet";
                txt.ClientIDMode = ClientIDMode.Static;
                txt.Text = e.Row.Cells[3].Text;
                txt.Width = Unit.Pixel(30);
                txt.MaxLength = 5;

                e.Row.Cells[3].Controls.Add(txt);
            }
        }

        protected void btn_sepet_Click(object sender, EventArgs e)
        {
            try
            {
                #region Sepet güncelleme işlemleri
                foreach (GridViewRow satir in grid_sepet.Rows)
                {
                    TextBox kutu = (TextBox)satir.FindControl("adet");
                    int UrunID = int.Parse(grid_sepet.DataKeys[satir.RowIndex].Value.ToString());

                    #region Ürün adedi boş veya 0 ise sepetten siliyor, değilse adeti kutu değerine göre yazıyor
                    if (kutu.Text == "" || kutu.Text == "0")
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_sepetler sil = db.tbl_sepetler.First(p => p.id == UrunID && p.kullanici_id == KullaniciID);
                            db.DeleteObject(sil);
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_sepetler guncelle = db.tbl_sepetler.First(p => p.id == UrunID && p.kullanici_id == KullaniciID);
                            guncelle.adet = int.Parse(kutu.Text);
                            db.SaveChanges();
                        }
                    }
                    #endregion
                }
                #endregion

                Response.Redirect("/basket.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/basket.aspx");
            }
        }

        //HY 22.08.12 02:34
        /*protected void btn_sil_Click(object sender, EventArgs e)
        {
            try
            {
                #region Sepette checkbox seçilen ürünleri silme
                foreach (GridViewRow satir in grid_sepet.Rows)
                {
                    //CheckBox kutu = (CheckBox)satir.FindControl("secim");
                    if (((CheckBox)satir.FindControl("secim")).Checked)
                    {
                        int UrunID = int.Parse(grid_sepet.DataKeys[satir.RowIndex].Value.ToString());
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_sepetler sil = db.tbl_sepetler.First(p => p.id == UrunID && p.kullanici_id == KullaniciID);
                            db.DeleteObject(sil);
                            db.SaveChanges();
                        }
                    }
                }
                #endregion

                Response.Redirect("/basket.aspx");
            }
            catch (Exception ex)
            {
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/basket.aspx");
            }
        }*/

        protected void btn_alisveristamamla_Click(object sender, EventArgs e)
        {
            try
            {
                ObjeSetle();

                #region Sipariş için static değişken oluşturuluyor, sepet her adımında diğer değerler yazılacak
                SHOPObjeler.Tanimlar.Sepet Sepet = new SHOPObjeler.Tanimlar.Sepet();
                Sepet.KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();
                Sepet.Tutar = Tutar.Sum();
                Sepet.IndirimTutar = double.Parse(Tutar.Sum().ToString()) - double.Parse(ToplamTutar.Sum().ToString());
                Sepet.ToplamTutar = ToplamTutar.Sum();
                Sepet.ToplamKdv = ToplamKdv.Sum();
                Sepet.GenelToplam = double.Parse(ToplamTutar.Sum().ToString()) + double.Parse(ToplamKdv.Sum().ToString());
                Sepet.ParaBirimID = KullanilacakDoviz;
                Sistem.Sepet = Sepet;
                #endregion

                Response.Redirect("/basket-address.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/basket.aspx");
            }
        }
    }
}