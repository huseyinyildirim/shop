using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class member_info : System.Web.UI.Page
    {
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        int KullaniciID;

        #region Boş VIEWSTATE
        protected override void SavePageStateToPersistenceMedium(object viewState)
        {
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null;
        }
        #endregion

        /*
     * Edit HY 14.08.12 15:20 Gelen QueryStringlere göre JS hata gösterme eklendi
     * Create HY 00.00.00 00:00
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
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(102) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; <a href=\"/customer-services.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(100) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(102);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(102).ToUpper();

            #region Kategoriler
            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(Class.Fonksiyonlar.Dil.ID(), 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
            #endregion

            btn_kullanici_guncelle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(180);

            if (!IsPostBack)
            {
                AlanKodu();
                Bilgilerim();
            }

            //HY 14.08.2012 15:20 BEGIN
            if (Request.QueryString["error"] != null && Request.QueryString["error"].ToString() != "")
            {
                switch (Request.QueryString["error"].ToString())
                {
                    case "mail":
                        Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(298));
                        break;
                }
            }
            //HY 14.08.2012 15:20 END
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

        protected void Bilgilerim()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_kullanicilar
                           where a.id == KullaniciID
                           select a);

                if (SQL.Any())
                {
                    txt_ad.Text = HttpUtility.HtmlDecode(SQL.Select(p => p.ad_soyad).FirstOrDefault());
                    txt_eposta.Text = HttpUtility.HtmlDecode(SQL.Select(p => p.mail).FirstOrDefault());
                    txt_telefon.Text = HttpUtility.HtmlDecode(SQL.Select(p => p.gsm).FirstOrDefault());
                    ddl_alan_kodu.SelectedValue = SQL.Select(p => p.alan_kodu_id).FirstOrDefault().ToString();

                    if (SQL.Select(p => p.mail).FirstOrDefault() != "")
                    {
                        txt_eposta.Enabled = false;
                    }

                    var SQL2 = (from a in db.tbl_maillist_mailler
                                where a.mail == (SQL.Select(p => p.mail).FirstOrDefault())
                                select new
                                {
                                    a.id
                                });

                    if (SQL2.Any())
                    {
                        maillist.Checked = true;
                    }
                }
                else
                {
                    Response.Redirect("/logout.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        protected void btn_kullanici_guncelle_Click(object sender, EventArgs e)
        {
            try
            {
                string mail = SHOPClass.Fonksiyonlar.Kullanici.Cagir.Bilgi(KullaniciID).Select(p => p.mail).FirstOrDefault();

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar Tbl = db.tbl_kullanicilar.First(p => p.id == KullaniciID);
                    Tbl.ad_soyad = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_ad.Text.Trim()));
                    Tbl.alan_kodu_id = int.Parse(Request.Form["ddl_alan_kodu"].ToString());
                    Tbl.gsm = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_telefon.Text.Trim()));
                    db.SaveChanges();
                }

                #region Şifre güncelleme
                if (sifre_guncelle.Checked == true)
                {
                    if (SHOPClass.Fonksiyonlar.Kullanici.Kontroller.Sifre(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text.Trim()), SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eski_sifre.Text.Trim()))))
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_kullanicilar Tbl = db.tbl_kullanicilar.First(p => p.id == (SHOPClass.Fonksiyonlar.Kullanici.Genel.ID()));
                            Tbl.sifre = HttpUtility.HtmlEncode(SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_sifre.Text.Trim())));
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(185));
                    }
                }
                #endregion

                #region Maillist ayarı
                if (maillist.Checked == true)
                {
                    #region Maillist ekleme
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
                            Tbl.mail = mail;
                            Tbl.ad_soyad = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["txt_ad"].ToString()));
                            Tbl.durum = true;
                            Tbl.tip = false;
                            db.AddTotbl_maillist_mailler(Tbl);
                            db.SaveChanges();
                        }
                    }
                    #endregion
                }
                else
                {
                    #region Maillistten çıkarma
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        tbl_maillist_mailler ta = (from p in db.tbl_maillist_mailler where p.mail == mail select p).FirstOrDefault();
                        db.DeleteObject(ta);
                        db.SaveChanges();
                    }
                    #endregion
                }
                #endregion

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(184), "/member-info.aspx");
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.ToString(), "/member-info.aspx");
            }
        }
    }
}