using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySQLDataModel;

//!++ Ürün fiyatları hesaplarken ürün fiyatı yabancı para birimi olarak belirtilmişse hesaplayarak listeye eklemeli!

namespace SHOP.admin.dummy
{
    public partial class siparis_kargo_bilgi : System.Web.UI.Page
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
                }
            }
        }
    }
}