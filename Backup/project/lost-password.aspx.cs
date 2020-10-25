using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class lost_password : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        /*#region VIEWSTATE Serializer
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
        #endregion*/

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
            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/", false);
                Context.ApplicationInstance.CompleteRequest();
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(226) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            btn_kayit_ol.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(227);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(226);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(226).ToUpper();
        }

        protected void btn_kayit_ol_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string EPosta = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text));
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        var SQL = (from a in db.tbl_kullanicilar where a.mail == EPosta select a);
                        if (SQL.Any())
                        {
                            #region Mail
                            string MailMetin = Class.Fonksiyonlar.Uygulama.SabitlerText(247);
                            MailMetin = MailMetin.Replace("{{FirmaLogo}}", "<img src=\"http://" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault() + "/images/logo.png\" alt=\"" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault() + "\" />");
                            MailMetin = MailMetin.Replace("{{MusteriAdi}}", SQL.Select(p => p.ad_soyad).FirstOrDefault());
                            MailMetin = MailMetin.Replace("{{MusteriEposta}}", SQL.Select(p => p.mail).FirstOrDefault());
                            MailMetin = MailMetin.Replace("{{SifreDegistirLink}}", "<a target=\"_blank\" href=\"http://" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault() + "/new-password.aspx?m=" + SQL.Select(p => p.mail).FirstOrDefault() + "&c=" + SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(SQL.Select(p => p.mail).FirstOrDefault()) + "\">http://" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault() + "/new-password.aspx?m=" + SQL.Select(p => p.mail).FirstOrDefault() + "&c=" + SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(SQL.Select(p => p.mail).FirstOrDefault()) + "</a>");
                            MailMetin = MailMetin.Replace("{{FirmaAdi}}", Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault());

                            string KullaniciAdi, Sifre, Host;
                            int Port;
                            Class.Fonksiyonlar.Genel.Mail.Bilgiler(out KullaniciAdi, out Sifre, out Host, out Port);
                            Class.Fonksiyonlar.Genel.Mail.Gonder(KullaniciAdi, Sifre, Host, Port, SQL.Select(p => p.mail).FirstOrDefault(), null, null, Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.mail).FirstOrDefault(), Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault(), Class.Fonksiyonlar.Uygulama.SabitlerText(248), MailMetin, true);
                            #endregion

                            Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(249), "/");
                        }
                        else
                        {
                            Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(250));
                        }
                    }
                }
                else
                {
                    Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(36));
                }
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/");
            }
        }
    }
}