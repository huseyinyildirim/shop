using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class question : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();

        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        public Dictionary<int, string> Resimler = new Dictionary<int, string>();
        public Dictionary<int, string> Videolar = new Dictionary<int, string>();

        public List<string> Keywords = new List<string>();
        public List<string> Etiketler = new List<string>();
        public List<string> Markalar = new List<string>();
        public List<string> UrunKodlari = new List<string>();
        public List<string> UrunAdlari = new List<string>();

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
            if (!SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/login.aspx?ReturnUrl=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), false);
                Context.ApplicationInstance.CompleteRequest();
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(269) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> " + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + " &raquo; <a href=\"/customer-services.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(100) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(269);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(269).ToUpper();
            btn_iletisim_gonder.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(18);

            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();
            Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Etiketler(DilID);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Etiketler(Etiketler);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            KeywordsBas();
        }

        private void KeywordsBas()
        {
            Keywords.AddRange(new List<string>(Kategoriler.Values));
            Keywords.AddRange(Markalar);
            Keywords.AddRange(Etiketler);
            Keywords.AddRange(UrunKodlari);
            Keywords.AddRange(UrunAdlari);

            List<string> L = Keywords.Distinct().ToList().ConvertAll(x => Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, x.ToString().ToLower()));

            StringBuilder SB2 = new StringBuilder();

            int a = 0;

            foreach (var i in L)
            {
                if (a != L.Count - 1)
                {
                    SB2.Append(i + ",");
                }
                else
                {
                    SB2.Append(i);
                }

                a++;
            }

            if (!string.IsNullOrEmpty(SB2.ToString()))
            {
                if (SB2.ToString().Substring(SB2.ToString().Length - 1, 1) == ",")
                {
                    SB2.Append(Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                }
            }

            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "keywords", "<meta http-equiv=\"Keywords\" content=\"" + SB2.ToString().Replace(", ", ",").Replace(",", ", ") + "\" />");
        }

        protected void btn_iletisim_gonder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        tbl_iletisimler ta = new tbl_iletisimler();
                        ta.ad_soyad = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_ad.Text.Trim()));
                        ta.mail = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text.Trim()));
                        ta.telefon = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_telefon.Text.Trim()));
                        ta.gorusler = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_mesaj.Text.Trim().Replace("\r\n", "<br/>" + Class.Degiskenler.Diger.vbCrLf)));
                        db.AddTotbl_iletisimler(ta);
                        db.SaveChanges();

                        Class.Fonksiyonlar.Admin.Log.AllHttp("tbl_iletisimler", ta.id);

                        string KullaniciAdi, Sifre, Host;
                        int Port;
                        Class.Fonksiyonlar.Genel.Mail.Bilgiler(out KullaniciAdi, out Sifre, out Host, out Port);
                        Class.Fonksiyonlar.Genel.Mail.Gonder(KullaniciAdi, Sifre, Host, Port, Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.mail).FirstOrDefault(), null, null, Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text.Trim()), Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_ad.Text.Trim()), Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.marka).FirstOrDefault() + " - DESTEK", Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_mesaj.Text.Trim().Replace("\r\n", "<br/>")), true);
                    }

                    txt_ad.Text = null;
                    txt_eposta.Text = null;
                    txt_telefon.Text = null;
                    txt_mesaj.Text = null;

                    Class.Fonksiyonlar.JavaScript.Ekle("alert('" + Class.Fonksiyonlar.Uygulama.SabitlerText(37) + "')");
                }
                catch (Exception ex)
                {
                    Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/bize-sorun.aspx");
                }
            }
            else
            {
                txt_ad.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["txt_ad"].ToString());
                txt_eposta.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["txt_eposta"].ToString());
                txt_telefon.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["txt_telefon"].ToString());
                txt_mesaj.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["txt_mesaj"].ToString());

                Class.Fonksiyonlar.JavaScript.Ekle("alert('" + Class.Fonksiyonlar.Uygulama.SabitlerText(36) + "')");
            }
        }
    }
}