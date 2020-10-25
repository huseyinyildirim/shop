using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class basket_cargo : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID;
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        #region Sistem objemiz
        SHOPObjeler.Tanimlar.Sistem Sistem { get; set; }
        #endregion

        #region Gridviewdeki değerleri toplamak için List ler oluşturuluyor
        List<double> Desi = new List<double> { 0 };
        List<double> Kg = new List<double> { 0 };
        List<double> Paket = new List<double> { 0 };
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
            if (!SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/login.aspx?ReturnUrl=/basket.aspx", true);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

                ObjeSetle();

                if (Sistem.Sepet.FaturaAdresID == 0 || Sistem.Sepet.KargoAdresID == 0)
                {
                    Response.Redirect("/basket-address.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            #region Buton ve sabit yazılar
            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(210);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(97);
            btn_devamet.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(157);
            btn_geri.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(215);
            #endregion

            if (!IsPostBack)
            {
                Kategori();
                UrunKargoBilgileri();
                KargoFirma();
            }
        }

        protected void ObjeSetle()
        {
            try
            {
                Sistem = (from p in SHOPObjeler.Listeler.Sistem
                          where p.Key == KullaniciID
                          select p.Value).Cast<SHOPObjeler.Tanimlar.Sistem>().ToList()[0];
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        protected void Kategori()
        {
            #region Kategoriler yazılıyor
            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
            #endregion
        }

        #region Ürün kargo bilgileri toplanıyor
        protected void UrunKargoBilgileri()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sepetler
                           where a.kullanici_id == KullaniciID && a.durum == false
                           select new
                           {
                               a.urun_id,
                               a.adet
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        UrunBilgisi(i.urun_id, i.adet);
                    }
                }
            }
        }
        #endregion

        #region Ürünün kargo bilgilerine göre Listelere değerler yazılıyor
        protected void UrunBilgisi(int UrunID, int Adet)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_urunler
                           where a.id == UrunID
                           select new
                           {
                               a.en,
                               a.boy,
                               a.yukseklik,
                               a.desi,
                               a.kg,
                               a.kargo_hesaplama_id
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        switch (i.kargo_hesaplama_id)
                        {
                            case 2:
                                Paket.Add(1 * Adet);
                                break;

                            case 3:
                                Kg.Add(double.Parse(i.kg.ToString()) * Adet);
                                break;

                            case 5:
                                Desi.Add(double.Parse(i.desi.ToString()) * Adet);
                                break;
                        }
                    }
                }
            }
        }
        #endregion

        /*
     * Edit HY 13.08.12 02:57 Kargoya ait fiyat kayıt sayısı kontrolü eklendi
    */
        #region Kargo firmaları listeleniyor ve yukarıda oluşturulan List lere göre fiyatlar yazılıyor
        protected void KargoFirma()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_kargo
                           select new
                           {
                               a.id,
                               a.ikon,
                               a.ad,
                               fiyatkayitsayi = (db.tbl_kargo_ulke_il_bolge.Where(p => p.kargo_id == a.id).Count())
                               //HY 13.08.12 02:57
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<table id=\"bilgitablo\" summary=\"\"><tbody>");
                    sb.Append("<tr class=\"baslik\"><td width=\"40\" align=\"center\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(211).ToUpper() + "</td>");
                    sb.Append("<td width=\"200\" align=\"center\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(212).ToUpper() + "</td>");
                    sb.Append("<td>" + Class.Fonksiyonlar.Uygulama.SabitlerText(213).ToUpper() + "</td>");
                    sb.Append("<td align=\"center\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(214).ToUpper() + "</td></tr>");

                    int x = 0;
                    foreach (var i in SQL)
                    {
                        if (i.fiyatkayitsayi > 0)
                        //HY 13.08.12 02:57
                        {
                            //sb.Append("<tr><td align=\"center\"><input id=\"hesap_no_id\" type=\"radio\" name=\"hesap_no_id\" value=\"" + i.id + "-" + SHOPClass.Fonksiyonlar.Genel.Kargo.KargoTutar(i.id, Kg.Sum(), Desi.Sum(), Paket.Sum(), SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == KullaniciID).Select(p => p.KargoAdresID).FirstOrDefault()) + "\" ");
                            sb.Append("<tr><td align=\"center\"><input id=\"hesap_no_id\" type=\"radio\" name=\"hesap_no_id\" value=\"" + i.id + "-" + SHOPClass.Fonksiyonlar.Genel.Kargo.KargoTutar(i.id, Kg.Sum(), Desi.Sum(), Paket.Sum(), Sistem.Sepet.KargoAdresID) + "\" ");

                            if (x == 0)
                            {
                                sb.Append("checked");
                                x++;
                            }

                            sb.Append("/></td>");
                            sb.Append("<td align=\"center\"><img src=\"/ashx/cargo-image.ashx?i=" + i.ikon + "&amp;w=140&amp;h=40&amp;k=t\" alt=\"" + i.ad + "\" /></td>");
                            sb.Append("<td>" + i.ad + "</td>");
                            //sb.Append("<td align=\"center\">" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Fonksiyonlar.Genel.Kargo.KargoTutar(i.id, Kg.Sum(), Desi.Sum(), Paket.Sum(), SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == KullaniciID).Select(p => p.KargoAdresID).FirstOrDefault()).ToString()) + " TL</td></tr>");

                            string KargoTutari = SHOPClass.Fonksiyonlar.Genel.Kargo.KargoTutar(i.id, Kg.Sum(), Desi.Sum(), Paket.Sum(), Sistem.Sepet.KargoAdresID).ToString();

                            if (KargoTutari == "0")
                            {
                                sb.Append("<td align=\"center\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(216) + "</td></tr>");
                            }
                            else
                            {
                                sb.Append("<td align=\"center\">" + SHOPClass.Finans.Cevirme.ParaFormat(KargoTutari) + " TL</td></tr>");
                            }
                        }
                    }

                    sb.Append("</tbody></table>");
                    lit_kargo_bilgiler.Text = sb.ToString();
                }
                else
                {
                    btn_devamet.Visible = false;
                }
            }
        }
        #endregion

        #region Seçilen kargo firması kayıt ediliyor ve sonraki adıma geçiyor
        protected void btn_devamet_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.Form["hesap_no_id"] != null)
                {
                    ObjeSetle();

                    string[] ayir = Request.Form["hesap_no_id"].ToString().Split('-');

                    Sistem.Sepet.KargoFirmaID = int.Parse(ayir[0].ToString());
                    Sistem.Sepet.KargoPayi = double.Parse(ayir[1].ToString());
                    Sistem.Sepet.Toplam = Sistem.Sepet.GenelToplam + double.Parse(ayir[1].ToString());

                    Response.Redirect("/basket-payment.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(ex.Message, "/basket-cargo.aspx");
            }
        }
        #endregion

        #region Önceki sepet adımına dönmek için
        protected void btn_geri_Click(object sender, EventArgs e)
        {
            ObjeSetle();

            Sistem.Sepet.FaturaAdresID = 0;
            Sistem.Sepet.KargoAdresID = 0;
            Sistem.Sepet.VergiBilgiID = 0;
            Sistem.Sepet.ToplamKdv = 0;
            Sistem.Sepet.GenelToplam = 0;

            Response.Redirect("/basket-address.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
        #endregion
    }
}