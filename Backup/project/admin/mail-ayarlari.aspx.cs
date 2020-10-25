using System;
using System.Data.Objects.DataClasses;
using System.Linq;
using Ext.Net;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class mail_ayarlari : System.Web.UI.Page
    {
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
                //Veriler();
            }
            #endregion
        }

        #region Boş VIEWSTATE
        protected override void SavePageStateToPersistenceMedium(object viewState)
        {
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null;
        }
        #endregion

        protected void Veriler(object sender, DirectEventArgs e)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_sbt_mail
                           where p.id == 1
                           select p);

                TextFieldKullaniciAdi.Text = SQL.Select(x => x.kullanici_adi).FirstOrDefault();
                TextFieldSifre.Text = SQL.Select(x => x.sifre).FirstOrDefault();
                TextFieldHost.Text = SQL.Select(x => x.host).FirstOrDefault();
                TextFieldPort.Text = SQL.Select(x => x.port).FirstOrDefault();
            }
        }

        protected void Guncelle(object sender, DirectEventArgs e)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                tbl_sbt_mail ta = (from p in db.tbl_sbt_mail where p.id == 1 select p).FirstOrDefault();

                if (TextFieldKullaniciAdi.Text != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldKullaniciAdi.Text.Trim())))
                    {
                        ta.kullanici_adi = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldKullaniciAdi.Text.Trim());
                    }
                }

                if (TextFieldSifre.Text != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldSifre.Text.Trim())))
                    {
                        ta.sifre = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldSifre.Text.Trim());
                    }
                }

                if (TextFieldHost.Text != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldHost.Text.Trim())))
                    {
                        ta.host = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldHost.Text.Trim());
                    }
                }

                if (TextFieldPort.Text != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldPort.Text.Trim())))
                    {
                        ta.port = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, TextFieldPort.Text.Trim());
                    }
                }

                db.SaveChanges();

                #region Admin İşlem Log
                Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                #endregion
            }

            Response.Redirect(Class.Fonksiyonlar.Genel.MevcutSayfa(), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}