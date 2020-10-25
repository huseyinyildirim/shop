using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class brand : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int MarkaID = 0;

        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        public Dictionary<int, string> Resimler = new Dictionary<int, string>();
        public Dictionary<int, string> Videolar = new Dictionary<int, string>();

        public List<string> Keywords = new List<string>();
        public List<string> Etiketler = new List<string>();
        public List<string> Markalar = new List<string>();
        public List<string> UrunKodlari = new List<string>();
        public List<string> UrunAdlari = new List<string>();

        /*#region VIEWSTATE Serializer
        private ViewStateSerializer _persister = null;
        protected override PageStatePersister PageStatePersister
        {
            get
            {
                if (_persister == null)
                {
                    _persister = new ViewStateSerializer(Page, ViewStateSerializer.SecurityLevel.Low, false);
                    //_persister.CompressPage(); // optional (compress all output HTML page) if have problems, comment it
                }
                return _persister;
            }
        }
        #endregion*/

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

            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();

            if (!IsPostBack)
            {
                if (RouteData.Values["MarkaID"] != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, RouteData.Values["MarkaID"].ToString())))
                    {
                        if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(RouteData.Values["MarkaID"].ToString()))
                        {
                            MarkaID = Convert.ToInt16(RouteData.Values["MarkaID"].ToString());

                            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; <a href=\"/brands.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(197) + "</a>" + Nerdesin(MarkaID.ToString());

                            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
                            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

                            Class.Fonksiyonlar.Uygulama.ZiyaretEkle((int)Class.Sabitler.Ziyaret.MARKA, MarkaID);

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

            Urunler();
            KeywordsBas();
        }

        protected void Urunler()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_urunler
                           from b in db.tbl_urunler_markalar
                           where a.onay == true && a.dil_id == DilID && a.id == b.urun_id && b.marka_id == MarkaID
                           orderby a.tarih_ek descending
                           select new
                           {
                               a.id
                           });

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

                var SQL = (from p in db.tbl_markalar
                           where p.id == GelenID
                           select p);

                StringBuilder sb = new StringBuilder();

                foreach (var i in SQL)
                {
                    sb.Append(" &raquo; <a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("brand", i.ad, ID.ToString()) + "\">" + i.ad + "</a>");

                    lit_ortabaslik.Text = "// " + i.ad;

                    #region title
                    Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", i.ad + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                    #endregion
                }

                return sb.ToString();
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