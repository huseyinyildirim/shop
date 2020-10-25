using System;
using System.Linq;
using System.Text;
using MySQLDataModel;

namespace SHOP.ascx
{
    public partial class kayanmarkabar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MarkaKayanBar();
        }

        protected void MarkaKayanBar()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_markalar
                           where a.onay == true && a.ikon != null && a.ikon != ""
                           select new
                           {
                               a.id,
                               a.ad,
                               a.ikon
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    //sb.Append("<ul>");
                    foreach (var i in SQL)
                    {
                        //sb.Append("<li><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("brand", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/brand-image.ashx?i=" + i.ikon + "&amp;w=100&amp;h=50&amp;k=t\" alt=\"" + i.ad + "\" /></a></li>");
                        sb.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("brand", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/brand-image.ashx?i=" + i.ikon + "&amp;w=100&amp;h=50&amp;k=t\" alt=\"" + i.ad + "\" /></a>");
                    }
                    //sb.Append("</ul>");
                    lit_markabar.Text = sb.ToString();
                }
                else
                {
                    pnl_markakayanbar.Visible = false;
                }
            }
        }
    }
}