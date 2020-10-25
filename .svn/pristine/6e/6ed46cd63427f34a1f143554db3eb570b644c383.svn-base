using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySQLDataModel;

namespace SHOP
{
    public partial class _products : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        #region List
        public List<string> Keywords = new List<string>();
        public List<string> Etiketler = new List<string>();
        public List<string> Markalar = new List<string>();
        public List<string> UrunKodlari = new List<string>();
        public List<string> UrunAdlari = new List<string>();
        #endregion

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
            #region Kategoriler
            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
            #endregion

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> " + Class.Fonksiyonlar.Uygulama.SabitlerText(62);

            #region Description Metatag
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "description", "<meta http-equiv=\"Description\" content=\"" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault() + "\" />");
            #endregion

            Urunler();

            Markalar = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Markalar();
            Etiketler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Etiketler(DilID);

            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Etiketler(Etiketler);

            KeywordsBas();
        }

        protected void Urunler()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_urunler
                           where a.onay == true && a.anasayfa == true && a.dil_id == DilID
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

        private void KeywordsBas()
        {
            #region Kategorileri Keywordse Ekle
            Keywords.AddRange(new List<string>(Kategoriler.Values));
            #endregion

            #region Markaları Keywordse Ekle
            Keywords.AddRange(Markalar);
            #endregion

            #region Etiketleri Keywordse Ekle
            Keywords.AddRange(Etiketler);
            #endregion

            #region Ürün Kodlarını Keywordse Ekle
            Keywords.AddRange(UrunKodlari);
            #endregion

            #region Ürün Adlarını Keywordse Ekle
            Keywords.AddRange(UrunAdlari);
            #endregion

            #region Keywordsler İçinde Aynı Kayıtlar Varsa Sil
            List<string> L = Keywords.Distinct().ToList().ConvertAll(x => Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, x.ToString().ToLower()));
            #endregion

            #region Listeden Keywordsleri Al
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
            #endregion

            #region Keywords Metatag
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "keywords", "<meta http-equiv=\"Keywords\" content=\"" + SB2.ToString().Replace(", ", ",").Replace(",", ", ") + "\" />");
            #endregion
        }
    }
}