using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class basket_address : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID = 0;
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        #region Sistem objemiz
        SHOPObjeler.Tanimlar.Sistem Sistem { get; set; }
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

                #region Sepet için statik değişken oluşturulmadıysa sepet 1. adıma gidiyor
                if (Sistem.Sepet.KullaniciID != KullaniciID)
                {
                    Response.Redirect("/basket.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                #endregion
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            #region Sabit ve butonların yazıları
            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(118);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(97);
            btn_yenifaturadresekle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(141);
            btn_yeniteslimatadresekle.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(141);
            btn_devamet.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(157);
            btn_geri.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(215);
            #endregion

            if (!IsPostBack)
            {
                Kategori();

                ddl_faturaadres.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
                ddl_teslimatadres.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(140), "0"));
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

        #region Kategoriler yazılıyor
        protected void Kategori()
        {
            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
        }
        #endregion

        #region Yeni fatura adresi eklemek için yönlendirme
        protected void btn_yenifaturadresekle_Click(object sender, EventArgs e)
        {
            Response.Redirect("/member-address.aspx?p=invoice_new", false);
            Context.ApplicationInstance.CompleteRequest();
        }
        #endregion

        #region Yeni teslimat adresi eklemek için yönlendirme
        protected void btn_yeniteslimatadresekle_Click(object sender, EventArgs e)
        {
            Response.Redirect("/member-address.aspx?p=cargo_new", false);
            Context.ApplicationInstance.CompleteRequest();
        }
        #endregion

        /*
         * Create HY
         * Edit 23.09.2012 13:57 JSON la dd lerden veri almak için Request.Form
        */
        #region Seçilen adres bilgileri kayıt ediliyor ve sonraki adıma geçiyor
        protected void btn_devamet_Click(object sender, EventArgs e)
        {
#if DEBUG
            try
            {
#endif
                int FaturaAdresID = int.Parse(Request.Form["ddl_faturaadres"].ToString());
                int TeslimatAdresID = int.Parse(Request.Form["ddl_teslimatadres"].ToString());

                #region fatura ve kargo adres id leri sepet listesine atılıyor
                ObjeSetle();

                Sistem.Sepet.FaturaAdresID = FaturaAdresID;
                Sistem.Sepet.KargoAdresID = TeslimatAdresID;
                Sistem.Sepet.VergiBilgiID = SHOPClass.Fonksiyonlar.Sepet.VergiBilgiID(FaturaAdresID);
                #endregion

                #region eğer fatura ve kargo adresilerinin ikiside yurt dışı ise kdv yi sıfırlıyoruz
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var Fatura = (from a in db.tbl_kullanicilar_adresler
                                  where a.kullanici_id == KullaniciID && a.id == FaturaAdresID && a.tip == false
                                  select new
                                  {
                                      a.id,
                                      a.ulke_id
                                  });

                    var Teslimat = (from a in db.tbl_kullanicilar_adresler
                                    where a.kullanici_id == KullaniciID && a.id == TeslimatAdresID && a.tip == true
                                    select new
                                    {
                                        a.id,
                                        a.ulke_id
                                    });

                    if (Fatura.Select(p => p.ulke_id).FirstOrDefault() != Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.ulke_id).FirstOrDefault() && Teslimat.Select(p => p.ulke_id).FirstOrDefault() != Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.ulke_id).FirstOrDefault())
                    {
                        Sistem.Sepet.ToplamKdv = 0;
                        Sistem.Sepet.GenelToplam = Sistem.Sepet.ToplamTutar;
                    }
                }
                #endregion

                Response.Redirect("/basket-cargo.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                Response.Redirect("/basket-address.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
#endif
        }
        #endregion

        #region Önceki sepet adımına yönlendirme
        protected void btn_geri_Click(object sender, EventArgs e)
        {
            ObjeSetle();

            #region Sipariş için static değişken oluşturuluyor, sepet her adımında diğer değerler yazılacak
            SHOPObjeler.Tanimlar.Sepet Sepet = new SHOPObjeler.Tanimlar.Sepet();
            Sepet.KullaniciID = 0;
            Sepet.Tutar = 0;
            Sepet.IndirimTutar = 0;
            Sepet.ToplamTutar = 0;
            Sepet.ToplamKdv = 0;
            Sepet.GenelToplam = 0;
            Sepet.ParaBirimID = 0;
            Sistem.Sepet = Sepet;
            #endregion

            Response.Redirect("/basket.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
        #endregion
    }
}