using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class contact : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();

        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        public Dictionary<int, string> Resimler = new Dictionary<int, string>();
        public Dictionary<int, string> Videolar = new Dictionary<int, string>();

        public List<string> Keywords = new List<string>();
        public List<string> Etiketler = new List<string>();
        public List<string> Markalar = new List<string>();
        public List<string> UrunKodlari = new List<string>();
        public List<string> UrunAdlari = new List<string>();

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
            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();
            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> " + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + " &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(9);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(9).ToUpper();
            lit_ortabaslik2.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(20).ToUpper();

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(9) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            btn_iletisim_gonder.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(18);

            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();
            Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Etiketler(DilID);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Etiketler(Etiketler);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            Adresler();
            KeywordsBas();
        }

        private void KeywordsBas()
        {
            Keywords.AddRange(new List<string>(Kategoriler.Values));
            Keywords.AddRange(Markalar);
            Keywords.AddRange(Etiketler);
            Keywords.AddRange(UrunKodlari);
            Keywords.AddRange(UrunAdlari);

            List<string> L = Keywords.Distinct().ToList().ConvertAll(x => Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, x.ToString().ToLower()));

            StringBuilder SB2 = new StringBuilder();

            int a = 0;

            foreach (var i in L)
            {
                if (a != L.Count - 1)
                {
                    SB2.Append(i + ",");
                }
                else
                {
                    SB2.Append(i);
                }

                a++;
            }

            if (!string.IsNullOrEmpty(SB2.ToString()))
            {
                if (SB2.ToString().Substring(SB2.ToString().Length - 1, 1) == ",")
                {
                    SB2.Append(Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                }
            }

            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "keywords", "<meta http-equiv=\"Keywords\" content=\"" + SB2.ToString().Replace(", ", ",").Replace(",", ", ") + "\" />");
        }

        protected void Adresler()
        {
            string AdresL1 = "<li>\r\n<h4><img alt=\"{0}\" src=\"/images/flag/{1}\"/><span>{0}</span></h4>\r\n<p>{2}<a href=\"{3}\" target=\"_blank\"><img class=\"icon\" alt=\"\" src=\"/images/icon/map.png\"/></a></p>\r\n</li>\r\n" + Class.Degiskenler.Diger.vbCrLf;
            string AdresL2 = "<li>\r\n<h4><img alt=\"{0}\" src=\"/images/flag/{1}\"/><span>{0}</span></h4>\r\n<p>{2}</p>\r\n</li>\r\n" + Class.Degiskenler.Diger.vbCrLf;

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_firma_adresler
                           where p.firma_id == 1 && p.onay == true
                           orderby p.sira ascending
                           select new
                           {
                               p.baslik,
                               p.ikon,
                               p.adres,
                               p.harita_url,
                               ulke = db.tbl_sbt_ulke.Where(k => k.id == p.ulke_id).Select(x => x.ad).FirstOrDefault(),
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder SB1 = new StringBuilder();
                    StringBuilder SB2 = new StringBuilder();

                    foreach (var i in SQL)
                    {
                        #region Harita URL Boş Değilse
                        if (i.harita_url != null)
                        {
                            SB1.AppendFormat(AdresL1, i.ulke.ToUpper() + (i.baslik != null ? " " + i.baslik.ToUpper() : null), i.ikon, i.adres, (i.harita_url != null ? i.harita_url.ToLower().Replace("&", "&amp;") : null));
                        }
                        #endregion
                        #region Harita URL Boşsa
                        else
                        {
                            SB1.AppendFormat(AdresL2, i.ulke.ToUpper() + (i.baslik != null ? " " + i.baslik.ToUpper() : null), i.ikon, i.adres);
                        }
                        #endregion
                    }

                    SB2.Append("<ul id=\"adresmenu\">" + Class.Degiskenler.Diger.vbCrLf);
                    SB2.Append(SB1.ToString());
                    SB2.Append("</ul>");

                    lit_adres.Text = SB2.ToString();
                }
            }
        }

        protected void btn_iletisim_gonder_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    try
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_iletisimler ta = new tbl_iletisimler();
                            ta.ad_soyad = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_ad.Text.Trim()));
                            ta.mail = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text.Trim()));
                            ta.telefon = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_telefon.Text.Trim()));
                            ta.gorusler = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_mesaj.Text.Trim().Replace("\r\n", "<br/>" + Class.Degiskenler.Diger.vbCrLf)));
                            db.AddTotbl_iletisimler(ta);
                            db.SaveChanges();

                            Class.Fonksiyonlar.Admin.Log.AllHttp("tbl_iletisimler", ta.id);

                            string KullaniciAdi, Sifre, Host;
                            int Port;
                            Class.Fonksiyonlar.Genel.Mail.Bilgiler(out KullaniciAdi, out Sifre, out Host, out Port);
                            Class.Fonksiyonlar.Genel.Mail.Gonder(KullaniciAdi, Sifre, Host, Port, Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.mail).FirstOrDefault(), null, null, Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_eposta.Text.Trim()), Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_ad.Text.Trim()), Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.marka).FirstOrDefault() + " - İLETİŞİM", Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, txt_mesaj.Text.Trim().Replace("\r\n", "<br/>")), true);
                        }

                        txt_ad.Text = null;
                        txt_eposta.Text = null;
                        txt_telefon.Text = null;
                        txt_mesaj.Text = null;

                        Class.Fonksiyonlar.JavaScript.Ekle("alert('" + Class.Fonksiyonlar.Uygulama.SabitlerText(37) + "')");
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
                }
                else
                {
                    txt_ad.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["frm_ad"].ToString());
                    txt_eposta.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["frm_eposta"].ToString());
                    txt_telefon.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["frm_telefon"].ToString());
                    txt_mesaj.Text = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["frm_mesaj"].ToString());

                    Class.Fonksiyonlar.JavaScript.Ekle("alert('" + Class.Fonksiyonlar.Uygulama.SabitlerText(36) + "')");
                }
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }
    }
}