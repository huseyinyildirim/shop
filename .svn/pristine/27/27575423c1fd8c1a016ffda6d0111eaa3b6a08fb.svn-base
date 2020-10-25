using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;
using SHOP.ViewState;

namespace SHOP
{
    public partial class member_address : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID;
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        #region VIEWSTATE Serializer
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
        #endregion

        /*
        #region Boş VIEWSTATE
        protected override void SavePageStateToPersistenceMedium(object viewState)
        {
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null;
        }
        #endregion
        */

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/login.aspx?ReturnUrl=/member-address.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; <a href=\"/customer-services.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(230) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(118);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(118);
            btn_yenifaturadresekle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(141);
            btn_yeniteslimatadresekle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(141);
            btn_faturaadresekle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(142);
            btn_teslimatadresekle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(142);
            btn_faturaadresduzenle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(180);
            btn_teslimatadresduzenle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(180);
            btn_iptal.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(262);
            btn_iptal0.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(262);
            btn_sil.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(282);
            btn_sil0.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(282);
            btn_sepetegit.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(228);

            if (!IsPostBack)
            {
                Kategori();
                Adresler();

                lbl_baslik.InnerText = Class.Fonksiyonlar.Uygulama.SabitlerText(147);
                txt_faturatip.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(143), "0"));
                txt_faturatip.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(144), "1"));

                txt_ulke_id.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                txt_ulke_id0.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                txt_il.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                txt_il0.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                txt_ilce.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                txt_ilce0.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));

                UlkeYukle(true);
                UlkeYukle(false);
                GelenVeri();
            }
        }

        protected void Kategori()
        {
            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
        }

        protected void GelenVeri()
        {
            if (Request.QueryString["p"] != null)
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    switch (Request.QueryString["p"].ToString())
                    {
                        case "invoice_new":
                            div_yenifaturaadres.Visible = true;
                            btn_faturaadresduzenle.Visible = false;
                            btn_faturaadresekle.Visible = true;
                            btn_sil.Visible = false;

                            break;
                        case "invoice":
                            div_yenifaturaadres.Visible = true;
                            btn_faturaadresduzenle.Visible = true;
                            btn_faturaadresekle.Visible = false;
                            btn_sil.Visible = true;

                            if (Request.QueryString["ID"] != null)
                            {
                                if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["ID"].ToString())))
                                {
                                    if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(Request.QueryString["ID"].ToString()))
                                    {
                                        int AdresID = int.Parse(Request.QueryString["ID"].ToString());

                                        var SQL = (from a in db.tbl_kullanicilar_adresler
                                                   where a.kullanici_id == KullaniciID && a.id == AdresID && a.tip == false
                                                   select new
                                                   {
                                                       a.tip,
                                                       a.baslik,
                                                       a.posta_kodu,
                                                       a.adres,
                                                       a.ulke_id,
                                                       a.il_id,
                                                       a.ilce_id,
                                                       faturatip = (db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == AdresID && p.kullanici_id == KullaniciID).Select(p => p.tip).FirstOrDefault()),
                                                       vergino = (db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == AdresID && p.kullanici_id == KullaniciID).Select(p => p.vergi_no).FirstOrDefault()),
                                                       vergidaire = (db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == AdresID && p.kullanici_id == KullaniciID).Select(p => p.vergi_dairesi).FirstOrDefault()),
                                                       tcno = (db.tbl_kullanicilar_vergi_bilgiler.Where(p => p.adres_id == AdresID && p.kullanici_id == KullaniciID).Select(p => p.tc_kimlik_no).FirstOrDefault())
                                                   }).AsEnumerable();

                                        if (SQL.Any())
                                        {
                                            foreach (var i in SQL)
                                            {
                                                txt_faturatip.Text = i.faturatip.ToString().Replace("False", "0").Replace("True", "1");
                                                txt_ulke_id.Text = i.ulke_id.ToString();
                                                txt_baslik.Text = HttpUtility.HtmlDecode(i.baslik);
                                                txt_postakodu.Text = HttpUtility.HtmlDecode(i.posta_kodu);
                                                txt_adres.Text = HttpUtility.HtmlDecode(i.adres);
                                                txt_vergidaire.Text = HttpUtility.HtmlDecode(i.vergidaire);
                                                txt_vergino.Text = HttpUtility.HtmlDecode(i.vergino);
                                                txt_tcno.Text = HttpUtility.HtmlDecode(i.tcno);

                                                switch (i.faturatip)
                                                {
                                                    // 0 kişisel, 1 kurumsal
                                                    case true:
                                                        txt_vergidaire.Enabled = true;
                                                        txt_vergino.Enabled = true;
                                                        txt_tcno.Enabled = false;
                                                        txt_faturatip.Text = "1";
                                                        lbl_baslik.InnerText = Class.Fonksiyonlar.Uygulama.SabitlerText(146);
                                                        break;
                                                    case false:
                                                        txt_vergidaire.Enabled = false;
                                                        txt_vergino.Enabled = false;
                                                        txt_tcno.Enabled = true;
                                                        txt_faturatip.Text = "0";
                                                        lbl_baslik.InnerText = Class.Fonksiyonlar.Uygulama.SabitlerText(147);
                                                        break;
                                                }
                                                UlkeYukle(false);
                                                txt_ulke_id.Text = i.ulke_id.ToString();

                                                IlYukle(i.ulke_id, false);
                                                txt_il.Text = i.il_id.ToString();

                                                IlceYukle(int.Parse(i.il_id.ToString()), false);
                                                txt_ilce.Text = i.ilce_id.ToString();

                                                ddl_faturaadres.Text = Request.QueryString["ID"].ToString();
                                            }
                                        }
                                    }
                                    else
                                    {
                                        Response.Redirect("/member-address.aspx", false);
                                        Context.ApplicationInstance.CompleteRequest();
                                    }
                                }
                                else
                                {
                                    Response.Redirect("/member-address.aspx", false);
                                    Context.ApplicationInstance.CompleteRequest();
                                }
                            }
                            else
                            {
                                Response.Redirect("/member-address.aspx", false);
                                Context.ApplicationInstance.CompleteRequest();
                            }

                            break;
                        case "cargo_new":
                            div_yeniteslimatadres.Visible = true;
                            btn_teslimatadresduzenle.Visible = false;
                            btn_teslimatadresekle.Visible = true;
                            btn_sil0.Visible = false;

                            break;
                        case "cargo":
                            div_yeniteslimatadres.Visible = true;
                            btn_teslimatadresduzenle.Visible = true;
                            btn_teslimatadresekle.Visible = false;
                            btn_sil0.Visible = true;

                            if (Request.QueryString["ID"] != null)
                            {
                                if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["ID"].ToString())))
                                {
                                    if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(Request.QueryString["ID"].ToString()))
                                    {
                                        int AdresID = int.Parse(Request.QueryString["ID"].ToString());

                                        var SQL = (from a in db.tbl_kullanicilar_adresler
                                                   where a.kullanici_id == KullaniciID && a.id == AdresID && a.tip == true
                                                   select new
                                                   {
                                                       a.tip,
                                                       a.baslik,
                                                       a.posta_kodu,
                                                       a.adres,
                                                       a.ulke_id,
                                                       a.il_id,
                                                       a.ilce_id,
                                                       a.acik_adres
                                                   }).AsEnumerable();

                                        if (SQL.Any())
                                        {
                                            foreach (var i in SQL)
                                            {
                                                //txt_faturatip.Text = i.faturatip.ToString().Replace("False", "0").Replace("True", "1");
                                                txt_ulke_id0.Text = i.ulke_id.ToString();
                                                txt_isim0.Text = HttpUtility.HtmlDecode(i.baslik);
                                                txt_postakodu0.Text = HttpUtility.HtmlDecode(i.posta_kodu);
                                                txt_adres0.Text = HttpUtility.HtmlDecode(i.adres);
                                                txt_acikadres0.Text = HttpUtility.HtmlDecode(i.acik_adres);

                                                UlkeYukle(false);
                                                txt_ulke_id0.Text = i.ulke_id.ToString();

                                                IlYukle(i.ulke_id, true);
                                                txt_il0.Text = i.il_id.ToString();

                                                IlceYukle(int.Parse(i.il_id.ToString()), true);
                                                txt_ilce0.Text = i.ilce_id.ToString();

                                                ddl_teslimatadres.Text = Request.QueryString["ID"].ToString();
                                            }
                                        }
                                    }
                                    else
                                    {
                                        Response.Redirect("/member-address.aspx", false);
                                        Context.ApplicationInstance.CompleteRequest();
                                    }
                                }
                                else
                                {
                                    Response.Redirect("/member-address.aspx", false);
                                    Context.ApplicationInstance.CompleteRequest();
                                }
                            }
                            else
                            {
                                Response.Redirect("/member-address.aspx", false);
                                Context.ApplicationInstance.CompleteRequest();
                            }

                            break;
                        default:
                            Response.Redirect("/member-address.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                            break;
                    }
                }
            }
        }

        protected void UlkeYukle(bool tur)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_ulke orderby a.ad ascending select new { a.id, a.ad });

                if (SQL.Any())
                {
                    switch (tur)
                    {
                        case false:
                            foreach (var i in SQL)
                            {
                                txt_ulke_id.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.ad), i.id.ToString()));
                            }
                            break;
                        case true:
                            foreach (var i in SQL)
                            {
                                txt_ulke_id0.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.ad), i.id.ToString()));
                            }
                            break;
                    }
                }
            }
        }

        protected void IlYukle(int UlkeID, bool tur)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_ulke_il where a.ulke_id == UlkeID orderby a.plaka ascending select new { a.id, a.ad });

                if (SQL.Any())
                {
                    switch (tur)
                    {
                        case false:
                            foreach (var i in SQL)
                            {
                                txt_il.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.ad), i.id.ToString()));
                            }
                            break;
                        case true:
                            foreach (var i in SQL)
                            {
                                txt_il0.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.ad), i.id.ToString()));
                            }
                            break;
                    }
                }
            }
        }

        protected void IlceYukle(int IlID, bool tur)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_ulke_ilce where a.il_id == IlID orderby a.ad ascending select new { a.id, a.ad });

                if (SQL.Any())
                {
                    switch (tur)
                    {
                        case false:
                            foreach (var i in SQL)
                            {
                                txt_ilce.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.ad), i.id.ToString()));
                            }
                            break;
                        case true:
                            foreach (var i in SQL)
                            {
                                txt_ilce0.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.ad), i.id.ToString()));
                            }
                            break;
                    }
                }
            }
        }

        protected void Adresler()
        {
            ddl_faturaadres.Items.Clear();
            ddl_teslimatadres.Items.Clear();

            #region Fatura adresleri
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_kullanicilar_adresler
                           where a.kullanici_id == KullaniciID && a.tip == false
                           orderby a.baslik ascending
                           select new
                           {
                               a.id,
                               a.baslik
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    ddl_faturaadres.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                    foreach (var i in SQL)
                    {
                        ddl_faturaadres.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.baslik), "/member-address.aspx?p=invoice&ID=" + i.id.ToString()));
                    }
                }
            #endregion

                #region Kargo adresleri
                var SQL2 = (from a in db.tbl_kullanicilar_adresler
                            where a.kullanici_id == KullaniciID && a.tip == true
                            orderby a.baslik ascending
                            select new
                            {
                                a.id,
                                a.baslik
                            }).AsEnumerable();

                if (SQL2.Any())
                {
                    ddl_teslimatadres.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                    foreach (var i in SQL)
                    {
                        ddl_teslimatadres.Items.Add(new ListItem(HttpUtility.HtmlDecode(i.baslik), "/member-address.aspx?p=cargo&ID=" + i.id.ToString()));
                    }
                }
            }
                #endregion
        }

        protected void btn_yenifaturadresekle_Click(object sender, EventArgs e)
        {
            Response.Redirect("/member-address.aspx?p=invoice_new", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btn_yeniteslimatadresekle_Click(object sender, EventArgs e)
        {
            Response.Redirect("/member-address.aspx?p=cargo_new", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btn_faturaadresekle_Click(object sender, EventArgs e)
        {
            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar_adresler Tbl = new tbl_kullanicilar_adresler();
                    Tbl.kullanici_id = KullaniciID;
                    Tbl.tip = false;
                    Tbl.baslik = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_baslik.Text));
                    Tbl.adres = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_adres.Text));
                    Tbl.posta_kodu = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_postakodu.Text));
                    Tbl.ulke_id = int.Parse(Request.Form["txt_ulke_id"].ToString());

                    if (!string.IsNullOrEmpty(Request.Form["txt_il"]))
                    {
                        Tbl.il_id = int.Parse(Request.Form["txt_il"].ToString());
                    }

                    if (!string.IsNullOrEmpty(Request.Form["txt_ilce"]))
                    {
                        Tbl.ilce_id = int.Parse(Request.Form["txt_ilce"].ToString());
                    }

                    db.AddTotbl_kullanicilar_adresler(Tbl);
                    db.SaveChanges();

                    var SQL = (from a in db.tbl_kullanicilar_adresler
                               where a.kullanici_id == KullaniciID
                               orderby a.id descending
                               select new
                               {
                                   a.id
                               }).AsEnumerable().Take(1);

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            VergiBilgiEkle(i.id);
                        }
                    }
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(286), "/member-address.aspx");
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/member-address.aspx");
            }
        }

        protected void VergiBilgiEkle(int AdresID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                tbl_kullanicilar_vergi_bilgiler tblekle = new tbl_kullanicilar_vergi_bilgiler();
                tblekle.kullanici_id = KullaniciID;
                tblekle.adres_id = AdresID;
                tblekle.tip = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["txt_faturatip"].ToString()));
                tblekle.vergi_dairesi = HttpUtility.HtmlEncode(txt_vergidaire.Text);
                tblekle.vergi_no = HttpUtility.HtmlEncode(txt_vergino.Text);
                tblekle.tc_kimlik_no = HttpUtility.HtmlEncode(txt_tcno.Text);
                db.AddTotbl_kullanicilar_vergi_bilgiler(tblekle);
                db.SaveChanges();
            }
        }

        protected void btn_teslimatadresekle_Click(object sender, EventArgs e)
        {
            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar_adresler Tbl = new tbl_kullanicilar_adresler();
                    Tbl.kullanici_id = KullaniciID;
                    Tbl.tip = true;
                    Tbl.baslik = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_isim0.Text));
                    Tbl.adres = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_adres0.Text));
                    Tbl.posta_kodu = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_postakodu0.Text));
                    Tbl.ulke_id = int.Parse(Request.Form["txt_ulke_id0"].ToString());

                    if (!string.IsNullOrEmpty(Request.Form["txt_il0"]))
                    {
                        Tbl.il_id = int.Parse(Request.Form["txt_il0"].ToString());
                    }

                    if (!string.IsNullOrEmpty(Request.Form["txt_ilce0"]))
                    {
                        Tbl.ilce_id = int.Parse(Request.Form["txt_ilce0"].ToString());
                    }

                    Tbl.acik_adres = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_acikadres0.Text));
                    db.AddTotbl_kullanicilar_adresler(Tbl);
                    db.SaveChanges();
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(287), "/member-address.aspx");
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/member-address.aspx");
            }
        }

        protected void btn_faturaadresduzenle_Click(object sender, EventArgs e)
        {
            try
            {
                int AdresID = int.Parse(Request.QueryString["ID"].ToString());

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar_adresler Tbl = db.tbl_kullanicilar_adresler.First(p => p.kullanici_id == KullaniciID && p.id == AdresID);
                    Tbl.tip = false;
                    Tbl.baslik = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_baslik.Text));
                    Tbl.adres = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_adres.Text));
                    Tbl.posta_kodu = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_postakodu.Text));
                    Tbl.ulke_id = int.Parse(Request.Form["txt_ulke_id"]);

                    if (!string.IsNullOrEmpty(Request.Form["txt_il"]))
                    {
                        Tbl.il_id = int.Parse(Request.Form["txt_il"].ToString());
                    }
                    if (!string.IsNullOrEmpty(Request.Form["txt_ilce"]))
                    {
                        Tbl.ilce_id = int.Parse(Request.Form["txt_ilce"].ToString());
                    }

                    db.SaveChanges();

                    tbl_kullanicilar_vergi_bilgiler tblekle = db.tbl_kullanicilar_vergi_bilgiler.First(p => p.kullanici_id == KullaniciID && p.adres_id == AdresID);
                    tblekle.tip = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["txt_faturatip"].ToString()));
                    tblekle.vergi_dairesi = HttpUtility.HtmlEncode(txt_vergidaire.Text);
                    tblekle.vergi_no = HttpUtility.HtmlEncode(txt_vergino.Text);
                    tblekle.tc_kimlik_no = HttpUtility.HtmlEncode(txt_tcno.Text);
                    db.SaveChanges();
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(281), "/member-address.aspx?p=invoice&ID=" + Request.QueryString["ID"].ToString() + "");
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/member-address.aspx?p=invoice&ID=" + Request.QueryString["ID"].ToString() + "");
            }
        }

        protected void btn_teslimatadresduzenle_Click(object sender, EventArgs e)
        {
            try
            {
                int AdresID = int.Parse(Request.QueryString["ID"].ToString());

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar_adresler Tbl = db.tbl_kullanicilar_adresler.First(p => p.kullanici_id == KullaniciID && p.id == AdresID && p.tip == true);
                    Tbl.baslik = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_isim0.Text));
                    Tbl.adres = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_adres0.Text));
                    Tbl.posta_kodu = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_postakodu0.Text));
                    Tbl.ulke_id = int.Parse(Request.Form["txt_ulke_id0"].ToString());

                    if (!string.IsNullOrEmpty(Request.Form["txt_il0"]))
                    {
                        Tbl.il_id = int.Parse(Request.Form["txt_il0"].ToString());
                    }

                    if (!string.IsNullOrEmpty(Request.Form["txt_ilce0"]))
                    {
                        Tbl.ilce_id = int.Parse(Request.Form["txt_ilce0"].ToString());
                    }

                    Tbl.acik_adres = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_acikadres0.Text));
                    db.SaveChanges();
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(285), "/member-address.aspx?p=cargo&ID=" + Request.QueryString["ID"].ToString() + "");
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/member-address.aspx?p=cargo&ID=" + Request.QueryString["ID"].ToString() + "");
            }
        }

        protected void btn_iptal_Click(object sender, EventArgs e)
        {
            Response.Redirect("member-address.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
            try
            {
                int AdresID = int.Parse(Request.QueryString["ID"].ToString());

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar_adresler sil = db.tbl_kullanicilar_adresler.First(p => p.id == AdresID && p.kullanici_id == KullaniciID && p.tip == false);
                    db.DeleteObject(sil);
                    db.SaveChanges();
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(283), "/member-address.aspx");
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/member-address.aspx");
            }
        }

        protected void btn_sil0_Click(object sender, EventArgs e)
        {
            try
            {
                int AdresID = int.Parse(Request.QueryString["ID"].ToString());

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_kullanicilar_adresler sil = db.tbl_kullanicilar_adresler.First(p => p.id == AdresID && p.kullanici_id == KullaniciID && p.tip == true);
                    db.DeleteObject(sil);
                    db.SaveChanges();
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(284), "/member-address.aspx");
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/member-address.aspx");
            }
        }

        protected void btn_sepetegit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/basket.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}