using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class payment_manifesto : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID;
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

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
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(199) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; <a href=\"/customer-services.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(100) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(199);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(199).ToUpper();

            btn_odeme_bildirim.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(198);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            // Ödeme tipindeki dropdown verileri
            ddl_islem_tipi.Items.Clear();
            ddl_islem_tipi.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(204), "0"));
            ddl_islem_tipi.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(205), "1"));
            ddl_islem_tipi.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(206), "2"));

            if (!IsPostBack)
            {
                SiparisDoldur();

                if (Request.QueryString["ID"] != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["ID"].ToString())))
                    {
                        if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(Request.QueryString["ID"].ToString()))
                        {
                            Veriler();
                        }
                    }
                }
            }
        }

        // Sipariş no dropdowna ödemesi yapılmamış sipariş no lar geliyor
        protected void SiparisDoldur()
        {
            ddl_siparisno.Items.Clear();

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_siparisler
                           from b in db.tbl_odeme_bildirimler
                           where a.kullanici_id == KullaniciID && b.siparis_id == a.id && b.odeme_tarih == null
                           orderby a.tarih descending
                           select new
                           {
                               a.id,
                               a.no,
                               a.toplam,
                               parabirim = db.tbl_sbt_para_birim.Where(p => p.id == a.para_birimi_id).Select(p => p.simge == null ? p.kisaltma : p.simge).FirstOrDefault()
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    ddl_siparisno.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));

                    foreach (var i in SQL)
                    {
                        ddl_siparisno.Items.Add(new ListItem(i.no + " (" + SHOPClass.Finans.Cevirme.ParaFormat(i.toplam.ToString()) + " " + i.parabirim + ")", "/payment-manifesto.aspx?ID=" + i.id.ToString()));
                    }
                }
                else
                {
                    pnl_siparis.Visible = false;
                    lit_siparisyok.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(329);
                }
            }
        }

        protected void Veriler()
        {
            int ID = int.Parse(Request.QueryString["ID"].ToString());

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_odeme_bildirimler
                           from b in db.tbl_siparisler
                           where a.siparis_id == ID && b.id == ID && b.kullanici_id == KullaniciID
                           select new
                           {
                               a.tutar,
                               para_birim = db.tbl_sbt_para_birim.Where(p => p.id == a.para_birimi_id).Select(p => p.simge == null ? p.kisaltma : p.simge).FirstOrDefault(),
                               banka_id = db.tbl_cpy_odeme_bildirimler_hesap_nolar.Where(p => p.id == a.odeme_bildirimler_hesap_nolar_id).Select(p => p.hesap_nolar_id).FirstOrDefault(),
                               banka_sube = db.tbl_cpy_odeme_bildirimler_hesap_nolar.Where(p => p.id == a.odeme_bildirimler_hesap_nolar_id).Select(p => p.sube).FirstOrDefault(),
                               banka_sube_kodu = db.tbl_cpy_odeme_bildirimler_hesap_nolar.Where(p => p.id == a.odeme_bildirimler_hesap_nolar_id).Select(p => p.sube_kodu).FirstOrDefault(),
                               hesap_sahibi = db.tbl_cpy_odeme_bildirimler_hesap_nolar.Where(p => p.id == a.odeme_bildirimler_hesap_nolar_id).Select(p => p.hesap_sahibi).FirstOrDefault(),
                               hesap_no = db.tbl_cpy_odeme_bildirimler_hesap_nolar.Where(p => p.id == a.odeme_bildirimler_hesap_nolar_id).Select(p => p.hesap_no).FirstOrDefault()
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    pnl_detay.Visible = true;
                    ddl_siparisno.Text = "/payment-manifesto.aspx?ID=" + Request.QueryString["ID"].ToString();
                    foreach (var i in SQL)
                    {
                        lbl_banka.Text = i.hesap_sahibi + " - " + SHOPClass.Fonksiyonlar.Genel.BankaAdi(int.Parse(i.banka_id.ToString())) + " (" + i.banka_sube + " - " + i.banka_sube_kodu + ") " + i.hesap_no;
                        lbl_toplam_tutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.tutar.ToString()) + " " + i.para_birim;
                    }
                }
            }
        }

        protected void btn_odeme_bildirim_Click(object sender, EventArgs e)
        {
            try
            {
                int BildirimID = int.Parse(Request.QueryString["ID"].ToString());

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_odeme_bildirimler Tbl = db.tbl_odeme_bildirimler.First(p => p.siparis_id == BildirimID);
                    Tbl.tip = int.Parse(ddl_islem_tipi.SelectedValue);
                    Tbl.islem_no = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_islem_no.Text);
                    Tbl.odeme_tarih = DateTime.Parse(txt_odeme_tarih.Text);
                    db.SaveChanges();
                }

                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(209), "/payment-manifesto.aspx");
            }
            catch (Exception ex)
            {
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/payment-manifesto.aspx");
            }
        }

        protected void ddl_siparisno_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(ddl_siparisno.SelectedValue.ToString(), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}