using System;
using System.Linq;
using Ext.Net;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class desktop : System.Web.UI.Page
    {
        string SayfaAdi { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            #region JS İçin Admin Root mu Değil mi?
            Class.Fonksiyonlar.JavaScript.Ekle("var AdminRoot = function(){return " + Class.Fonksiyonlar.Admin.Kullanici.Kontroller.Root(Class.Fonksiyonlar.Admin.Genel.AdminID()).ToString().ToLower() + ";};");
            #endregion

            if (!Class.Fonksiyonlar.Admin.Genel.SessionKontrol())
            {
                #region Oturum Yoksa Postala
                Response.Redirect("default.aspx?rnd=" + (DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond) + "&s=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), false);
                Context.ApplicationInstance.CompleteRequest();
                return;
                #endregion
            }
            else
            {
                DovizKurlari();
            }

            #region Sayfa Adını Al
            SayfaAdi = Request.Url.LocalPath.Split('/')[Request.Url.LocalPath.Split('/').Count() - 1].Replace(Request.CurrentExecutionFilePathExtension, "");
            #endregion
        }

        protected void DovizKurlari()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_gunluk_kurlar
                           where p.kur_tarih == (db.tbl_gunluk_kurlar.OrderByDescending(x => x.kur_tarih).Select(x => x.kur_tarih).FirstOrDefault())
                           select new
                           {
                               para_birim = (db.tbl_sbt_para_birim.Where(x => x.id == p.para_birimi_id).Select(x => x.kisaltma).FirstOrDefault()),
                               p.alis,
                               p.satis,
                               p.efektif_alis,
                               p.efektif_satis,
                               p.kur_tarih
                           }).AsEnumerable().OrderBy(x => x.para_birim);

                Store1.DataSource = SQL;
                Store1.DataBind();

                /*if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append(SQL.Select(x => x.kur_tarih).FirstOrDefault().Value.ToShortDateString() + " tarihli döviz kurları<br /><br /><table width=\"100%\">");
                    sb.Append("<tr><td bgcolor=\"#CCCCCC\">&nbsp;</td><td bgcolor=\"#CCCCCC\">ALIŞ</td><td bgcolor=\"#CCCCCC\">ŞATIŞ</td><td bgcolor=\"#CCCCCC\">E. ALIŞ</td><td bgcolor=\"#CCCCCC\">E. SATIŞ</td></tr>");
                    foreach (var i in SQL)
                    {
                        sb.Append("<tr><td>" + i.para_birim + "</td><td>" + i.alis + "</td><td>" + i.satis + "</td><td>" + i.efektif_alis + "</td><td>" + i.efektif_satis + "</td></tr>");
                    }
                    sb.Append("</table>");
                    //lit_doviz_kurlari2.Text = sb.ToString();
                }*/
            }
        }

        protected void ExportEt(object sender, DirectEventArgs e)
        {
            try
            {
                #region Gelen Veriyi Al ve JSON Yap
                object o = JSON.Deserialize<object>(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, e.ExtraParams["data"].ToString()));
                #endregion

                #region Tipi Al
                string tip = e.ExtraParams["format"].ToString();
                #endregion

                Class.Fonksiyonlar.Genel.Export(o, tip, SayfaAdi);
            }
            catch
            {
            }
        }
    }
}