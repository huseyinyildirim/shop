using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using AuthLib;
using DotNetOpenAuth.OpenId.RelyingParty;

namespace SHOP
{
    public partial class login : System.Web.UI.Page
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
            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/", false);
                Context.ApplicationInstance.CompleteRequest();
            }

            if (Request.QueryString["p"] != null)
            {
                if (Request.QueryString["p"].ToString() != null)
                {
                    switch (Request.QueryString["p"].ToString())
                    {
                        case "google":
                            SHOPClass.Fonksiyonlar.Kullanici.Genel.GoogleGiris();
                            break;

                        case "facebook":
                            SHOPClass.Fonksiyonlar.Kullanici.Genel.FacebookGiris();
                            break;

                        case "twitter":
                            SHOPClass.Fonksiyonlar.Kullanici.Genel.TwitterKontrol();
                            break;
                    }
                }
            }
            else
            {
                SHOPClass.Fonksiyonlar.Kullanici.Genel.GoogleKontrol();
                SHOPClass.Fonksiyonlar.Kullanici.Genel.TwitterKontrol();
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(98) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = (string)Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault();

            btn_uye_giris.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(93);
            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(98);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            #region Sosyal ağ eklentileri
            if (SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(2).Select(x => x.onay).FirstOrDefault() == false)
            {
                btn_facebook.Visible = false;
            }

            if (SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(3).Select(x => x.onay).FirstOrDefault() == false)
            {
                btn_twitter.Visible = false;
            }

            if (SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(4).Select(x => x.onay).FirstOrDefault() == false)
            {
                btn_google.Visible = false;
            }

            if (SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(2).Select(x => x.onay).FirstOrDefault() == false && SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(3).Select(x => x.onay).FirstOrDefault() == false && SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(4).Select(x => x.onay).FirstOrDefault() == false)
            {
                GenelGosterim.Visible = false;
            }
            #endregion
        }

        protected void kullanici_giris_Click(object sender, EventArgs e)
        {
            try
            {
                SHOPClass.Fonksiyonlar.Kullanici.Kontroller.KullaniciAdiKontrol(txt_eposta.Text.Trim(), txt_sifre2.Text.Trim());
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/login.aspx");
            }
        }

        protected void btn_google_Click(object sender, EventArgs e)
        {
            try
            {
                #region bağlanma isteği gidiyor
                using (OpenIdRelyingParty openid2 = new OpenIdRelyingParty())
                {
                    var b = new UriBuilder(Request.Url) { Query = "" };
                    var req = openid2.CreateRequest("https://www.google.com/accounts/o8/id", b.Uri, b.Uri);
                    req.RedirectToProvider();
                }
                #endregion
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        protected void btn_twitter_Click(object sender, EventArgs e)
        {
            try
            {
                var OAuth = new oAuth
                            {
                                ConsumerKey = SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(3).Select(x => x.app_id).FirstOrDefault(),
                                ConsumerSecret = SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(3).Select(x => x.app_key).FirstOrDefault(),
                                REQUEST_TOKEN = "https://api.twitter.com/oauth/request_token",
                                ACCESS_TOKEN = "https://api.twitter.com/oauth/access_token",
                                AUTHORIZE = "https://api.twitter.com/oauth/authorize"
                            };

                Response.Redirect(OAuth.AuthorizationLinkGet(), false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        protected void btn_facebook_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("https://www.facebook.com/dialog/oauth?client_id=" + SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(2).Select(x => x.app_id).FirstOrDefault() + "&redirect_uri=" + Class.Fonksiyonlar.FirmaDomainHttpKontrol() + "/login.aspx?p=facebook&scope=email", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }
    }
}