using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class tag : System.Web.UI.Page
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
     * Edit HY 12.08.12 23:06 Gelen tag titleye yazdırıldı
     * Create HY 00.00.00 00:00
    */
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();

            if (!IsPostBack)
            {
                if (RouteData.Values["Tag"] != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["Tag"].ToString())))
                    {
                        Tag = RouteData.Values["Tag"].ToString();

                        if (Tag == string.Empty)
                        {
                            Response.Redirect("/", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }

                        lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(7) + " &raquo; " + Tag;
                        lit_ortabaslik.Text = Tag + " (" + Class.Fonksiyonlar.Uygulama.SabitlerText(7) + ")";

                        Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
                        Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

                        //HY 12.08.12 23:06
                        #region title
                        Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Tag + " | " + Class.Fonksiyonlar.Uygulama.SabitlerText(60) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
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
                var SQL = (from a in db.tbl_urunler
                           from b in db.tbl_etiketler
                           from c in db.tbl_urunler_etiketler
                           where a.onay == true && a.dil_id == DilID && a.id == c.urun_id && c.etiket_id == b.id && b.ad == Tag && b.dil_id == DilID
                           select new
                           {
                               a.id
                           }).AsEnumerable();

                #region Ürün Sayfa Sayısından Küçükse
                if (SQL.Count() < sayfalamasp.PageSize)
                {
                    div_sayfalama.Visible = false;
                }
                #endregion

                if (!SQL.Any())
                {
                    lit_anasayfaurun.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(232);
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