using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySQLDataModel;

namespace SHOP
{
    public partial class product : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        public int KategoriID { get; set; }
        string UrunAdi = string.Empty;
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();
        int KullanilacakDoviz = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

        public int UrunID;
        public Objeler.Tanimlar.Urun U { get; set; }

        public Dictionary<int, string> Markalar2 = new Dictionary<int, string>();
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        public Dictionary<int, string> Resimler = new Dictionary<int, string>();
        public Dictionary<int, string> Videolar = new Dictionary<int, string>();

        public List<string> Keywords = new List<string>();
        public List<string> Etiketler = new List<string>();
        public List<string> Markalar = new List<string>();

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
            if (RouteData.Values["UrunID"] != null)
            {
                if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["UrunID"].ToString())))
                {
                    if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["UrunID"].ToString())) && Class.Fonksiyonlar.Uygulama.UrunVarmi(int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["UrunID"].ToString()))))
                    {
                        UrunID = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["UrunID"].ToString()));
                        U = Class.Fonksiyonlar.Uygulama.Bloklar.Urun.Bilgiler(UrunID);

                        Class.Fonksiyonlar.Uygulama.ZiyaretEkle((int)Class.Sabitler.Ziyaret.URUN, UrunID);

                        UrunDetay();
                        Kategori();

                        #region Taksit tablosu oluşturma
                        lit_taksitsecenekleri.Text = SHOPClass.Fonksiyonlar.Uygulama.TaksitHesaplamaTablosu(double.Parse(SHOPClass.Finans.Hesaplama.UrunTutar(UrunID)));
                        #endregion

                        Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urun.Etiketler(UrunID);

                        if (Etiketler.Any())
                        {
                            StringBuilder sb = new StringBuilder();
                            sb.Append("<div class=\"h10\"></div><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(225).ToUpper() + ":</strong> ");
                            foreach (var i in Etiketler)
                            {
                                sb.Append("<a href=\"/tag/" + Class.Fonksiyonlar.Genel.KarakterTemizle(i.ToString(), true) + "\">" + i.ToString() + "</a> ");
                            }
                            lit_etiketler.Text = sb.ToString();
                        }

                        #region Ürün Kodunu Keywordse Ekle
                        if (!string.IsNullOrEmpty(U.kod))
                        {
                            Keywords.Add(Class.Fonksiyonlar.Genel.KarakterTemizle(U.kod.ToLower(), false));
                        }
                        #endregion

                        #region Ürün Adını Keywordse Ekle
                        if (!string.IsNullOrEmpty(U.ad))
                        {
                            Keywords.Add(Class.Fonksiyonlar.Genel.KarakterTemizle(U.ad.ToLower(), false));
                        }
                        #endregion

                        #region Description Metatag
                        Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "description", "<meta http-equiv=\"Description\" content=\"" + U.on_aciklama.Replace("<br/>", " ") + "\" />");
                        #endregion

                        Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urun.Markalar(UrunID);
                        Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urun.Etiketler(UrunID);

                        KeywordsBas();
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
            else
            {
                Response.Redirect("/", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void Kategori()
        {
            KategoriID = U.kategori_id;

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, KategoriID);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            if (KategoriID == 0)
            {
                Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            }
            else
            {
                Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, KategoriID);

                if (Kategoriler.Count < 1)
                {
                    Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
                }
            }
        }

        protected void UrunDetay()
        {
            if (RouteData.Values["UrunID"] != null)
            {
                if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["UrunID"].ToString())))
                {
                    int UrunID = int.Parse(RouteData.Values["UrunID"].ToString());

                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        var SQL = (from a in db.tbl_urunler
                                   where a.onay == true && a.dil_id == DilID && a.id == UrunID
                                   select new
                                   {
                                       a.id,
                                       a.resim_id,
                                       a.ad,
                                       a.fiyat,
                                       a.kdv,
                                       a.kdv_id,
                                       a.para_birimi_id,
                                       a.indirim_id,
                                       a.stok,
                                       a.yeni,
                                       a.kargo_hesaplama_id,
                                       a.on_aciklama,
                                       a.aciklama,
                                       kdv_yuzde = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.yuzde).FirstOrDefault(),
                                       urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                       indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde).FirstOrDefault()
                                   }).AsEnumerable();

                        if (SQL.Any())
                        {
                            StringBuilder sb = new StringBuilder();
                            foreach (var i in SQL)
                            {
                                lit_urunbilgileri.Text = i.aciklama;
                                UrunAdi = i.ad;

                                lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(271) + " " + Nerdesin(KategoriIDBul(UrunID.ToString())) + " &raquo; " + i.ad;

                                StringBuilder sb2 = new StringBuilder();
                                sb2.Append("// " + i.ad);
                                if (i.yeni == true)
                                {
                                    sb2.Append("&nbsp;&nbsp;<img src=\"/images/icon-yeniurun.png\" alt=\"Yeni Ürün\" />");
                                }
                                lit_urunad.Text = sb2.ToString();

                                sb.Append("<div class=\"sol w260\"><a href=\"#\" id=\"link_urun_resim\" alt=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(124) + "\"><img src=\"/ashx/product-image.ashx?i=" + i.resim_id + "&amp;w=250&amp;h=250&amp;k=t\" alt=\"" + i.ad + "\" class=\"image-border\"/></a></div>");
                                sb.Append("<div class=\"sag w430\">");

                                #region Eğer ürün kodu yoksa ürün kodu satırı yazılmıyor
                                if (!string.IsNullOrEmpty(i.urunkod))
                                {
                                    sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w100\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(208) + "</div><div class=\"sol fiyatbilgiic2\">: " + i.urunkod + "</div></div>");
                                }
                                #endregion

                                #region Markalar alınıyor
                                Markalar2 = Class.Fonksiyonlar.Uygulama.Urunler.Markalar(UrunID);
                                if (Markalar.Any())
                                {
                                    int x = 1;
                                    StringBuilder sb1 = new StringBuilder();
                                    foreach (var ii in Markalar2)
                                    {
                                        sb1.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("brand", ii.Value, ii.Key.ToString()) + "\">" + ii.Value + "</a>");
                                        if (Markalar.Count() != x)
                                        {
                                            sb1.Append(", ");
                                            x++;
                                        }
                                    }
                                    sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w100\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(197) + "</div><div class=\"sol fiyatbilgiic2\">: " + sb1.ToString() + "</div></div>");
                                }
                                #endregion

                                #region Eğer fiyat yoksa fiyat satırı yazılmıyor
                                if (i.fiyat != 0 && !string.IsNullOrEmpty(i.fiyat.ToString()))
                                {
                                    if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                    {
                                        #region Eğer indirim varsa
                                        sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w100\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(196) + "</div><div class=\"sol fiyatbilgiic2\">: <strike>" + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike>");
                                        #region Eğer KDV varsa yazı olarak + KDV ibaresi ekleniyor

                                        if (!i.kdv)
                                        {
                                            sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293));
                                        }
                                        else
                                        {
                                            sb.Append(" <strike>" + Class.Fonksiyonlar.Genel.HarfBoyutlandirma(Class.Fonksiyonlar.Uygulama.SabitlerText(333), Class.Sabitler.StringIslemleri.HarfClass.Tip.Buyuk, Class.Sabitler.StringIslemleri.HarfClass.Islem.Hepsi, null) + "</strike>");
                                        }
                                        #endregion

                                        sb.Append("&nbsp;&nbsp;<span class=\"kirmizibold\">%" + i.indirim.ToString() + " <img src=\"/images/icon-indirim.png\" alt=\"indirim\" /></span></div></div>");
                                        sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w100\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(195) + "</div><div class=\"sol fiyatbilgiic2\">: " + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0)) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));

                                        #region Eğer KDV varsa yazı olarak + KDV ibaresi ekleniyor
                                        if (!i.kdv)
                                        {
                                            sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293) + "</div></div>");
                                        }
                                        else
                                        {
                                            sb.Append(" <strike>" + Class.Fonksiyonlar.Genel.HarfBoyutlandirma(Class.Fonksiyonlar.Uygulama.SabitlerText(333), Class.Sabitler.StringIslemleri.HarfClass.Tip.Buyuk, Class.Sabitler.StringIslemleri.HarfClass.Islem.Hepsi, null) + "<strike></div></div>");
                                        }
                                        #endregion

                                        #endregion

                                        if (!i.kdv)
                                        {
                                            sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w100\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(194) + "</div><div class=\"sol fiyatbilgiic2\">: " + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.kdv_yuzde.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0))) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + " (%" + i.kdv_yuzde + ")");
                                        }
                                    }
                                    else
                                    {
                                        #region Eğer indirim yoksa
                                        sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w100\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(196) + "</div><div class=\"sol fiyatbilgiic2\">: " + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "");
                                        #region Eğer KDV varsa yazı olarak + KDV ibaresi ekleniyor
                                        if (!i.kdv)
                                        {
                                            sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293) + "</div></div>");
                                        }
                                        else
                                        {
                                            sb.Append(" <strike>" + Class.Fonksiyonlar.Genel.HarfBoyutlandirma(Class.Fonksiyonlar.Uygulama.SabitlerText(333), Class.Sabitler.StringIslemleri.HarfClass.Tip.Buyuk, Class.Sabitler.StringIslemleri.HarfClass.Islem.Hepsi, null) + "<strike></div></div>");
                                        }
                                        #endregion
                                        #endregion

                                        if (!i.kdv)
                                        {
                                            sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w100\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(194) + "</div><div class=\"sol fiyatbilgiic2\">: " + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.kdv_yuzde.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0)) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + " (%" + i.kdv_yuzde + ")");
                                        }
                                    }

                                    if (KullanilacakDoviz != i.para_birimi_id)
                                    {
                                        sb.Append(" / " + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.UrunTutar(i.id)) + " " + KullanilacakDovizAd);
                                    }

                                    sb.Append("</div></div>");
                                }
                                else
                                {
                                    pnl_taksitsecenek.Visible = false;
                                    taksitsecenek.Visible = false;
                                }
                                #endregion

                                sb.Append("<br /><br />");

                                if (i.kargo_hesaplama_id == 1)
                                {
                                    sb.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(216) + "\" src=\"/images/btn-ucretsizkargo.png\" /></a> ");
                                }

                                sb.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("yazdir", i.ad, i.id.ToString()) + "\"><img src=\"/images/btn-yazdir.png\" alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(105) + "\" /></a> ");
                                sb.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("yorumyaz", i.ad, i.id.ToString()) + "\"><img src=\"/images/btn-yorumyaz.png\" alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(108) + "\" /></a> ");
                                sb.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("favori", i.ad, i.id.ToString()) + "\"><img src=\"/images/btn-favorilereekle.png\" alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(106) + "\" /></a>");

                                sb.Append("<br /><br />");

                                if (SHOPObjeler.Listeler.SiteAyar.Select(p => p.Buton).FirstOrDefault() == true)
                                {
                                    if (i.stok == true && i.fiyat != 0 && !string.IsNullOrEmpty(i.fiyat.ToString()))
                                    {
                                        /*
                                         MY 18.10.2012 22:57 CALL TO ACTION ÇALIŞMASI
                                     
                                         */
                                        sb.Append("<div class=\"fLeft marT10\"><a class=\"main-sprite btn-sepet-small fLeft\" href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("basket", i.ad, i.id.ToString()) + "\" rel=\"tipsy\" title=\" " + Class.Fonksiyonlar.Uygulama.SabitlerText(103) + "\"></a> <a class=\"main-sprite btn-hemenal marL5 fLeft\" href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("buy-now", i.ad, i.id.ToString()) + "\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(109) + "</a></div>");
                                        /* sb.Append("<a class=\"main-sprite btn-sepet marT10\" href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("basket", i.ad, i.id.ToString()) + "\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(109) + "</a>");*/
                                    }
                                    else
                                    {
                                        sb.Append("<img src=\"/images/btn-stokyok.png\" alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(107) + "\" />&nbsp;");
                                    }
                                }

                                sb.Append("</div>");

                            }
                            lit_urunbilgisi.Text = sb.ToString();
                        }
                    }

                    #region title
                    Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", UrunAdi + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                    #endregion

                    // ürün resimleri çekiliyor
                    Resimler = Class.Fonksiyonlar.Uygulama.Urunler.Resimler(UrunID);
                    lit_urunresimleri.Text = string.Empty;
                    if (Resimler.Any())
                    {
                        StringBuilder sb = new StringBuilder();
                        foreach (var i in Resimler)
                        {
                            sb.Append("<a class=\"urunresim\" href=\"/ashx/product-image.ashx?i=" + i.Key + "&amp;w=500&amp;h=500&amp;k=t\" title=\"" + UrunAdi + "\"><img src=\"/ashx/product-image.ashx?i=" + i.Key + "&amp;w=100&amp;h=100&amp;k=t\" alt=\"" + UrunAdi + "\" /></a> ");
                        }
                        lit_urunresimleri.Text = sb.ToString();
                    }
                    else
                    {
                        //lit_urunresimleri.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(132);
                        pnl_urunresim.Visible = false;
                        urunresim.Visible = false;
                    }

                    // ürün videoları çekiliyor
                    Videolar = Class.Fonksiyonlar.Uygulama.Urunler.Videolar(UrunID);
                    lit_urunvideolari.Text = string.Empty;
                    if (Videolar.Any())
                    {
                        StringBuilder sb = new StringBuilder();
                        foreach (var i in Videolar)
                        {
                            sb.Append("<a class=\"urunvideo\" href=\"" + i.Value + "\" title=\"" + UrunAdi + "\"><img src=\"/images/video.jpg\" alt=\"" + UrunAdi + "\" /></a> ");
                        }
                        lit_urunvideolari.Text = sb.ToString();
                    }
                    else
                    {
                        //lit_urunvideolari.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(133);
                        pnl_urunvideo.Visible = false;
                        urunvideo.Visible = false;
                    }
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

        private string KategoriIDBul(string ID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                int GelenID = Convert.ToInt16(ID);

                var SQL = (from a in db.tbl_urunler_kategoriler
                           where a.urun_id == GelenID
                           select new { a.kategori_id });

                if (SQL.Any())
                {
                    return SQL.Select(p => p.kategori_id).FirstOrDefault().ToString();
                }
                else
                {
                    return "0";
                }
            }
        }

        private string Nerdesin(string ID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                int GelenID = Convert.ToInt16(ID);

                var SQL = (from p in db.tbl_kategoriler
                           where p.dil_id == DilID && p.onay == true && p.id == GelenID
                           select p);

                StringBuilder SB1 = new StringBuilder();

                foreach (var i in SQL)
                {
                    StringBuilder SB2 = new StringBuilder();
                    SB2.Append("&raquo; ");

                    if (KategoriID != GelenID)
                    {
                        SB2.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("category", i.ad, ID.ToString()) + "\">");
                    }

                    if (KategoriID != GelenID)
                    {
                        SB2.Append(i.ad);
                    }
                    else
                    {
                        SB2.Append(i.ad);
                    }

                    if (KategoriID != GelenID)
                    {
                        SB2.Append("</a> ");
                    }

                    SB1.Append(Nerdesin(i.kategori_id.ToString()));
                    SB1.Append(SB2.ToString());
                }

                return SB1.ToString();
            }
        }

        private void KeywordsBas()
        {
            #region Kategorileri Keywordse Ekle
            Keywords.AddRange(new List<string>(Kategoriler.Values));
            #endregion

            #region Markaları Keywordse Ekle
            Keywords.AddRange(Markalar);
            #endregion

            #region Etiketleri Keywordse Ekle
            Keywords.AddRange(Etiketler);
            #endregion

            #region Keywordsler İçinde Aynı Kayıtlar Varsa Sil
            List<string> L = Keywords.Distinct().ToList().ConvertAll(x => Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, x.ToString().ToLower()));
            #endregion

            #region Listeden Keywordsleri Al
            StringBuilder SB2 = new StringBuilder();

            int a = 0;

            foreach (var i in L)
            {
                if (a != L.Count - 1)
                {
                    SB2.Append(i + ",");
                }
                else
                {
                    SB2.Append(i);
                }

                a++;
            }

            if (!string.IsNullOrEmpty(SB2.ToString()))
            {
                if (SB2.ToString().Substring(SB2.ToString().Length - 1, 1) == ",")
                {
                    SB2.Append(Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                }
            }
            #endregion

            #region Keywords Metatag
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "keywords", "<meta http-equiv=\"Keywords\" content=\"" + SB2.ToString().Replace(", ", ",").Replace(",", ", ") + "\" />");
            #endregion
        }
    }
}