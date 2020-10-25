using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class search : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        string Tag = string.Empty;

        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        public Dictionary<int, string> Resimler = new Dictionary<int, string>();
        public Dictionary<int, string> Videolar = new Dictionary<int, string>();

        public List<string> Keywords = new List<string>();
        public List<string> Etiketler = new List<string>();
        public List<string> Markalar = new List<string>();
        public List<string> UrunKodlari = new List<string>();
        public List<string> UrunAdlari = new List<string>();

        public string ArananKelime { get; set; }

        #region Boş VIEWSTATE
        protected override void SavePageStateToPersistenceMedium(object viewState)
        {
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null;
        }
        #endregion

        /*
     * Edit HY 12.08.12 23:08 Titleye aranacak kelime yazdırıldı
     * Creaate HY 00.00.00 00:00
    */
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();

            if (!IsPostBack)
            {
                if (Request.QueryString["s"] != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["s"].ToString())))
                    {
                        Tag = Request.QueryString["s"].ToString();

                        if (Tag == string.Empty)
                        {
                            Response.Redirect("/", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }

                        lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(244) + " &raquo; " + Tag;
                        lit_ortabaslik.Text = Tag + " (" + Class.Fonksiyonlar.Uygulama.SabitlerText(244) + ")";

                        Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
                        Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

                        ArananKelime = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["s"].ToString());
                        Class.Fonksiyonlar.Uygulama.AramalaraEkle(DilID, ArananKelime);

                        #region title
                        Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Request.QueryString["s"].ToString() + " | " + Class.Fonksiyonlar.Uygulama.SabitlerText(244) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                        #endregion
                    }
                    else
                    {
                        Response.Redirect("/", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                }
                else
                {
                    Response.Redirect("/", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            else
            {
                Response.Redirect("/", false);
                Context.ApplicationInstance.CompleteRequest();
            }

            Urunler();
            KeywordsBas();
        }

        protected void Urunler()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                string marka = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.marka).FirstOrDefault().ToString().ToLower();
                var SQL = (from a in db.tbl_urunler
                           where a.onay == true && a.dil_id == DilID
                           let LKod = db.tbl_kodlar.Where(k => k.id == a.kod_id).Select(x => x.kod).FirstOrDefault()
                           select new
                           {
                               a.id,
                               a.ad,
                               a.aciklama,
                               a.on_aciklama,
                               kod = (LKod != null ? LKod : null),
                               marka = (LKod != null ? LKod : marka)
                           }).Where(a => ((a.kod.StartsWith(ArananKelime.Substring(0, 1)) && a.kod.Contains(ArananKelime.Substring(ArananKelime.Length - 1, 1))) || ((a.ad.StartsWith(ArananKelime.Substring(0, 1)) && a.ad.Contains(ArananKelime.Substring(ArananKelime.Length - 1, 1))) || (a.aciklama.StartsWith(ArananKelime.Substring(0, 1)) && a.aciklama.Contains(ArananKelime.Substring(ArananKelime.Length - 1, 1))) || (a.on_aciklama.StartsWith(ArananKelime.Substring(0, 1)) && a.on_aciklama.Contains(ArananKelime.Substring(ArananKelime.Length - 1, 1))))));

                #region Ürün Sayfa Sayısından Küçükse
                if (SQL.Count() < sayfalamasp.PageSize)
                {
                    div_sayfalama.Visible = false;
                }
                #endregion

                if (!SQL.Any())
                {
                    lit_anasayfaurun.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(47);
                }

                list_urunler.DataSource = SQL;
                list_urunler.DataBind();
            }
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

            //Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "keywords", "<meta http-equiv=\"Keywords\" content=\"" + SB2.ToString().Replace(", ", ",").Replace(",", ", ") + "\" />");
            Page.MetaKeywords = SB2.ToString().Replace(", ", ",").Replace(",", ", ").ToString();
        }
    }
}