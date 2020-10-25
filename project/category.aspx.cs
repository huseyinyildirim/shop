using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class category : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KategoriID = 0;

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
            #region Description Metatag
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "description", "<meta http-equiv=\"Description\" content=\"" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault() + "\" />");
            #endregion

            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();

            if (!IsPostBack)
            {
                if (RouteData.Values["KategoriID"] != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["KategoriID"].ToString())))
                    {
                        if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(RouteData.Values["KategoriID"].ToString()))
                        {
                            KategoriID = Convert.ToInt16(RouteData.Values["KategoriID"].ToString());

                            // istatikler için
                            Class.Fonksiyonlar.Uygulama.ZiyaretEkle((int)Class.Sabitler.Ziyaret.KATEGORI, KategoriID);

                            if (KategoriID == 0)
                            {
                                Response.Redirect("/", false);
                                Context.ApplicationInstance.CompleteRequest();
                            }

                            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(271) + " " + Nerdesin(KategoriID.ToString());

                            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, KategoriID);
                            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

                            ddl_filitre.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(272), "1"));
                            //ddl_filitre.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(273), "2"));
                            ddl_filitre.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(274), "3"));
                            ddl_filitre.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(275), "4"));
                            ddl_filitre.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(276), "5"));

                            Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Etiketler(DilID);
                            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Etiketler(Etiketler);
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
            }
            else
            {
                Response.Redirect("/", false);
                Context.ApplicationInstance.CompleteRequest();
            }


            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();
            Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Etiketler(DilID);

            Urunler();
            KeywordsBas();
        }

        protected void Urunler()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_urunler
                           from b in db.tbl_urunler_kategoriler
                           where a.onay == true && a.dil_id == DilID && a.id == b.urun_id && b.kategori_id == KategoriID
                           orderby a.tarih_ek descending
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

                list_urunler.DataSource = SQL;
                list_urunler.DataBind();
            }
        }

        protected void listeleme_Sorting(object sender, System.Web.UI.WebControls.ListViewSortEventArgs e)
        {
            Urunler();
        }

        private string Nerdesin(string ID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                int GelenID = Convert.ToInt16(ID);

                var SQL = (from p in db.tbl_kategoriler
                           where p.dil_id == DilID && p.onay == true && p.id == GelenID
                           select p);

                StringBuilder SB1 = new StringBuilder();

                foreach (var i in SQL)
                {
                    StringBuilder SB2 = new StringBuilder();
                    SB2.Append("&raquo; ");

                    if (KategoriID != GelenID)
                    {
                        SB2.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("category", i.ad, ID.ToString()) + "\">");
                    }

                    if (KategoriID != GelenID)
                    {
                        SB2.Append(i.ad);
                    }
                    else
                    {
                        SB2.Append(i.ad);
                        lit_ortabaslik.Text = "// " + i.ad;

                        #region title
                        Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", i.ad + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                        #endregion
                    }

                    if (KategoriID != GelenID)
                    {
                        SB2.Append("</a> ");
                    }

                    SB1.Append(Nerdesin(i.kategori_id.ToString()));
                    SB1.Append(SB2.ToString());
                }

                return SB1.ToString();
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

            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "keywords", "<meta http-equiv=\"Keywords\" content=\"" + SB2.ToString().Replace(", ", ",").Replace(",", ", ") + "\" />");
        }

        protected void filitre_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}