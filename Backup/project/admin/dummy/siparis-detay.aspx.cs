using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySQLDataModel;

//!++ Ürün fiyatları hesaplarken ürün fiyatı yabancı para birimi olarak belirtilmişse hesaplayarak listeye eklemeli!

namespace SHOP.admin.dummy
{
    public partial class siparis : System.Web.UI.Page
    {
        //!+ Adres Kısımları Objelere Eklenmeli ve Adres Yapısı Böyle Olmalı
        public enum BankaIslemTipleri
        {
            Havale = 0,
            EFT = 1,
            Diger = 2
        }

        List<SHOPObjeler.Tanimlar.Urun> ListUrunler = new List<SHOPObjeler.Tanimlar.Urun>();

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
            #region JS İçin Admin Root mu Değil mi?
            Class.Fonksiyonlar.JavaScript.Ekle("var AdminRoot = function(){return " + Class.Fonksiyonlar.Admin.Kullanici.Kontroller.Root(Class.Fonksiyonlar.Admin.Genel.AdminID()).ToString().ToLower() + ";};");
            #endregion

            #region Oturum Kontrol
            if (!Class.Fonksiyonlar.Admin.Genel.SessionKontrol())
            {
                #region Oturum Yoksa Postala
                Response.Redirect("default.aspx?rnd=" + (DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond) + "&s=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), false);
                Context.ApplicationInstance.CompleteRequest();
                return;
                #endregion
            }
            else
            {
                if (Request.QueryString["id"] != null)
                {
                    if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["id"].ToString().Trim())))
                    {
                        SiparisGetir(int.Parse(Request.QueryString["id"].ToString().Trim()));
                    }
                }
            }
            #endregion
        }

        protected void SiparisGetir(int SiparisID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_siparisler
                           from k in db.tbl_cpy_indirimler_komisyonlar
                           where p.id == SiparisID && k.id == p.indirim_komisyon_id
                           select new
                           {
                               k.tip,
                               p.para_birimi_id,
                               p.tutar,
                               p.indirim_tutari,
                               p.toplam_tutar,
                               p.toplam_kdv,
                               p.genel_toplam,
                               p.komisyon_tutari,
                               p.kargo_payi,
                               p.puan_tutari,
                               p.toplam,
                               p.kullanici_id,
                               p.odeme_sekli_id,
                               p.no,
                               p.tarih,
                               p.kur_tarih
                           }).AsEnumerable().Take(1);

                if (SQL.Any())
                {
                    StringBuilder SB = new StringBuilder();

                    #region No/Tarih
                    litsno.Text = SQL.Select(p => p.no).FirstOrDefault();
                    litstarih.Text = SQL.Select(p => p.tarih).FirstOrDefault().ToString();
                    #endregion

                    #region Ödeme Şekli
                    int OdemeSekliID = SQL.Select(p => p.odeme_sekli_id).FirstOrDefault();
                    LitOdemeSekli.Text = db.tbl_sbt_odeme_sekli.Where(x => x.id == OdemeSekliID).Select(x => x.ad).FirstOrDefault();
                    #endregion

                    #region Durum Bilgileri
                    var DurumlarSQL = (from p in db.tbl_siparisler_durumlar
                                       where p.siparis_id == SiparisID
                                       let durum = db.tbl_sbt_siparis_durum.Where(x => x.id == p.siparis_durum_id).Select(x => x.ad).FirstOrDefault()
                                       orderby p.tarih descending
                                       select new
                                       {
                                           durum,
                                           p.tarih
                                       });

                    SB = new StringBuilder();
                    foreach (var i in DurumlarSQL)
                    {
                        SB.Append("<tr>\r\n");
                        SB.Append("<td>" + i.durum + "</td>\r\n");
                        SB.Append("<td align=\"center\">" + i.tarih + "</td>\r\n");
                        SB.Append("</tr>\r\n");
                    }

                    LitSiparisDurum.Text = SB.ToString();
                    #endregion

                    #region Döviz Kuru
                    if (SQL.Select(p => p.para_birimi_id).FirstOrDefault() != 1)
                    {
                        LitParaBirimi.Text = SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(SQL.Select(p => p.para_birimi_id).FirstOrDefault().ToString());

                        if (!string.IsNullOrEmpty(SQL.Select(p => p.kur_tarih).FirstOrDefault().ToString()))
                        {
                            LitKur.Text = SHOPClass.Fonksiyonlar.Genel.Doviz.KurGetir(SQL.Select(p => p.para_birimi_id).FirstOrDefault(), SQL.Select(p => p.kur_tarih).FirstOrDefault(), null).ToString();
                            LitKurTarihi.Text = SQL.Select(p => p.kur_tarih).FirstOrDefault().Value.Date.ToShortDateString();
                        }
                    }
                    else
                    {
                        DovizKuruTablo.Visible = false;
                        LitBosKur.Text = "-----";
                    }
                    #endregion

                    string ParaSimge = SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(SQL.Select(p => p.para_birimi_id).FirstOrDefault().ToString());

                    #region indirim mi, komisyon mu?
                    if (SQL.Select(p => p.tip).FirstOrDefault().ToString() == "True")
                    {
                        LitKomisyonTutariText.Text = "KOMİSYON TUTARI";
                    }
                    else
                    {
                        LitKomisyonTutariText.Text = "İNDİRİM TUTARI";
                    }
                    #endregion

                    #region Durumuna göre gizlenecek alanlar
                    if (SQL.Select(p => p.kargo_payi).FirstOrDefault() == 0 || SQL.Select(p => p.kargo_payi).FirstOrDefault() == null)
                    {
                        ph_kargo_payi.Visible = false;
                    }
                    if (SQL.Select(p => p.indirim_tutari).FirstOrDefault() == 0 || SQL.Select(p => p.indirim_tutari).FirstOrDefault() == null)
                    {
                        ph_indirim_tutari.Visible = false;
                    }
                    if (SQL.Select(p => p.puan_tutari).FirstOrDefault() == 0 || SQL.Select(p => p.puan_tutari).FirstOrDefault() == null)
                    {
                        ph_puan_tutari.Visible = false;
                    }
                    #endregion

                    #region Toplamlar
                    LitTutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.tutar).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitIndirimTutari.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.indirim_tutari).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitToplamTutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.toplam_tutar).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitToplamKdv.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.toplam_kdv).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitGenelToplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.genel_toplam).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitKomisyonTutari.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.komisyon_tutari).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitKargoPayi.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.kargo_payi).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitPuanTutari.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.puan_tutari).FirstOrDefault().ToString()) + " " + ParaSimge;
                    LitToplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(SQL.Select(p => p.toplam).FirstOrDefault().ToString()) + " " + ParaSimge;
                    #endregion

                    #region Kullanıcı Bilgileri
                    int KullaniciID = SQL.Select(p => p.kullanici_id).FirstOrDefault();

                    var KullaniciSQL = (from p in db.tbl_kullanicilar
                                        where p.id == KullaniciID
                                        select p).AsEnumerable().Take(1);

                    LitKullaniciAd.Text = KullaniciSQL.Select(p => p.ad_soyad).FirstOrDefault();
                    LitKullaniciMail.Text = "<a href='mailto:" + KullaniciSQL.Select(p => p.mail).FirstOrDefault() + "'>" + KullaniciSQL.Select(p => p.mail).FirstOrDefault() + "</a>";
                    LitKullaniciTel.Text = "+(" + KullaniciSQL.Select(p => p.alan_kodu_id).FirstOrDefault() + ") " + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TelFormatla, KullaniciSQL.Select(p => p.gsm).FirstOrDefault());
                    LitKullaniciTarih.Text = KullaniciSQL.Select(p => p.tarih_ek).FirstOrDefault().ToString();
                    #endregion

                    #region Ürün Bilgileri
                    var UrunlerSQL = (from p in db.tbl_siparisler_urunler
                                      where p.siparis_id == SiparisID
                                      select
                                      new
                                      {
                                          p.siparisler_urunler_id,
                                          p.adet
                                      });

                    ListUrunler.Clear();
                    SB = new StringBuilder();

                    foreach (var i in UrunlerSQL)
                    {
                        SHOPObjeler.Tanimlar.Urun U = new SHOPObjeler.Tanimlar.Urun();
                        U.ID = i.siparisler_urunler_id;

                        SB.Append("<tr>\r\n");
                        SB.Append("<td>" + SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.kod).FirstOrDefault() + "</td>\r\n");
                        SB.Append("<td>" + SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.ad).FirstOrDefault() + "</td>\r\n");

                        U.BirimFiyat = SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.fiyat).FirstOrDefault().ToString();
                        U.ParaBirimiID = int.Parse(SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.para_birimi_id).FirstOrDefault().ToString());

                        SB.Append("<td>" + SHOPClass.Finans.Cevirme.ParaFormat(U.BirimFiyat) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(U.ParaBirimiID.ToString()) + "</td>");
                        SB.Append("<td>" + SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.indirim_ad).FirstOrDefault() + "</td>\r\n");

                        string UrunFiyat = SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.fiyat).FirstOrDefault().ToString();
                        string UrunIndirim = SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.indirim_yuzde).FirstOrDefault().ToString();
                        U.IndirimTutari = SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(UrunFiyat, UrunIndirim, SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimAyir, 0);
                        SB.Append("<td>" + SHOPClass.Finans.Cevirme.ParaFormat(U.IndirimTutari) + "</td>\r\n");

                        SB.Append("<td>" + "%" + SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.kdv_id).FirstOrDefault() + "</td>\r\n");

                        U.KDVTutari = SHOPClass.Finans.Hesaplama.KDVTutari(SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.fiyat).FirstOrDefault().ToString(), SHOPClass.Fonksiyonlar.Uygulama.CpyUrunBilgisiGetir(i.siparisler_urunler_id).Select(p => p.kdv_id).FirstOrDefault().ToString(), false);
                        SB.Append("<td>" + SHOPClass.Finans.Cevirme.ParaFormat(U.KDVTutari) + " " + ParaSimge + "</td>\r\n");

                        U.Adet = i.adet;
                        SB.Append("<td>" + U.Adet + "</td>\r\n");

                        U.ToplamFiyat = SHOPClass.Finans.Hesaplama.ToplamFiyat(U.BirimFiyat, U.IndirimTutari, U.KDVTutari, U.Adet);

                        SB.Append("<td>" + SHOPClass.Finans.Cevirme.ParaFormat(U.ToplamFiyat) + " " + ParaSimge + "</td>\r\n");
                        SB.Append("</tr>\r\n");

                        ListUrunler.Add(U);
                    }

                    liturunler.Text = SB.ToString();
                    #endregion

                    #region Fatura ve teslimat bilgileri
                    using (BaglantiCumlesi db1 = new BaglantiCumlesi())
                    {
                        var AdresSQL = (from a in db1.view_siparis_adresler
                                        where a.id == SiparisID
                                        select a).AsEnumerable();

                        if (AdresSQL.Any())
                        {
                            foreach (var i in AdresSQL)
                            {
                                StringBuilder sb = new StringBuilder();
                                sb.Append(i.FaturaBaslik + "<br />" + i.FaturaAdres + "<br />" + i.FaturaIlce + "/" + i.FaturaIl + "/" + i.FaturaUlke + " " + i.FaturaPostaKodu);

                                if (i.FaturaVergiTip == 0)
                                {
                                    sb.Append("<br />" + i.FaturaTcNo);
                                }
                                else
                                {
                                    sb.Append("<br />" + i.FaturaVergiDaire + " " + i.FaturaVergiNo);
                                }

                                LitFaturaAdres.Text = sb.ToString();
                                LitKargoAdres.Text = i.KargoBaslik + "<br />" + i.KargoAdres + "<br />" + i.KargoIlce + "/" + i.KargoIl + "/" + i.KargoUlke + " " + i.KargoPostaKodu + "<br />" + i.KargoAcikAdresAdres;
                            }
                        }
                    }
                    #endregion

                    #region Ödeme Bilgileri
                    if (OdemeSekliID == 1)
                    {
                        PanelKKBilgileri.Visible = false;
                        #region Ödeme Bildirimi
                        var OdemeBildirimiSQL = (from p in db.tbl_odeme_bildirimler
                                                 where p.siparis_id == SiparisID
                                                 let BankaBilgileri = db.tbl_cpy_odeme_bildirimler_hesap_nolar.Where(x => x.id == p.odeme_bildirimler_hesap_nolar_id)
                                                 select new
                                                 {
                                                     BankaBilgileri,
                                                     p.tip,
                                                     p.islem_no,
                                                     p.odeme_tarih,
                                                     p.tutar,
                                                     p.para_birimi_id,
                                                     p.tarih
                                                 }).AsEnumerable().Take(1);

                        if (OdemeBildirimiSQL.Any())
                        {
                            #region Ödeme Bilgileri
                            SB = new StringBuilder();

                            SB.Append("<tr>\r\n");
                            SB.Append("<td align=\"center\">" + Enum.Parse(typeof(BankaIslemTipleri), OdemeBildirimiSQL.Select(p => p.tip).FirstOrDefault().ToString()) + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + OdemeBildirimiSQL.Select(p => p.islem_no).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + OdemeBildirimiSQL.Select(p => p.odeme_tarih).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + OdemeBildirimiSQL.Select(p => p.tutar).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(OdemeBildirimiSQL.Select(p => p.para_birimi_id).FirstOrDefault().ToString()) + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + OdemeBildirimiSQL.Select(p => p.tarih).FirstOrDefault() + "</td>\r\n");
                            SB.Append("</tr>\r\n");

                            LitOdemeBilgileri.Text = SB.ToString();
                            #endregion

                            #region Banka Bilgileri
                            var BankaBilgileri = OdemeBildirimiSQL.Select(p => p.BankaBilgileri).FirstOrDefault().AsEnumerable();

                            if (BankaBilgileri.Any())
                            {
                                int BankaID = int.Parse(BankaBilgileri.Select(p => p.banka_id).FirstOrDefault().ToString());

                                SB = new StringBuilder();

                                SB.Append("<tr>\r\n");
                                SB.Append("<td align=\"center\">" + SHOPClass.Fonksiyonlar.Genel.BankaAdi(BankaID) + "</td>\r\n");
                                SB.Append("<td align=\"center\">" + BankaBilgileri.Select(p => p.sube).FirstOrDefault() + "</td>\r\n");
                                SB.Append("<td align=\"center\">" + BankaBilgileri.Select(p => p.sube_kodu).FirstOrDefault() + "</td>\r\n");
                                SB.Append("<td align=\"center\">" + BankaBilgileri.Select(p => p.hesap_sahibi).FirstOrDefault() + "</td>\r\n");
                                SB.Append("<td align=\"center\">" + BankaBilgileri.Select(p => p.hesap_no).FirstOrDefault() + "</td>\r\n");
                                SB.Append("<td align=\"center\">" + BankaBilgileri.Select(p => p.iban).FirstOrDefault() + "</td>\r\n");
                                SB.Append("</tr>\r\n");

                                LitBankaBilgileri.Text = SB.ToString();
                            }
                            #endregion
                        }
                        #endregion
                    }
                    else if (OdemeSekliID == 2)
                    {
                        PanelBankaBilgileri.Visible = false;
                        #region Kredi Kartı Ödeme Bilgiler
                        var KrediKartiBilgilerSQL = (from p in db.tbl_siparisler_odemeler_kk
                                                     where p.siparis_id == SiparisID
                                                     let OranveAy = db.tbl_cpy_sanal_pos_oranlar.Where(x => x.id == p.sanal_pos_oranlar_id).Select(x => new { x.oran, x.ay })
                                                     select new
                                                     {
                                                         p.banka_id,
                                                         p.sanal_pos_id,
                                                         ay = OranveAy.Select(x => x.ay).FirstOrDefault(),
                                                         oran = OranveAy.Select(x => x.oran).FirstOrDefault(),
                                                         p.ad_soyad,
                                                         p.kart_no,
                                                         p.islem_id,
                                                         p.onay_kodu,
                                                         p.referans_no,
                                                         p.tarih
                                                     }).AsEnumerable().Take(1);

                        if (KrediKartiBilgilerSQL.Any())
                        {
                            #region Kredi Kartı Bilgileri
                            SB = new StringBuilder();

                            int BankaID = KrediKartiBilgilerSQL.Select(p => p.banka_id).FirstOrDefault();

                            #region Hesaplama İşleri
                            double TaksitSayisi = double.Parse(KrediKartiBilgilerSQL.Select(p => p.ay).FirstOrDefault().ToString());
                            double Fiyat = double.Parse(SQL.Select(p => p.toplam).FirstOrDefault().ToString().ToString());
                            double Oran = double.Parse(KrediKartiBilgilerSQL.Select(p => p.oran).FirstOrDefault().ToString());
                            double TaksitFiyati = double.Parse(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(TaksitSayisi, Fiyat, Oran));
                            double Sonuc = (TaksitFiyati * TaksitSayisi);
                            #endregion

                            SB.Append("<tr>\r\n");
                            SB.Append("<td align=\"center\">" + SHOPClass.Fonksiyonlar.Genel.BankaAdi(BankaID) + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + KrediKartiBilgilerSQL.Select(p => p.sanal_pos_id).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + Oran.ToString() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + SHOPClass.Finans.Cevirme.ParaFormat(Sonuc.ToString()) + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + TaksitSayisi.ToString() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + SHOPClass.Finans.Cevirme.ParaFormat(TaksitFiyati.ToString()) + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + KrediKartiBilgilerSQL.Select(p => p.ad_soyad).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + KrediKartiBilgilerSQL.Select(p => p.kart_no).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + KrediKartiBilgilerSQL.Select(p => p.islem_id).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + KrediKartiBilgilerSQL.Select(p => p.onay_kodu).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + KrediKartiBilgilerSQL.Select(p => p.referans_no).FirstOrDefault() + "</td>\r\n");
                            SB.Append("<td align=\"center\">" + KrediKartiBilgilerSQL.Select(p => p.tarih).FirstOrDefault() + "</td>\r\n");
                            SB.Append("</tr>\r\n");

                            LitOdemeBilgileriKK.Text = SB.ToString();
                            #endregion
                        }
                        #endregion
                    }
                    #endregion
                }
            }
        }
    }
}