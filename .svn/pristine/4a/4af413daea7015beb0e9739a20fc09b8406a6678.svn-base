using System;
using System.Linq;
using MySQLDataModel;

namespace SHOP.ascx
{
    public partial class alt : System.Web.UI.UserControl
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();

        protected void Page_Load(object sender, EventArgs e)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_bottomlar
                           where p.dil_id == DilID && p.onay == true
                           select new
                           {
                               p.baslik,
                               p.text
                           });

                if (SQL.Any())
                {
                    lit_bottom_baslik.Text = SQL.Select(x => x.baslik).FirstOrDefault();
                    lit_bottom_text.Text = SQL.Select(x => x.text).FirstOrDefault();
                }
            }
        }
    }
}