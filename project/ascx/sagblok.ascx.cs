using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP.ascx
{
    public partial class sagblok : System.Web.UI.UserControl
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();

        protected void Page_Load(object sender, EventArgs e)
        {
            //YeniUrun();

            if (!IsPostBack)
            {
                Marka();
            }

            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                SepetHesapla();
                pnl_sepet.Visible = true;
            }

            btn_maillist.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(221);
        }

        protected void SepetHesapla()
        {
            int KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_urunler
                           from b in db.tbl_sepetler
                           where b.kullanici_id == KullaniciID && b.durum == false && a.id == b.urun_id
                           select new
                           {
                               a.id,
                               a.ad,
                               a.fiyat,
                               a.resim_id,
                               a.kdv_id,
                               a.para_birimi_id,
                               a.indirim_id,
                               a.kargo_hesaplama_id,
                               a.stok,
                               a.yeni,
                               urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                               indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault(),
                               kdv_yuzde = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.ad).FirstOrDefault(),
                               kdv = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault(),
                               b.adet
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    List<double> ToplamFiyat = new List<double>();
                    List<double> Kdv = new List<double>();
                    StringBuilder sb = new StringBuilder();
                    foreach (var i in SQL)
                    {
                        if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                        {
                            string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, i.adet));
                            string KdvIndirimlifiyat = SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(IndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0);

                            ToplamFiyat.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id)));
                            Kdv.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(KdvIndirimlifiyat, i.para_birimi_id)));
                        }
                        else
                        {
                            string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), "0", SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat, i.adet));
                            string KdvIndirimlifiyat = SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(IndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0);

                            ToplamFiyat.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id)));
                            Kdv.Add(double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(KdvIndirimlifiyat, i.para_birimi_id)));
                        }
                    }

                    sb.Append("Sepetinizde " + SQL.Count() + " ürün var.<br /><br />");

                    sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w75\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(134) + "</div><div class=\"sol fiyatbilgiic2\">: " + SHOPClass.Finans.Cevirme.ParaFormat(ToplamFiyat.Sum().ToString()) + " " + KullanilacakDovizAd + "</div></div>");
                    sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w75\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(135) + "</div><div class=\"sol fiyatbilgiic2\">: " + SHOPClass.Finans.Cevirme.ParaFormat(Kdv.Sum().ToString()) + " " + KullanilacakDovizAd + "</div></div>");
                    sb.Append("<div class=\"fiyatbilgi\"><div class=\"sol fiyatbilgiic w75\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(136) + "</div><div class=\"sol fiyatbilgiic2\">: " + SHOPClass.Finans.Cevirme.ParaFormat((double.Parse(ToplamFiyat.Sum().ToString()) + double.Parse(Kdv.Sum().ToString())).ToString()) + " " + KullanilacakDovizAd + "</div></div>");

                    lit_sepet_ozet.Text = sb.ToString();
                }
                else
                {
                    lit_sepet_ozet.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(137);
                }
            }
        }

        protected void Marka()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_markalar
                           where a.onay == true
                           orderby a.ad ascending
                           select new
                           {
                               a.id,
                               a.ad
                           });

                if (SQL.Any())
                {
                    ddl_marka.Items.Clear();
                    ddl_marka.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(207), "0"));
                    foreach (var i in SQL)
                    {
                        ddl_marka.Items.Add(new ListItem(i.ad, SHOPClass.Fonksiyonlar.Genel.SeoLink("brand", i.ad, i.id.ToString())));
                    }
                }
                else
                {
                    pnl_marka.Visible = false;
                }
            }
        }

        protected void YeniUrun()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_urunler
                           where a.onay == true && a.yeni == true && a.dil_id == DilID
                           select new
                           {
                               a.id,
                               a.resim_id,
                               a.ad,
                               fiyat = a.fiyat == null ? 0 : a.fiyat,
                               a.kdv,
                               a.kdv_id,
                               a.para_birimi_id,
                               a.indirim_id,
                               a.yeni,
                               urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                               indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault()
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    int x = 1;
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<div class=\"blokurun\"><ul id=\"yeniurunler\" class=\"jcarousel-skin\"><li>");
                    foreach (var i in SQL)
                    {
                        sb.Append("<div class=\"blokurunresim\"><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/product-image.ashx?i=" + i.resim_id + "&amp;w=50&amp;h=50&amp;k=t\" alt=\"" + i.ad + "\" /></a></div><div class=\"blokurundetay\"><strong><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\">" + i.ad + "</a></strong>");
                        if (i.yeni == true)
                        {
                            sb.Append("&nbsp;&nbsp;<img src=\"/images/icon-yeniurun.png\" alt=\"Yeni Ürün\" />");
                        }
                        sb.Append("<br />" + Class.Fonksiyonlar.Uygulama.SabitlerText(208) + ": " + i.urunkod);
                        if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                        {
                            sb.Append("<br /><span class=\"kirmizibold\">%" + i.indirim.ToString() + " <img src=\"/images/icon-indirim.png\" alt=\"indirim\" /></span> <strike>" + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike>");
                            if (i.kdv)
                            {
                                sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293));
                            }
                        }

                        if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                        {
                            string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0));
                            sb.Append("<br /><strong>" + SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id) + " " + KullanilacakDovizAd);
                        }
                        else
                        {
                            sb.Append("<br /><strong>" + SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id) + " " + KullanilacakDovizAd);
                        }

                        if (!string.IsNullOrEmpty(i.kdv_id.ToString()))
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
                    lit_yeniurun.Text = sb.ToString();
                }
                else
                {
                    lit_yeniurun.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(326);
                }
            }
        }

        protected void btn_maillist_Click(object sender, EventArgs e)
        {
            try
            {
                string mail = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_maillist.Text);
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_maillist_mailler where a.mail == mail select new { a.id });
                    if (SQL.Any())
                    {
                        Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(258));
                    }
                    else
                    {
                        tbl_maillist_mailler Tbl = new tbl_maillist_mailler();
                        Tbl.mail = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_maillist.Text);
                        Tbl.ad_soyad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_maillist.Text);
                        Tbl.durum = true;
                        Tbl.tip = false;
                        db.AddTotbl_maillist_mailler(Tbl);
                        db.SaveChanges();

                        Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(257));
                    }
                }
            }
            catch (Exception ex)
            {
                Class.Fonksiyonlar.JavaScript.MesajKutusu(ex.Message);
            }
        }
    }
}