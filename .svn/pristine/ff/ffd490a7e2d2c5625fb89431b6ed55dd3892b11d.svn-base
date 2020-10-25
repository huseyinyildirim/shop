using System;
using System.Linq;
using System.Text;
using MySQLDataModel;

namespace SHOP.ascx
{
    public partial class odeme_havale : System.Web.UI.UserControl
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();

        protected void Page_Load(object sender, EventArgs e)
        {
                HavaleAdres();
        }

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
                    int x = 0;
                    foreach (var i in SQL)
                    {
                        sb.Append("<tr>");
                        sb.Append("<td valign=\"top\"><input id=\"hesap_no_id\" type=\"radio\" name=\"hesap_no_id\" value=\"" + i.id + "\"");
                        if (x == 0)
                        {
                            sb.Append(" checked");
                            x++;
                        }
                        sb.Append(" /></td><td>&nbsp;</td>");
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
                    //btn_havale_odeme.Visible = false;
                }
            }
        }

        /*protected void btn_havale_odeme_Click(object sender, EventArgs e)
        {
            List<SHOPObjeler.Tanimlar.Sepet> L = (from p in SHOPObjeler.Listeler.Sepet
                                                  where p.KullaniciID == (SHOPClass.Fonksiyonlar.Kullanici.Genel.ID())
                                                  select p).Cast<SHOPObjeler.Tanimlar.Sepet>().ToList();

            L[0].SiparisDurumID = 2;
            L[0].OdemeSekliID = 1;

            Class.Fonksiyonlar.Sepet.SiparisOlustur();

            int hesap_no = int.Parse(Request.Form["hesap_no_id"].ToString());

            #region seçilen havale adresi cpy_odeme_bildirimler_hesap_nolar kopyalanıyor
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                tbl_cpy_odeme_bildirimler_hesap_nolar TblEkle = new tbl_cpy_odeme_bildirimler_hesap_nolar();
                TblEkle.hesap_nolar_id = hesap_no;
                db.AddTotbl_cpy_odeme_bildirimler_hesap_nolar(TblEkle);
                db.SaveChanges();
            }
            #endregion

            #region ödeme bildirimi yazılıyor
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_cpy_odeme_bildirimler_hesap_nolar
                           where a.hesap_nolar_id == hesap_no
                           orderby a.tarih descending
                           select new
                           {
                               a.id
                           }.AsEnumerable().Take(1);

                if (SQL.Any())
                {
                    BaglantiCumlesi ekle = new BaglantiCumlesi();
                    tbl_odeme_bildirimler Tbl = new tbl_odeme_bildirimler();
                    Tbl.kullanici_id = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();
                    Tbl.siparis_id = Class.Fonksiyonlar.Sepet.SiparisID();
                    Tbl.odeme_bildirimler_hesap_nolar_id = SQL.OrderByDescending(p => p.id).Select(p => p.id).FirstOrDefault();
                    Tbl.tutar = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (SHOPClass.Fonksiyonlar.Kullanici.Genel.ID())).Select(p => p.Toplam).FirstOrDefault();
                    Tbl.para_birimi_id = KullanilacakDoviz;
                    ekle.AddTotbl_odeme_bildirimler(Tbl);
                    ekle.SaveChanges();
                }
            }
            #endregion        

            #region gönderilecek kargo bilgileri yazılıyor
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                tbl_siparisler_gonderimler Tbl = new tbl_siparisler_gonderimler();
                Tbl.siparis_id = Class.Fonksiyonlar.Sepet.SiparisID();
                Tbl.kargo_id = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (SHOPClass.Fonksiyonlar.Kullanici.Genel.ID())).Select(p => p.KargoFirmaID).FirstOrDefault();
                db.AddTotbl_siparisler_gonderimler(Tbl);
                db.SaveChanges();
            }
            #endregion

            HttpContext.Current.Response.Redirect("/basket-confirmation.aspx");
        }*/
    }
}