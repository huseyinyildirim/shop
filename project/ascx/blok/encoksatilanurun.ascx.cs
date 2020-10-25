using System;

namespace SHOP.ascx
{
    public partial class blok_encoksatilanurun : System.Web.UI.UserControl
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();

        protected void Page_Load(object sender, EventArgs e)
        {
            /*using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_urunler
                           let SatisSayi = db.tbl_cpy_siparisler_urunler.Where(p => p.urunler_id == a.id).Count()
                           where a.onay == true && a.dil_id == DilID && SatisSayi > 0
                           orderby SatisSayi descending
                           select new
                           {
                               a.id,
                               a.resim_id,
                               a.ad,
                               a.fiyat,
                               a.kdv,
                               a.kdv_id,
                               a.para_birimi_id,
                               a.indirim_id,
                               a.yeni,
                               //parabirim = db.tbl_sbt_para_birim.Where(p => p.id == a.para_birimi_id).Select(p => p.simge).FirstOrDefault(),
                               urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                               indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde).FirstOrDefault()
                           }).AsEnumerable().Take(15);

                if (SQL.Any())
                {
                    int x = 1;
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<div class=\"blokurun\"><ul id=\"encoksatilanurunler\" class=\"jcarousel-skin\"><li>");
                    foreach (var i in SQL)
                    {
                        sb.Append("<div class=\"blokurunresim\"><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/product-image.ashx?i=" + i.resim_id + "&amp;w=50&amp;h=50&amp;k=t\" alt=\"" + i.ad + "\" /></a></div><div class=\"blokurundetay\"><strong><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\">" + i.ad + "</a></strong>");
                        if (i.yeni == true)
                        {
                            sb.Append("&nbsp;&nbsp;<img src=\"/images/icon-yeniurun.png\" alt=\"Yeni Ürün\" />");
                        }

                        sb.Append("<br />" + Class.Fonksiyonlar.Uygulama.SabitlerText(208) + ": " + i.urunkod);

                        if (i.indirim_id > 0)
                        {
                            sb.Append("<br /><span class=\"kirmizibold\">%" + i.indirim.ToString() + " <img src=\"/images/icon-indirim.png\" alt=\"indirim\" /></span> <strike>" + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike>");

                            if (i.kdv_id != 0)
                            {
                                sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293));
                            }
                        }

                        if (i.indirim_id > 0)
                        {
                            sb.Append("<br /><strong>" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                        }
                        else
                        {
                            sb.Append("<br /><strong>" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                        }

                        if (i.kdv_id > 0)
                        {
                            sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293));
                        }

                        sb.Append("</strong></div><div class=\"h5\"></div>");

                        if (x == 5)
                        {
                            sb.Append("</li><li>");
                            x = 1;
                        }
                        else
                        {
                            x++;
                        }
                    }
                    sb.Append("</li></ul></div>");
                    lit_encoksatilanurun.Text = sb.ToString();
                }
            }*/
        }
    }
}