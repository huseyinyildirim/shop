using System;
using System.Linq;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class hata_kayitlari_detay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ErrorId"] != null)
            {
                Guid ErrorId = Guid.Parse(Request.QueryString["ErrorId"].ToString());
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from p in db.elmah_error where p.ErrorId == ErrorId select new { p.AllXml }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            hata.InnerText = i.AllXml;
                        }
                    }
                }
            }
        }
    }
}