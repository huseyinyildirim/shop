using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;
using SHOP.ViewState;

namespace SHOP
{
    // Kart Bilgileri
    // Ödeme Bilgileri
    // Kartın bankasına göre ödeme bilgileri gelecek.
    public partial class payment_pos : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID = 0;
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();
        int KullanilacakDoviz = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

        #region Sistem objemiz
        SHOPObjeler.Tanimlar.Sistem Sistem { get; set; }
        #endregion

        #region POS Objesi
        SHOPObjeler.Tanimlar.POS POS = new SHOPObjeler.Tanimlar.POS();
        #endregion

        #region POS Durum Objesi
        SHOPClass.Odemeler.POSDurum POSD = new SHOPClass.Odemeler.POSDurum();
        #endregion

        //SHOPObjeler.Tanimlar.KrediKartiIleOdeme KKIO = new SHOPObjeler.Tanimlar.KrediKartiIleOdeme();

        #region Kdvleri gruplamak için
        public List<SHOPObjeler.Tanimlar.KdvOran> L_KdvOran = new List<SHOPObjeler.Tanimlar.KdvOran>();
        #endregion

        #region VIEWSTATE Serializer
        private ViewStateSerializer _persister = null;
        protected override PageStatePersister PageStatePersister
        {
            get
            {
                if (_persister == null)
                {
                    _persister = new ViewStateSerializer(Page, ViewStateSerializer.SecurityLevel.Low, false);
                    //_persister.CompressPage(); // optional (compress all output HTML page) if have problems, comment it
                }
                return _persister;
            }
        }
        #endregion

        /*
         * Edit HY 17.08.12 00:26 Eğer nesnedeki toplam değer 0 sa puan ve pos satış butonları pasif olacak
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/login.aspx?ReturnUrl=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

                ObjeSetle();
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(301); ;
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(301);
            btn_puan.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(304);
            btn_2dpos.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(302);
            btn_3dpos.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(303);
            btn_degistir.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(311);
            btn_degistir0.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(312);

            #region Gridview başlıkları
            grid_sepet.Columns[1].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(113).ToUpper();
            grid_sepet.Columns[2].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(114).ToUpper();
            grid_sepet.Columns[3].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(115).ToUpper();
            grid_sepet.Columns[4].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(116).ToUpper();
            #endregion

            KKBilgileri();

            if (!IsPostBack)
            {
                Sepet();

                InvoiceAddress();
                ShippingAddress();
            }

            //HY 17.08.12 00:26 BEGIN
            if (Sistem.Sepet.Toplam == 0 || Sistem.Sepet.KargoAdresID == 0 || Sistem.Sepet.FaturaAdresID == 0)
            {
                Response.Redirect("/basket.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            //HY 17.08.12 00:26 END

            #region Satış sözleşmesi yazdırıyoruz
            string SatisSozlesme = SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(236);
            SatisSozlesme = SatisSozlesme.Replace("{{Satici}}", Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault());
            SatisSozlesme = SatisSozlesme.Replace("{{SaticiAdres}}", Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.adres).FirstOrDefault());
            SatisSozlesme = SatisSozlesme.Replace("{{Alici}}", SHOPClass.Fonksiyonlar.Kullanici.Cagir.Bilgi(KullaniciID).Select(p => p.ad_soyad).FirstOrDefault());
            SatisSozlesme = SatisSozlesme.Replace("{{AliciAdres}}", SHOPClass.Fonksiyonlar.Kullanici.Cagir.AdresBilgi(Sistem.Sepet.FaturaAdresID).Select(p => p.adres).FirstOrDefault() + " " + SHOPClass.Fonksiyonlar.Kullanici.Cagir.AdresBilgi(Sistem.Sepet.FaturaAdresID).Select(p => p.ilce).FirstOrDefault() + "/" + SHOPClass.Fonksiyonlar.Kullanici.Cagir.AdresBilgi(Sistem.Sepet.FaturaAdresID).Select(p => p.il).FirstOrDefault());
            SatisSozlesme = SatisSozlesme.Replace("{{SiparisTarih}}", DateTime.Now.ToLongDateString());
            //lit_satis_sozlesme.Text = SatisSozlesme;
            #endregion

            //HY 10.11.2012 22:37 BEGIN
            #region Ödeme tipine göre gösterilecek alanlar
            switch (Sistem.Odeme.OdemeTipi)
            {
                case SHOPClass.Sabitler.OdemeTipi.BankaHavalesi:
                    place_holder_havale_odeme_bildirim.Visible = true;

                    #region Havale adımında hangi bankayı seçti?
                    GetBankAccountInfo();
                    #endregion
                    break;
                case SHOPClass.Sabitler.OdemeTipi.KrediKarti:
                    place_holder_kk_odeme_bilgileri.Visible = true;
                    place_holder_kk_odeme_onay.Visible = true;
                    place_holder_puan.Visible = true;

                    #region Taksit seçeneklerini yazdırıyoruz
                    lit_kredi_oran.Text = TaksitSecenekler(Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.POSID, Sistem.Sepet.Toplam);
                    #endregion

                    break;
                case SHOPClass.Sabitler.OdemeTipi.KapidaOdeme:
                    break;
                case SHOPClass.Sabitler.OdemeTipi.Paypal:
                    break;
                case SHOPClass.Sabitler.OdemeTipi.PostaHavalesi:
                    break;
                default:
                    break;
            }
            #endregion
            //HY 10.11.2012 22:37 END
        }

        protected void GetBankAccountInfo()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_hesap_nolar
                           where p.id == Sistem.Odeme.OdemeSekilleri.BankaHavalesi.HesapNoID
                           select new
                           {
                               p.iban,
                               p.hesap_no,
                               p.hesap_sahibi,
                               p.sube,
                               p.sube_kodu,
                               banka = (db.tbl_sbt_banka.Where(x => x.id == p.banka_id).Select(x => x.marka).FirstOrDefault())
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    lit_havale_banka_adi.Text = SQL.Select(x => x.banka).FirstOrDefault();
                    lit_havale_hesap_no.Text = SQL.Select(x => x.hesap_no).FirstOrDefault();
                    lit_havale_hesap_sahibi.Text = SQL.Select(x => x.hesap_sahibi).FirstOrDefault();
                    lit_havale_iban_no.Text = SQL.Select(x => x.iban).FirstOrDefault();
                    lit_havale_sube.Text = SQL.Select(x => x.sube).FirstOrDefault() + " (" + SQL.Select(x => x.sube_kodu).FirstOrDefault() + ")";
                }
            }
        }

        static string TaksitSecenekler(int SanalPosID, double UrunFiyat)
        {
            StringBuilder sb = new StringBuilder();
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_sanal_pos_oran
                           where a.onay == true && a.sanal_pos_id == SanalPosID
                           select new
                           {
                               a.ay,
                               a.oran
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    sb.Append("<div class=\"h10\"></div>\r\n<table cellspacing=\"1\" align=\"center\" summary=\"\">\r\n");
                    sb.Append("<tbody>\r\n");
                    foreach (var i in SQL)
                    {
                        sb.Append("<tr>\r\n");
                        sb.Append("<td><input type=\"radio\" name=\"taksit_secenek\" id=\"taksit_secenek\" value=\"" + i.ay + "\" /></td>\r\n");

                        if (i.ay == 1)
                        {
                            sb.Append("<td>Tek Çekim " + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(1, UrunFiyat, i.oran)) + " " + SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd() + "</td>\r\n");
                        }
                        else
                        {
                            sb.Append("<td>" + i.ay + " x " + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(i.ay, UrunFiyat, i.oran)) + " " + SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd() + " = " + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(1, UrunFiyat, i.oran)) + " " + SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd() + "</td>\r\n");
                        }

                        sb.Append("</tr>\r\n");
                    }
                    sb.Append("</tbody>\r\n</table>");
                }
            }
            return sb.ToString();
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

        protected void KKBilgileri()
        {
            try
            {
                ObjeSetle();

                lit_kk_isim.Text = Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.AdSoyad;
                lit_kk_kart_no.Text = SHOPClass.Fonksiyonlar.KartNoFormatla(Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.KartNo, true, " - ", "*");
                lit_kk_son_kullanma.Text = Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.SonKullanim.Substring(0, 2) + "/" + Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.SonKullanim.Substring(2, 2);
                lit_kk_cvc.Text = Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.CVC.Substring(0, 1) + "*" + Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.CVC.Substring(2, 1);
                lit_kk_tip.Text = Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.KartTipi.ToString();
                lit_kk_banka.Text = SHOPClass.Fonksiyonlar.Genel.BankaAdi(Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.BankaID);

                if (Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Puan > 0)
                {
                    if (!Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.PuanKullan)
                    {
                        lit_puan.Text = Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Puan.ToString();
                        lit_puan_para_birim.Text = KullanilacakDovizAd;
                    }
                }
                else
                {
                    place_holder_puan.Visible = false;
                }

            }
            catch
            {
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

                #region Eğer sepet boş basket.aspx gidiyor
                if (!SQL.Any())
                {
                    Response.Redirect("/basket.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
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
                                   //parabirim = db.tbl_sbt_para_birim.Where(p => p.id == a.para_birimi_id).Select(p => p.simge).FirstOrDefault(),
                                   urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                   indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault(),
                                   kdv_yuzde = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.ad == null ? null : p.ad).FirstOrDefault(),
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
                                #region Üründe indirim varsa, indirimsiz ürün yazılıp üstüne strike etiketi ile üstüne çizgi atılıyor
                                sb.Append("<strike>" + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike><br />");
                                sb.Append(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0)) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));
                                #endregion

                                #region Eğer ürün dövizi, kullanılacak döviz değil ise sepette göstermek için döviz çevirme işlemi
                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0)), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                }
                                #endregion

                                string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, int.Parse(e.Row.Cells[3].Text)));
                                string KdvIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0));
                                string ToplamKdvMiktari = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(IndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0));

                                e.Row.Cells[4].Text = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                L_KdvOran.Add(new SHOPObjeler.Tanimlar.KdvOran() { Fiyat = double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)), Yuzde = double.Parse(i.kdv.ToString()) });
                            }
                            else
                            {
                                sb.Append(SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));

                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                }

                                string UrunToplamFiyat = SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), "0", SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat, int.Parse(e.Row.Cells[3].Text));
                                string KdvUrunToplamFiyat = SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(UrunToplamFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0);
                                string ToplamKdvMiktari = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(UrunToplamFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0));

                                e.Row.Cells[4].Text = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(UrunToplamFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                L_KdvOran.Add(new SHOPObjeler.Tanimlar.KdvOran() { Fiyat = double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)), Yuzde = double.Parse(i.kdv.ToString()) });
                            }

                            e.Row.Cells[2].Text = sb.ToString();
                        }

                        #region Kdvleri grupluyoruz ama toplam kdv sıfırsa grupları göstermiyoruz çünkü yurt dışı olabilir
                        if (Sistem.Sepet.ToplamKdv != 0)
                        {
                            var L = (from a in L_KdvOran
                                     select a.Yuzde).Distinct();

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
                        }
                        #endregion

                        #region Sepetteki ürünün fiyat ve kdv değeri listeye ekleniyor
                        lit_tutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.Tutar.ToString()) + " " + KullanilacakDovizAd;
                        lit_indirimtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.IndirimTutar.ToString()) + " " + KullanilacakDovizAd;
                        lit_toplamtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.ToplamTutar.ToString()) + " " + KullanilacakDovizAd;
                        lit_toplamkdv.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.ToplamKdv.ToString()) + " " + KullanilacakDovizAd;
                        lit_geneltoplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.GenelToplam.ToString()) + " " + KullanilacakDovizAd;
                        lit_kargo_payi.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.KargoPayi.ToString()) + " " + KullanilacakDovizAd;
                        lit_toplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.Toplam.ToString()) + " " + KullanilacakDovizAd;
                        lit_cekilecek_td.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.Toplam.ToString());
                        lit_komisyon_tutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.KomisyonTutar.ToString()) + " " + KullanilacakDovizAd;
                        lit_komisyon_adi.Text = Sistem.Sepet.IndirimKomisyonAdi;
                        lit_cekilecek_para_birim_td.Text = KullanilacakDovizAd;
                        #endregion

                        if (Sistem.Sepet.IndirimKomisyonID == 0)
                        {
                            place_holder_indirim_komisyon.Visible = false;
                        }

                        if (Sistem.Sepet.IndirimTutar == 0)
                        {
                            place_holder_indirim.Visible = false;
                        }

                        if (Sistem.Sepet.KargoPayi == 0)
                        {
                            place_holder_kargo_payi.Visible = false;
                        }
                    }
                }
            }
        }

        #region Fatura adres işlemleri
        protected void InvoiceAddress()
        {
            ObjeSetle();

            int AdresID = Sistem.Sepet.FaturaAdresID;

            if (AdresID == 0)
            {
                lbl_faturaadres.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(313);
            }
            else
            {
                #region Seçilen fatura adresi detayları basılıyor
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_kullanicilar_adresler
                               where a.kullanici_id == KullaniciID && a.id == AdresID
                               select new
                               {
                                   a.baslik,
                                   a.il,
                                   a.ilce,
                                   a.adres,
                                   a.posta_kodu,
                                   ulke = db.tbl_sbt_ulke.Where(p => p.id == a.ulke_id).Select(p => p.ad).FirstOrDefault(),
                                   vergitip = db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == a.id && p.kullanici_id == KullaniciID).Select(p => p.tip).FirstOrDefault(),
                                   vergidaire = db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == a.id && p.kullanici_id == KullaniciID).Select(p => p.vergi_dairesi).FirstOrDefault(),
                                   vergino = db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == a.id && p.kullanici_id == KullaniciID).Select(p => p.vergi_no).FirstOrDefault(),
                                   tcno = db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == a.id && p.kullanici_id == KullaniciID).Select(p => p.tc_kimlik_no).FirstOrDefault(),
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        StringBuilder sb = new StringBuilder();
                        foreach (var i in SQL)
                        {
                            sb.Append("<strong>" + i.baslik + "</strong><br />" + i.adres + "<br />" + i.il + "/" + i.ilce + "/" + i.ulke + " " + i.posta_kodu);
                            if (i.vergitip == true)
                            {
                                sb.Append("<br />" + i.vergidaire + " " + i.vergino);
                            }
                            else
                            {
                                sb.Append("<br />" + i.tcno);
                            }
                        }
                        lbl_faturaadres.Text = sb.ToString();
                    }
                    else
                    {
                        lbl_faturaadres.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(313);
                    }
                }
                #endregion
            }
        }
        #endregion

        #region Teslimat adres işlemleri
        protected void ShippingAddress()
        {
            ObjeSetle();

            if (Sistem.Sepet.KargoAdresID == 0)
            {
                Response.Redirect("/basket.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }

            int AdresID = Sistem.Sepet.KargoAdresID;

            if (AdresID == 0)
            {
                lbl_teslimatadres.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(313);
            }
            else
            {
                #region Seçilen fatura adresi detayları basılıyor
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_kullanicilar_adresler
                               where a.kullanici_id == KullaniciID && a.id == AdresID
                               select new
                               {
                                   a.baslik,
                                   a.il,
                                   a.ilce,
                                   a.adres,
                                   a.posta_kodu,
                                   ulke = db.tbl_sbt_ulke.Where(p => p.id == a.ulke_id).Select(p => p.ad).FirstOrDefault(),
                                   a.acik_adres
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            lbl_teslimatadres.Text = "<strong>" + i.baslik + "</strong><br />" + i.adres + "<br />" + i.il + "/" + i.ilce + "/" + i.ulke + " " + i.posta_kodu + "<br />" + i.acik_adres;
                        }
                    }
                    else
                    {
                        lbl_teslimatadres.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(313);
                    }
                }
                #endregion
            }
        }
        #endregion

        protected void btn_degistir_Click(object sender, EventArgs e)
        {
            Response.Redirect("/basket-cargo.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btn_puan_Click(object sender, EventArgs e)
        {
            if (!Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.PuanKullan)
            {
                Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.PuanKullan = true;
                place_holder_puan.Visible = false;

                lit_puan_td.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Puan.ToString());
                lit_puan_para_birim_td.Text = KullanilacakDovizAd;

                place_holder_puan_td.Visible = true;
            }
        }

        protected void btn_2dpos_Click(object sender, EventArgs e)
        {
            POS = SHOPClass.Odemeler.Pos.POSBilgisi(Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.POSID);

            #region Puanı Çek
            if (Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.PuanKullan)
            {
                #region Puan Kullan
                POSD = SHOPClass.Odemeler.PosIslem(SHOPClass.Fonksiyonlar.IslemID("TEST", 24), SHOPClass.Sabitler.PosIslemTipleri.PuanKullan, POS, Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri, Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri);
                #endregion

                if (POSD.Message.Type != Class.Sabitler.MessageTypes.OK)
                {
                    //tutardan puanı çıkar 
                    Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Tutar = (Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Tutar - Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Puan);
                }
                else
                {
                    //hata ver ekrana puan kullanılamadı normal çekiyoruz de.
                }
            }
            #endregion

            ParaCek();
        }

        protected void ParaCek()
        {
            #region Parayı Çek
            if (POS.OnOtorizasyon)
            {
                #region Ön Otorizasyon
                POSD = SHOPClass.Odemeler.PosIslem(SHOPClass.Fonksiyonlar.IslemID("TEST", 24), SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon, POS, Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri, Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri);
                #endregion
            }
            else
            {
                #region Satış
                POSD = SHOPClass.Odemeler.PosIslem(SHOPClass.Fonksiyonlar.IslemID("TEST", 24), SHOPClass.Sabitler.PosIslemTipleri.Satis, POS, Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri, Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri);
                #endregion
            }
            #endregion

            if (POSD.Message.Type != Class.Sabitler.MessageTypes.OK)
            {
                //db ye yaz sayfa çıkart.
                KKOdemeYap();
            }
            else
            {
                //hata ver
            }

            //POS İşlemi Sonucu Dönen Değer Yazılıyor
            Sistem.Odeme.OdemeSekilleri.KrediKarti.PosIslem = POSD.POSIslem;
        }

        void KKOdemeYap()
        {
            ObjeSetle();

            Sistem.Sepet.SiparisDurumID = 2;

            SHOPClass.Fonksiyonlar.Sepet.SiparisOlustur2(SHOPClass.Sabitler.OdemeTipi.KrediKarti);

            Response.Redirect("/default.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btn_havale_Click(object sender, EventArgs e)
        {
            ObjeSetle();

            Sistem.Sepet.SiparisDurumID = 2;

            SHOPClass.Fonksiyonlar.Sepet.SiparisOlustur2(SHOPClass.Sabitler.OdemeTipi.BankaHavalesi);

            Response.Redirect("/default.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}