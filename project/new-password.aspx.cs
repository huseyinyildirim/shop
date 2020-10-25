using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class new_password : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        string eposta = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, HttpContext.Current.Request.QueryString["m"].ToString());
        string kod = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, HttpContext.Current.Request.QueryString["c"].ToString());

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
            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(248) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            btn_kayit_ol.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(180);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(248);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(248);

            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/", false);
                Context.ApplicationInstance.CompleteRequest();
            }

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
                    if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(SQL.Select(p => p.mail).FirstOrDefault()) == kod)
                    {
                        pnl_sifredegistermeformu.Visible = true;
                    }
                    else
                    {
                        pnl_sifredegistermeformu.Visible = false;
                        lit_uyarilar.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(251);
                    }
                }
                else
                {
                    lit_uyarilar.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(250);
                    pnl_sifredegistermeformu.Visible = false;
                }
            }
        }

        protected void btn_kayit_ol_Click(object sender, EventArgs e)
        {
            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar tbl = db.tbl_kullanicilar.First(p => p.mail == eposta);
                    tbl.sifre = SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_sifre.Text)));
                    db.SaveChanges();
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(252), "/login.aspx");
            }
            catch (Exception ex)
            {
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/new-password.aspx?m=" + eposta + "&c=" + kod);
            }
        }
    }
}