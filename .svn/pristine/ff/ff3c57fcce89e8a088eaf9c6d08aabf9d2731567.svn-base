using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class order_tracking : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID;
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        List<double> ToplamFiyat = new List<double>();
        List<double> Kdv = new List<double>();

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

            KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(101) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; <a href=\"/customer-services.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(100) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(101);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(101).ToUpper();

            #region Kategoriler
            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
            #endregion

            // Gridin başlıkları
            grid_sepet.Columns[0].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(188).ToUpper();
            grid_sepet.Columns[1].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(192).ToUpper();
            grid_sepet.Columns[2].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(189).ToUpper();
            grid_sepet.Columns[3].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(190).ToUpper();

            Siparisler();
        }

        protected void Siparisler()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_siparisler.AsEnumerable()
                           where a.kullanici_id == KullaniciID
                           orderby a.tarih descending
                           select new
                           {
                               a.id,
                               a.no,
                               siparis_durum_id = (db.tbl_siparisler_durumlar.AsEnumerable().OrderByDescending(t => t.siparis_durum_id).Where(t => t.siparis_id == a.id).Take(1).Select(t => t.siparis_durum_id).FirstOrDefault()),
                               a.toplam,
                               a.para_birimi_id,
                               a.tarih
                           }).AsEnumerable().Select(k => new
                           {
                               k.id,
                               k.no,
                               k.siparis_durum_id,
                               siparis_durum = (db.tbl_siparis_durumlar.AsEnumerable().Where(p => p.siparis_durum_id == k.siparis_durum_id && p.dil_id == DilID).Select(p => p.text).FirstOrDefault()),
                               k.toplam,
                               k.para_birimi_id,
                               k.tarih
                           });

                if (!SQL.Any())
                {
                    lit_sepetuyari.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(187);
                    div_sepeticerik.Visible = false;
                }

                grid_sepet.DataSource = SQL.ToList();
                grid_sepet.DataBind();
            }
        }

        protected void sepet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[4].Text = "<a href=\"/order-detail.aspx?ID=" + e.Row.Cells[4].Text + "\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(191) + "</a>";
            }
        }

        protected void sepet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int yeniSayfaIndex = e.NewPageIndex;
            grid_sepet.PageIndex = yeniSayfaIndex;
            Siparisler();
        }
    }
}