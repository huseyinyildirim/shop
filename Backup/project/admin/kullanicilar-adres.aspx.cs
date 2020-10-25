using System;
using System.Linq;
using System.Text;
using System.Web;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class kullanicilar_adres : System.Web.UI.Page
    {
        int KullaniciID = int.Parse(HttpContext.Current.Request.QueryString["KID"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            TeslimatAdres();
            FaturaAdres();
        }

        void TeslimatAdres()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_kullanicilar_adresler
                           where p.tip == true && p.kullanici_id == KullaniciID
                           select new
                           {
                               p.baslik,
                               p.adres,
                               p.il,
                               p.ilce,
                               ulke = db.tbl_sbt_ulke.Where(a => a.id == p.ulke_id).Select(a => a.ad).FirstOrDefault(),
                               p.posta_kodu,
                               p.acik_adres
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    foreach (var i in SQL)
                    {
                        
                        sb.Append("<strong>Başlık:</strong> " + i.baslik + "<br />");
                        sb.Append("<strong>Adres:</strong> " + i.adres + "<br />");
                        sb.Append(i.ilce + "/" + i.il + "/" + i.ulke + " "+i.posta_kodu+"<br />");
                        sb.Append("<strong>Açık Adres:</strong> " + i.acik_adres + "<br /><br />");
                        
                    }

                    teslimat_adres.Text = sb.ToString();
                }
                else
                {
                    teslimat_adres.Text = "Eklenmiş teslimat adresi bulunmuyor!";
                }
            }
        }

        void FaturaAdres()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_kullanicilar_adresler
                           where p.tip == false && p.kullanici_id == KullaniciID
                           select new
                           {
                               p.baslik,
                               p.adres,
                               p.il,
                               p.ilce,
                               ulke = db.tbl_sbt_ulke.Where(a => a.id == p.ulke_id).Select(a => a.ad).FirstOrDefault(),
                               p.posta_kodu,
                               p.acik_adres,
                               firma = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.firma).FirstOrDefault(),
                               tip = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.tip).FirstOrDefault(),
                               vergi_no = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.vergi_no).FirstOrDefault(),
                               vergi_daire = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.vergi_dairesi).FirstOrDefault(),
                               tc_kimlik_no = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.tc_kimlik_no).FirstOrDefault()
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    foreach (var i in SQL)
                    {

                        sb.Append("<strong>Başlık:</strong> " + i.baslik + "<br />");
                        sb.Append("<strong>Firma:</strong> " + i.firma + "<br />");
                        sb.Append("<strong>Adres:</strong> " + i.adres + "<br />");
                        sb.Append(i.ilce + "/" + i.il + "/" + i.ulke + " " + i.posta_kodu + "<br />");

                        if (i.tip)
                        {
                            sb.Append("<strong>Vergi Daire/No:</strong> " + i.vergi_daire + " " + i.vergi_no + "<br /><br />");
                        }
                        else
                        {
                            sb.Append("<strong>TC Kimlik No:</strong> " + i.tc_kimlik_no + "<br /><br />");
                        }

                    }

                    fatura_adres.Text = sb.ToString();
                }
                else
                {
                    fatura_adres.Text = "Eklenmiş fatura adresi bulunmuyor!";
                }
            }
        }
    }
}