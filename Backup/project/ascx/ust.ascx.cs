using System;
using System.Linq;
using System.Text;
using MySQLDataModel;

namespace SHOP.ascx
{
    public partial class ust : System.Web.UI.UserControl
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();

        protected void Page_Load(object sender, EventArgs e)
        {
            kullanici_giris.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(93);
            btn_arama.ToolTip = Class.Fonksiyonlar.Uygulama.SabitlerText(45);
            btnFacebookLogin.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(323);
            btnTwitterLogin.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(324);
            btnGoogleLogin.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(325);

            KategoriMenu();
            AnaMenu();

            if (SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                div_uye.Visible = true;
                div_uyegiris.Visible = false;

                kullanici_adi.Text = SHOPClass.Fonksiyonlar.Kullanici.Cagir.Bilgi(SHOPClass.Fonksiyonlar.Kullanici.Genel.ID()).Select(p => p.ad_soyad).FirstOrDefault();
            }
            else
            {
                div_uye.Visible = false;
                div_uyegiris.Visible = true;
            }

            if (SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(2).Select(x=>x.onay).FirstOrDefault() == false)
            {
                btnFacebookLogin.Visible = false;
            }

            if (SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(3).Select(x => x.onay).FirstOrDefault() == false)
            {
                btnTwitterLogin.Visible = false;
            }

            if (SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(4).Select(x => x.onay).FirstOrDefault() == false)
            {
                btnGoogleLogin.Visible = false;
            }
        }

        protected void AnaMenu()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_menuler
                           where a.onay == true && a.dil_id == DilID
                           orderby a.sira ascending
                           select new
                           {
                               a.id,
                               a.ad,
                               a.url
                           });

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    foreach (var i in SQL)
                    {
                        sb.Append("<li><a href=\"/" + i.url + "\">" + i.ad + "</a></li>");
                    }
                    lit_anamenu.Text = sb.ToString();
                }
            }
        }

        protected void KategoriMenu()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_kategoriler
                           where a.kategori_id == 0 && a.ust == true && a.onay == true
                           orderby a.sira ascending
                           select new
                           {
                               a.id,
                               a.ad,
                               KayitSayi = db.tbl_kategoriler.Where(p => p.kategori_id == 0 && p.ust == true && p.onay == true).Count()
                           });

                if (SQL.Any())
                {
                    int x = 1;
                    StringBuilder sb = new StringBuilder();
                    foreach (var i in SQL)
                    {
                        if (i.KayitSayi == x)
                        {
                            sb.Append("<li class=\"son\"><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("category", i.ad, i.id.ToString()) + "\">" + i.ad.ToUpper() + "</a></li>");
                        }
                        else
                        {
                            sb.Append("<li><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("category", i.ad, i.id.ToString()) + "\">" + i.ad.ToUpper() + "</a></li>");
                            x++;
                        }
                    }
                    lit_kategorimenu.Text = sb.ToString();
                }
            }
        }

        protected void kullanici_giris_Click(object sender, EventArgs e)
        {
            try
            {
                SHOPClass.Fonksiyonlar.Kullanici.Kontroller.KullaniciAdiKontrol(txt_hizli_kullanici_adi.Text.Trim(), txt_hizli_sifre.Text.Trim());
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/login.aspx");
            }
        }

        protected void btn_arama_Click(object sender, EventArgs e)
        {
            Response.Redirect("/search.aspx?s=" + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_arama.Text.Trim()), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}