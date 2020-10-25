using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySQLDataModel;

//!++ Ürün fiyatları hesaplarken ürün fiyatı yabancı para birimi olarak belirtilmişse hesaplayarak listeye eklemeli!

namespace SHOP.admin.dummy
{
    public partial class siparisteki_urunler : System.Web.UI.Page
    {
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
                               p.kullanici_id
                           }).AsEnumerable().Take(1);

                if (SQL.Any())
                {
                    StringBuilder SB = new StringBuilder();

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
                }
            }
        }
    }
}