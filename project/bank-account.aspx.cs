using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class bank_account : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        public List<string> Etiketler = new List<string>();

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
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(241) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault() + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; <a href=\"/customer-services.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(100) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(241);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(241).ToUpper();

            HavaleAdres();

            Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Etiketler(DilID);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Etiketler(Etiketler);
        }

        #region Firma banka havale bilgileri yazılıyor
        protected void HavaleAdres()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_hesap_nolar
                           where a.onay == true
                           select new
                           {
                               a.id,
                               banka = db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.marka).FirstOrDefault() != null ? db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.marka).FirstOrDefault() : db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.ad).FirstOrDefault(),
                               ikon = db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.ikon).FirstOrDefault() != null ? db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.ikon).FirstOrDefault() : null,
                               a.sube,
                               a.sube_kodu,
                               a.hesap_sahibi,
                               a.hesap_no,
                               a.iban
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<table summary=\"\"><tbody>");
                    foreach (var i in SQL)
                    {
                        sb.Append("<tr>");
                        sb.Append("<td><img src=\"/ashx/bank-image.ashx?i=" + i.ikon + "&amp;w=150&amp;h=50&amp;k=t\" alt=\"" + i.banka + "\" /></td><td>&nbsp;</td>");
                        sb.Append("<td><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(163) + "</strong> " + i.banka);
                        sb.Append("<br /><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(164) + "</strong> " + i.hesap_sahibi);
                        sb.Append("<br /><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(165) + "</strong> " + i.sube + " (" + i.sube_kodu + ")");
                        sb.Append("<br /><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(166) + "</strong> " + i.hesap_no);
                        sb.Append("<br /><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(167) + "</strong> " + i.iban + "</td>");
                        sb.Append("</tr>");
                        sb.Append("<tr><td colspan=\"3\">&nbsp;</td></tr>");
                    }
                    sb.Append("</tbody></table>");
                    lit_havale_adres.Text = sb.ToString();
                }
                else
                {
                    lit_havale_adres.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(242);
                }
            }
        }
        #endregion
    }
}