using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySQLDataModel;

namespace SHOP.admin.dummy
{
    public partial class siparis_kargo_bilgi_yazdir : System.Web.UI.Page
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

                        StringBuilder sb = new StringBuilder();
                        sb.Append(Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault() + "<br />");
                        sb.Append(Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.adres).FirstOrDefault());
                        LitGonderenAdres.Text = sb.ToString();
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
                                LitKargoAdres.Text = i.KargoBaslik + "<br />" + i.KargoAdres + "<br />" + i.KargoIlce + "/" + i.KargoIl + "/" + i.KargoUlke + " " + i.KargoPostaKodu;
                            }
                        }
                    }
                    #endregion
                }
            }
        }
    }
}