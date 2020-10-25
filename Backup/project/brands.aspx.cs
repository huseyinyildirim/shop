using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class brands : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();

        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();
        public Dictionary<int, string> Resimler = new Dictionary<int, string>();
        public Dictionary<int, string> Videolar = new Dictionary<int, string>();

        public List<string> Keywords = new List<string>();
        public List<string> Etiketler = new List<string>();
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

            if (!IsPostBack)
            {
                lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(197);
                lit_ortabaslik.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(197);

                #region title
                Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(197) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
                #endregion

                Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
                Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
            }
            else
            {
                Response.Redirect("/",false);
                Context.ApplicationInstance.CompleteRequest();
            }

            Markalar();
            KeywordsBas();
        }

        protected void Markalar()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_markalar
                           where a.onay == true
                           orderby a.ad ascending
                           select new
                           {
                               tur = a.ikon != null ? 1 : 0,
                               a.ad,
                               a.id,
                               a.ikon
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    int x = 1;
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<table width=\"100%\" summary=\"\"><tbody><tr>");
                    foreach (var i in SQL)
                    {
                        if (i.tur == 1)
                        {
                            sb.Append("<td><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("brand", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/brand-image.ashx?i=" + i.ikon + "&amp;w=150&amp;h=50&amp;k=t\" alt=\"" + i.ad + "\" /></a></td>");
                        }
                        else
                        {
                            sb.Append("<td align=\"center\"><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("brand", i.ad, i.id.ToString()) + "\">" + i.ad + "</a></td>");
                        }


                        if (x == 3)
                        {
                            sb.Append("</tr><tr><td colspan=\"3\">&nbsp;</td></tr><tr>");
                            x = 1;
                        }
                        else
                        {
                            x++;
                        }
                    }
                    sb.Append("</tr></tbody></table>");
                    lit_anasayfaurun.Text = sb.ToString();
                }
                else
                {
                    lit_anasayfaurun.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(243);
                }
            }
        }

        private void KeywordsBas()
        {
            Keywords.AddRange(new List<string>(Kategoriler.Values));
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