using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySQLDataModel;

//!++ Ürün fiyatları hesaplarken ürün fiyatı yabancı para birimi olarak belirtilmişse hesaplayarak listeye eklemeli!

namespace SHOP.admin.dummy
{
    public partial class odeme_bilgileri : System.Web.UI.Page
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
                           where p.id == SiparisID
                           select p).AsEnumerable().Take(1);

                if (SQL.Any())
                {
                    StringBuilder SB = new StringBuilder();

                    #region Ödeme Şekli
                    int OdemeSekliID = SQL.Select(p => p.odeme_sekli_id).FirstOrDefault();
                    //LitOdemeSekli.Text = db.tbl_sbt_odeme_sekli.Where(x => x.id == OdemeSekliID).Select(x => x.ad).FirstOrDefault();
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