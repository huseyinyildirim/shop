using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class register : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

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
            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(60) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            btn_kayit_ol.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(74);
            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(60);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(60).ToUpper();

            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/", false);
                Context.ApplicationInstance.CompleteRequest();
            }

            if (!IsPostBack)
            {
                AlanKodu();
            }
        }

        protected void AlanKodu()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_ulke select new { a.kisaltma, a.alan_kodu });

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        ddl_alan_kodu.Items.Add(new ListItem(i.kisaltma + " (+" + i.alan_kodu.ToString() + ")", i.alan_kodu.ToString()));
                    }
                }
                else
                {
                    ddl_alan_kodu.Enabled = false;
                }
            }
        }

        protected void btn_kayit_ol_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string EPosta = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text));
                    using (BaglantiCumlesi db1 = new BaglantiCumlesi())
                    {
                        var SQL = (from a in db1.tbl_kullanicilar
                                   where a.mail == EPosta
                                   select new
                                   {
                                       a.id
                                   });

                        if (SQL.Any())
                        {
                            Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(92));
                        }
                        else
                        {
                            MailListEkle();
                            SHOPClass.Fonksiyonlar.Kullanici.Genel.KullaniciOlustur(1, "", "", txt_ad.Text.Trim(), txt_eposta.Text.Trim(), txt_sifre.Text.Trim(), int.Parse(Request.Form["ddl_alan_kodu"].ToString()), txt_telefon.Text.Trim(), false);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/");
                }
            }
            else
            {
                Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(36));
            }
        }

        protected void MailListEkle()
        {
            if (maillist.Checked)
            {
                string mail = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text);
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_maillist_mailler
                               where a.mail == mail
                               select new
                               {
                                   a.id
                               });

                    if (!SQL.Any())
                    {
                        tbl_maillist_mailler Tbl = new tbl_maillist_mailler();
                        Tbl.mail = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text));
                        Tbl.ad_soyad = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_ad.Text));
                        Tbl.durum = true;
                        Tbl.tip = false;
                        db.AddTotbl_maillist_mailler(Tbl);
                        db.SaveChanges();
                    }
                }
            }
        }
    }
}