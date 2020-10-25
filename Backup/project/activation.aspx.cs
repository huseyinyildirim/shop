using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class activation : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        string eposta = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, HttpContext.Current.Request.QueryString["m"].ToString());
        string kod = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, HttpContext.Current.Request.QueryString["c"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(246) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(246);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(246);

            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/",false);
                Context.ApplicationInstance.CompleteRequest();
            }

            Aktivasyon();
        }

        protected void Aktivasyon()
        {
            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_kullanicilar
                               where a.mail == eposta
                               select new
                               {
                                   a.mail,
                                   a.onay,
                                   a.id
                               });

                    if (SQL.Any())
                    {
                        if (SQL.Select(p => p.onay).FirstOrDefault() == true)
                        {
                            lit_uyarilar.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(255);
                        }
                        else
                        {
                            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(SQL.Select(p => p.mail).FirstOrDefault()) == kod)
                            {
                                tbl_kullanicilar tbl = db.tbl_kullanicilar.First(p => p.mail == eposta);
                                tbl.onay = true;
                                db.SaveChanges();

                                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(253), "/login.aspx");
                            }
                            else
                            {
                                lit_uyarilar.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(254);
                            }
                        }
                    }
                    else
                    {
                        lit_uyarilar.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(250);
                    }
                }
            }
            catch (Exception ex)
            {
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/");
            }
        }
    }
}