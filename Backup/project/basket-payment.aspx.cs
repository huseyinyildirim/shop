using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;
using SHOP.ViewState;

namespace SHOP
{
    public partial class basket_payment : System.Web.UI.Page
    {
        //SHOPClass.Sabitler.OdemeTipi OdemeTipi = SHOPClass.Sabitler.OdemeTipi.KrediKarti;

        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID = 0;
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();
        int KullanilacakDoviz = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        #region Sistem objemiz
        SHOPObjeler.Tanimlar.Sistem Sistem { get; set; }
        #endregion

        #region POS Objesi
        SHOPObjeler.Tanimlar.POS POS = new SHOPObjeler.Tanimlar.POS();
        #endregion

        #region POS Durum Objesi
        SHOPClass.Odemeler.POSDurum POSD = new SHOPClass.Odemeler.POSDurum();
        #endregion

        #region Kdvleri gruplamak için
        public List<SHOPObjeler.Tanimlar.KdvOran> L_KdvOran = new List<SHOPObjeler.Tanimlar.KdvOran>();
        #endregion

        #region VIEWSTATE Serializer
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
        #endregion

        /*
        * Edit HY 16.08.12 03:29 Devam et butonu eklendi
        */
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

                if (!IsPostBack)
                {
                    Sistem.Odeme.OdemeTipi = SHOPClass.Sabitler.OdemeTipi.KrediKarti;
                }

                #region Sepet için oluşturulan statik değişkenlerde KullaniciID ve KargoFirma ile kontrol yapılıyor
                if (Sistem.Sepet.KullaniciID != KullaniciID || Sistem.Sepet.KargoFirmaID == 0)
                {
                    Response.Redirect("/basket-cargo.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                #endregion
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            #region Buton ve sabit yazılar
            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(119);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(97);
            btn_geri.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(215);
            //HY 16.08.12 03:29
            btn_devamet.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(157);
            #endregion

            #region Ödeme çeşitleri tabların başlıkları
            lbl_sepet_bos.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(291);

            lbtn_havale.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(158).ToUpper();
            lbtn_kredikarti.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(159).ToUpper();
            lbtn_kapidaodeme.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(160).ToUpper();
            lbtn_paypal.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(161).ToUpper();
            lbtn_ptt.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(162).ToUpper();
            #endregion

            #region Kategoriler yazılıyor
            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);
            #endregion

            #region Gridview başlıkları
            grid_sepet.Columns[1].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(113).ToUpper();
            grid_sepet.Columns[2].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(114).ToUpper();
            grid_sepet.Columns[3].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(115).ToUpper();
            grid_sepet.Columns[4].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(116).ToUpper();
            #endregion

            #region Ödeme seçenekleri arasında dolaşılıp sayfa refresh edilirse, komisyon/indirim den toplamın genel toplama eşitlenmesi
            // Burası çok önemli! Genel toplam alındıktan sonra sadece komisyon/indirim işlemi olduğu için, kullanıcı bu sayfada
            // ödeme seçenekleri arasında dolaştıkça sistem objesine indirim ve komisyondan dolayı toplamı etkileyen fiyat farkları
            // olabilir. bunun için ödeme seenekleri arasında dolaşıldığında Sistem.Sepet.Toplam = Sistem.Sepet.GenelToplam gibi
            // eşitleme yapmak zorundayız.
            Sistem.Sepet.Toplam = Sistem.Sepet.GenelToplam;
            #endregion

            if (!IsPostBack)
            {
                Sepet();
            }

            //PaypalObje();
            //PaypalOdeme();
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

        //protected void PaypalObje()
        //{
        //    NVPAPICaller test = new NVPAPICaller();

        //    string retMsg = "";
        //    string token = "";

        //    if (Session["payment_amt"] != null)
        //    {
        //        string amt = Session["payment_amt"].ToString();

        //        //Optional Shipping Address entered on the merchant site
        //        string shipToName = "<SHIPTONAME>";
        //        string shipToStreet = "<SHIPTOSTREET>";
        //        string shipToStreet2 = "<SHIPTOSTREET2>";
        //        string shipToCity = "<SHIPTOCITY>";
        //        string shipToState = "<SHIPTOSTATE>";
        //        string shipToZip = "<SHIPTOCITY>";
        //        string shipToCountryCode = "<SHIPTOCOUNTRYCODE>";

        //        bool ret = test.MarkExpressCheckout(amt, shipToName, shipToStreet, shipToStreet2,
        //                        shipToCity, shipToState, shipToZip, shipToCountryCode,
        //                        ref token, ref retMsg);
        //        if (ret)
        //        {
        //            Session["token"] = token;
        //            Response.Redirect(retMsg);
        //        }
        //        else
        //        {
        //            Response.Redirect("APIError.aspx?" + retMsg);
        //        }
        //    }
        //    /*else
        //    {
        //        Response.Redirect("APIError.aspx?ErrorCode=AmtMissing");
        //    }*/
        //}

        //protected void PaypalOdeme()
        //{
        //    if (Request.QueryString["Pg"] != null)
        //    {
        //        if (Request.QueryString["Pg"].ToString() == "paypal_ok")
        //        {
        //            NVPAPICaller test = new NVPAPICaller();

        //            string retMsg = "";
        //            string token = "";
        //            string finalPaymentAmount = "";
        //            string payerId = "";
        //            NVPCodec decoder = null;

        //            token = Session["token"].ToString();
        //            payerId = Session["payerId"].ToString();
        //            finalPaymentAmount = Session["payment_amt"].ToString();

        //            bool ret = test.ConfirmPayment(finalPaymentAmount, token, payerId, ref decoder, ref retMsg);
        //            if (ret)
        //            {
        //                // Unique transaction ID of the payment. Note:  If the PaymentAction of the request was Authorization or Order, this value is your AuthorizationID for use with the Authorization & Capture APIs. 
        //                string transactionId = decoder["TRANSACTIONID"];

        //                // The type of transaction Possible values: l  cart l  express-checkout 
        //                string transactionType = decoder["TRANSACTIONTYPE"];

        //                // Indicates whether the payment is instant or delayed. Possible values: l  none l  echeck l  instant 
        //                string paymentType = decoder["PAYMENTTYPE"];

        //                // Time/date stamp of payment
        //                string orderTime = decoder["ORDERTIME"];

        //                // The final amount charged, including any shipping and taxes from your Merchant Profile.
        //                string amt = decoder["AMT"];

        //                // A three-character currency code for one of the currencies listed in PayPay-Supported Transactional Currencies. Default: USD.    
        //                string currencyCode = decoder["CURRENCYCODE"];

        //                // PayPal fee amount charged for the transaction    
        //                string feeAmt = decoder["FEEAMT"];

        //                // Amount deposited in your PayPal account after a currency conversion.    
        //                string settleAmt = decoder["SETTLEAMT"];

        //                // Tax charged on the transaction.    
        //                string taxAmt = decoder["TAXAMT"];

        //                //' Exchange rate if a currency conversion occurred. Relevant only if your are billing in their non-primary currency. If 
        //                string exchangeRate = decoder["EXCHANGERATE"];
        //            }
        //            else
        //            {
        //                Response.Redirect("APIError.aspx?" + retMsg);
        //            }
        //        }
        //    }
        //}

        protected void Sepet()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sepetler
                           where a.kullanici_id == KullaniciID && a.durum == false
                           select new
                           {
                               a.id,
                               a.adet,
                               urunadi = db.tbl_urunler.Where(p => p.id == a.urun_id).Select(p => p.ad).FirstOrDefault(),
                               urunid = db.tbl_urunler.Where(p => p.id == a.urun_id).Select(p => p.id).FirstOrDefault()
                           }).AsEnumerable();

                #region Eğer sepet boş basket.aspx gidiyor
                if (!SQL.Any())
                {
                    Response.Redirect("/basket.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                #endregion

                grid_sepet.DataSource = SQL;
                grid_sepet.DataBind();
            }
        }

        protected void sepet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int UrunID = int.Parse(e.Row.Cells[2].Text);
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_urunler
                               where a.id == UrunID
                               select new
                               {
                                   a.id,
                                   a.ad,
                                   fiyat = a.fiyat == null ? 0 : a.fiyat,
                                   a.resim_id,
                                   a.kdv_id,
                                   a.para_birimi_id,
                                   a.indirim_id,
                                   a.kargo_hesaplama_id,
                                   a.stok,
                                   a.yeni,
                                   //parabirim = db.tbl_sbt_para_birim.Where(p => p.id == a.para_birimi_id).Select(p => (p.simge == null ? p.kisaltma : p.simge)).FirstOrDefault(),
                                   urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                   indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault(),
                                   kdv_yuzde = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.ad == null ? null : p.ad).FirstOrDefault(),
                                   kdv = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.yuzde == null ? 0 : p.yuzde).FirstOrDefault()
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            e.Row.Cells[1].Text = "<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/product-image.ashx?i=" + i.resim_id + "&amp;w=60&amp;h=60&amp;k=t\" alt=\"" + i.ad + "\" align=\"left\" /></a>&nbsp;<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\">" + i.ad + "</a> (" + SHOP.Class.Fonksiyonlar.Uygulama.SabitlerText(293) + ": %" + i.kdv + ")";

                            if (!string.IsNullOrEmpty(i.urunkod))
                            {
                                e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br />&nbsp;" + Class.Fonksiyonlar.Uygulama.SabitlerText(208) + ": " + i.urunkod;
                            }

                            #region Ürün kargo bedava ise ikon çıkıyor
                            if (i.kargo_hesaplama_id == 1)
                            {
                                e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br />&nbsp;<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(216) + "\" src=\"/images/btn-ucretsizkargo.png\" /></a>";
                            }
                            #endregion

                            StringBuilder sb = new StringBuilder();
                            if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                            {
                                #region Üründe indirim varsa, indirimsiz ürün yazılıp üstüne strike etiketi ile üstüne çizgi atılıyor
                                sb.Append("<strike>" + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike><br />");
                                sb.Append(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0)) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));
                                #endregion

                                string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0));
                                string ToplamIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, int.Parse(e.Row.Cells[3].Text)));
                                string ToplamKdvIndiriliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0));
                                string ToplamKdvMiktari = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0));

                                #region Eğer ürün dövizi, kullanılacak döviz değil ise sepette göstermek için döviz çevirme işlemi
                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                }
                                #endregion

                                e.Row.Cells[4].Text = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                L_KdvOran.Add(new SHOPObjeler.Tanimlar.KdvOran() { Fiyat = double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)), Yuzde = double.Parse(i.kdv.ToString()) });
                            }
                            else
                            {
                                //string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0));
                                string ToplamIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), "0", SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat, int.Parse(e.Row.Cells[3].Text)));
                                string ToplamKdvIndiriliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0));
                                string ToplamKdvMiktari = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(ToplamIndirimliFiyat, i.kdv.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari, 0));

                                sb.Append(SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));

                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                }

                                e.Row.Cells[4].Text = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamIndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                L_KdvOran.Add(new SHOPObjeler.Tanimlar.KdvOran() { Fiyat = double.Parse(SHOPClass.Finans.Hesaplama.DovizCevir(ToplamKdvMiktari, i.para_birimi_id)), Yuzde = double.Parse(i.kdv.ToString()) });
                            }

                            e.Row.Cells[2].Text = sb.ToString();
                        }

                        #region Kdvleri grupluyoruz ama toplam kdv sıfırsa grupları göstermiyoruz çünkü yurt dışı olabilir
                        if (Sistem.Sepet.ToplamKdv != 0)
                        {
                            var L = (from a in L_KdvOran
                                     select a.Yuzde).Distinct();

                            if (L.Any())
                            {
                                StringBuilder str_kdv = new StringBuilder();

                                foreach (var i in L)
                                {
                                    str_kdv.Append("<tr>");
                                    str_kdv.Append("<td class=\"baslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(293) + " (%" + i.ToString() + ")</td>");
                                    str_kdv.Append("<td class=\"baslik\">:</td>");
                                    str_kdv.Append("<td>" + SHOPClass.Finans.Cevirme.ParaFormat(L_KdvOran.Where(p => p.Yuzde == i).Select(p => p.Fiyat).Sum().ToString()) + " " + KullanilacakDovizAd + "</td>");
                                    str_kdv.Append("</tr>");
                                }

                                kdvler.Text = str_kdv.ToString();
                            }
                        }
                        #endregion

                        #region Sepetteki ürünün fiyat ve kdv değeri listeye ekleniyor
                        lit_tutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.Tutar.ToString()) + " " + KullanilacakDovizAd;
                        lit_indirimtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.IndirimTutar.ToString()) + " " + KullanilacakDovizAd;
                        lit_toplamtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.ToplamTutar.ToString()) + " " + KullanilacakDovizAd;
                        lit_toplamkdv.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.ToplamKdv.ToString()) + " " + KullanilacakDovizAd;
                        lit_geneltoplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.GenelToplam.ToString()) + " " + KullanilacakDovizAd;
                        lit_kargo_payi.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.KargoPayi.ToString()) + " " + KullanilacakDovizAd;
                        lit_toplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(Sistem.Sepet.Toplam.ToString()) + " " + KullanilacakDovizAd;
                        #endregion

                        if (Sistem.Sepet.IndirimTutar.ToString() == "0")
                        {
                            pnl_indirim.Visible = false;
                        }

                        if (Sistem.Sepet.KargoPayi.ToString() == "0")
                        {
                            pnl_kargo_payi.Visible = false;
                        }
                    }
                }
            }
        }

        protected void btn_geri_Click(object sender, EventArgs e)
        {
            ObjeSetle();

            Sistem.Sepet.KargoFirmaID = 0;
            Sistem.Sepet.KargoPayi = 0;
            Sistem.Sepet.Toplam = 0;

            Response.Redirect("/basket-cargo.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void havale_Click(object sender, EventArgs e)
        {
            try
            {
                ObjeSetle();
                Sistem.Odeme.OdemeTipi = SHOPClass.Sabitler.OdemeTipi.BankaHavalesi;

                #region ödeme çeşidine göre panel durumu
                pnl_havale.Visible = true;
                pnl_kredikarti.Visible = false;
                pnl_kapidaodeme.Visible = false;
                pnl_paypal.Visible = false;
                pnl_ptt.Visible = false;
                lbl_sepet_bos.Visible = false;
                #endregion

                lbl_komisyon_tutar.Text = "";

                #region Eğer havale ödeme türünde indirim vs. varsa burada işlenecek
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_indirimler_komisyonlar
                               where a.odeme_sekli_id == 1
                               select new
                               {
                                   a.id,
                                   a.yuzde,
                                   a.ad,
                                   a.tip
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            #region komisyon hesaplama
                            double Toplam = Sistem.Sepet.GenelToplam;
                            double komisyon_tutari = Toplam * (double.Parse(i.yuzde.ToString()) / 100);
                            #endregion

                            #region Komisyon indirim mi, yoksa bindirim mi?
                            double YeniToplam;
                            if (i.tip == false)
                            {
                                YeniToplam = Toplam - komisyon_tutari;
                            }
                            else
                            {
                                YeniToplam = Toplam + komisyon_tutari;
                            }
                            #endregion

                            #region komisyon işlemleri yazdırılıyor
                            StringBuilder sb = new StringBuilder();
                            sb.Append("<table class=\"sepettoplam\" align=\"right\" summary=\"\"><tbody>");
                            sb.Append("<tr><td class=\"baslik\">" + i.ad + "</td>");
                            sb.Append("<td class=\"baslik\">:</td>");
                            sb.Append("<td width=\"150\">" + SHOPClass.Finans.Cevirme.ParaFormat(komisyon_tutari.ToString()) + " " + KullanilacakDovizAd + "</td>");
                            sb.Append("</tr><tr>");
                            sb.Append("<td class=\"genelbaslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(292) + "</td>");
                            sb.Append("<td class=\"genelbaslik\">:</td>");
                            sb.Append("<td width=\"150\">" + SHOPClass.Finans.Cevirme.ParaFormat(YeniToplam.ToString()) + " " + KullanilacakDovizAd + "</td></tr>");
                            sb.Append("</tbody></table>");
                            lbl_komisyon_tutar.Text = sb.ToString();
                            #endregion

                            #region Komisyon bilgileri listeye yazılıyor
                            Sistem.Sepet.IndirimKomisyonID = i.id;
                            Sistem.Sepet.IndirimKomisyonAdi = i.ad;
                            Sistem.Sepet.KomisyonTutar = komisyon_tutari;
                            Sistem.Sepet.Toplam = YeniToplam;
                            #endregion
                        }
                    }
                }
                #endregion
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        protected void kredikarti_Click(object sender, EventArgs e)
        {
            try
            {
                ObjeSetle();
                Sistem.Odeme.OdemeTipi = SHOPClass.Sabitler.OdemeTipi.KrediKarti;

                #region ödeme çeşidine göre panel durumu
                pnl_havale.Visible = false;
                pnl_kredikarti.Visible = true;
                pnl_kapidaodeme.Visible = false;
                pnl_paypal.Visible = false;
                pnl_ptt.Visible = false;
                lbl_sepet_bos.Visible = false;
                #endregion

                lbl_komisyon_tutar.Text = "";

                #region Komisyon bilgileri listeye yazılıyor
                Sistem.Sepet.IndirimKomisyonID = 0;
                Sistem.Sepet.KomisyonTutar = 0;

                // Burası çok önemli! Genel toplam alındıktan sonra sadece komisyon/indirim işlemi olduğu için, kullanıcı bu sayfada
                // ödeme seçenekleri arasında dolaştıkça sistem objesine indirim ve komisyondan dolayı toplamı etkileyen fiyat farkları
                // olabilir. bunun için ödeme seenekleri arasında dolaşıldığında Sistem.Sepet.Toplam = Sistem.Sepet.GenelToplam gibi
                // eşitleme yapmak zorundayız.
                Sistem.Sepet.Toplam = Sistem.Sepet.GenelToplam;
                #endregion
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        protected void kapidaodeme_Click(object sender, EventArgs e)
        {
            try
            {
                #region ödeme çeşidine göre panel durumu
                pnl_havale.Visible = false;
                pnl_kredikarti.Visible = false;
                pnl_kapidaodeme.Visible = true;
                pnl_paypal.Visible = false;
                pnl_ptt.Visible = false;
                lbl_sepet_bos.Visible = false;
                #endregion

                lbl_komisyon_tutar.Text = "";

                #region Eğer havale ödeme türünde indirim vs. varsa burada işlenecek
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_indirimler_komisyonlar
                               where a.odeme_sekli_id == 4
                               select new
                               {
                                   a.id,
                                   a.yuzde,
                                   a.ad,
                                   a.tip
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            #region komisyon hesaplama
                            double Toplam = Sistem.Sepet.Toplam;
                            double komisyon_tutari = (Toplam * double.Parse(i.yuzde.ToString())) - Toplam;
                            #endregion

                            #region Komisyon indirim mi, yoksa bindirim mi?
                            double YeniToplam;
                            if (i.tip == false)
                            {
                                YeniToplam = Toplam - komisyon_tutari;
                            }
                            else
                            {
                                YeniToplam = Toplam + komisyon_tutari;
                            }
                            #endregion

                            #region komisyon işlemleri yazdırılıyor
                            StringBuilder sb = new StringBuilder();
                            sb.Append("<table class=\"sepettoplam\" align=\"right\" summary=\"\"><tbody>");
                            sb.Append("<tr><td class=\"baslik\">" + i.ad + "</td>");
                            sb.Append("<td class=\"baslik\">:</td>");
                            sb.Append("<td width=\"150\">" + SHOPClass.Finans.Cevirme.ParaFormat(komisyon_tutari.ToString()) + " " + KullanilacakDovizAd + "</td>");
                            sb.Append("</tr><tr>");
                            sb.Append("<td class=\"genelbaslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(292) + "</td>");
                            sb.Append("<td class=\"genelbaslik\">:</td>");
                            sb.Append("<td width=\"150\">" + SHOPClass.Finans.Cevirme.ParaFormat(YeniToplam.ToString()) + " " + KullanilacakDovizAd + "</td></tr>");
                            sb.Append("</tbody></table>");
                            lbl_komisyon_tutar.Text = sb.ToString();
                            #endregion

                            #region Komisyon bilgileri listeye yazılıyor
                            Sistem.Sepet.IndirimKomisyonID = i.id;
                            Sistem.Sepet.KomisyonTutar = komisyon_tutari;
                            Sistem.Sepet.Toplam = YeniToplam;
                            #endregion
                        }
                    }
                }
                #endregion
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        protected void paypal_Click(object sender, EventArgs e)
        {
            #region ödeme çeşidine göre panel durumu
            pnl_havale.Visible = false;
            pnl_kredikarti.Visible = false;
            pnl_kapidaodeme.Visible = false;
            pnl_paypal.Visible = true;
            pnl_ptt.Visible = false;
            lbl_sepet_bos.Visible = false;
            #endregion

            lbl_komisyon_tutar.Text = "";
        }

        protected void ptt_Click(object sender, EventArgs e)
        {
            #region ödeme çeşidine göre panel durumu
            pnl_havale.Visible = false;
            pnl_kredikarti.Visible = false;
            pnl_kapidaodeme.Visible = false;
            pnl_paypal.Visible = false;
            pnl_ptt.Visible = true;
            lbl_sepet_bos.Visible = false;
            #endregion

            lbl_komisyon_tutar.Text = "";
        }

        protected void btn_devamet_Click(object sender, EventArgs e)
        {
            /*
            odeme_kredikarti$txt_kart_isim		
            odeme_kredikarti$txt_kart_no_1		
            odeme_kredikarti$txt_kart_no_2		
            odeme_kredikarti$txt_kart_no_3		
            odeme_kredikarti$txt_kart_no_4		
            odeme_kredikarti$ddl_son_tarih_ay	
            odeme_kredikarti$ddl_son_tarih_yil	
            odeme_kredikarti$txt_guvenlik_kodu	
            odeme_kredikarti$ddl_kart_tip		
            odeme_kredikarti$ddl_banka		
             * kk_taksit_id
            */

            #region Ödeme türünü değiştirmek istediğinde bunları sıfırlamak lazım
            Sistem.Sepet.IndirimKomisyonID = 0;
            Sistem.Sepet.IndirimKomisyonAdi = null;
            Sistem.Sepet.KomisyonTutar = 0;
            #endregion

            switch (Sistem.Odeme.OdemeTipi)
            {
                case SHOPClass.Sabitler.OdemeTipi.BankaHavalesi:
                    HavaleOdemeYap();
                    break;

                case SHOPClass.Sabitler.OdemeTipi.KrediKarti:
                    KKOdemeYap();
                    break;

                case SHOPClass.Sabitler.OdemeTipi.KapidaOdeme:
                    break;

                case SHOPClass.Sabitler.OdemeTipi.Paypal:
                    break;

                case SHOPClass.Sabitler.OdemeTipi.PostaHavalesi:
                    break;
            }
        }

        void KKOdemeYap()
        {
            ObjeSetle();

            #region Create Instance
            SHOPObjeler.Tanimlar.KKOdemeBilgileri OB = new SHOPObjeler.Tanimlar.KKOdemeBilgileri();
            #endregion

            try
            {
                int BankaID;
                int.TryParse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$ddl_banka"].ToString()), out BankaID);

                using (SHOPObjeler.Tanimlar.KrediKart KK = new SHOPObjeler.Tanimlar.KrediKart())
                {
                    KK.AdSoyad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$txt_kart_isim"].ToString());

                    if (BankaID != 0)
                    {
                        KK.BankaID = BankaID;
                    }

                    KK.KartNo = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$txt_kart_no_1"].ToString()) + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$txt_kart_no_2"].ToString()) + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$txt_kart_no_3"].ToString()) + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$txt_kart_no_4"].ToString());
                    KK.SonKullanim = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$ddl_son_tarih_ay"].ToString()) + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$ddl_son_tarih_yil"].ToString());
                    KK.CVC = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$txt_guvenlik_kodu"].ToString());
                    KK.KartTipi = (SHOPClass.Sabitler.KartTipi)Enum.Parse(typeof(SHOPClass.Sabitler.KartTipi), Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.Form["odeme_kredikarti$ddl_kart_tip"].ToString()));

                    Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri = KK;
                }

                #region Ödeme Bilgileri Objesi
                OB.Tutar = Sistem.Sepet.Toplam;
                OB.ParaBirimiID = Sistem.Sepet.ParaBirimID;
                #endregion

                #region Obje Setle
                Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri = OB;
                #endregion

                //SHOPClass.Odemeler.Pos.KrediKartiIleOdemeBilgisiEkle(KKO);

                Gonder();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        void HavaleOdemeYap()
        {
            try
            {
                ObjeSetle();

                #region Olması Gereken
                using (SHOPObjeler.Tanimlar.BankaHavalesi BH = new SHOPObjeler.Tanimlar.BankaHavalesi())
                {
                    BH.HesapNoID = int.Parse(Request.Form["hesap_no_id"].ToString());
                    Sistem.Odeme.OdemeSekilleri.BankaHavalesi = BH;
                }
                #endregion

                Sistem.Sepet.SiparisDurumID = 2;

                Sistem.Dispose();
                Response.Redirect("/payment-pos.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        public void Gonder()
        {
            try
            {
                ObjeSetle();

                Sistem.Sepet.SiparisDurumID = 2;

                //- İşlem -> Bin Kontrolü Evet -> Puan Sorgula Evet -> Ön Otorizasyon Yada da Satış
                //- İşlem -> Bin Kontrolü Evet -> Puan Sorgula Hayır -> Vade Farkı Sorgulama Evet -> Ön Otorizasyon Yada da Satış
                //- İşlem -> Bin Kontrolü Hayır -> Vade Farkı Sorgulama Evet -> Ön Otorizasyon Yada da Satış 

                #region POS Bilgileri Alınıyor ve Objeye Setleniyor
                //POS ID Al 
                int POSID = SHOPClass.Odemeler.Pos.POSID(Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.BankaID);

                //Taksit posu alınamazsa peşin posunu çağır
                if (POSID == 0)
                {
                    POSID = SHOPClass.Odemeler.Pos.PesinPOSU();
                }

                //POS Bilgisi Al ve Objeye Setle 
                if (POSID != 0)
                {
                    POS = SHOPClass.Odemeler.Pos.POSBilgisi(POSID);
                }
                else
                {
                    //Hata Ver
                }
                #endregion

                Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.POSID = POSID;

                //test için yazıldı 
                Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Puan = 20;

                #region Bin Kontrolünden Geçerse
                if (SHOPClass.Odemeler.Pos.BinNoKontrol(Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.BankaID, Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.KartNo.Substring(0, 6)))
                {
                    if (POS.PuanKullanim)
                    {
                        #region Puan Sorgula
                        POSD = SHOPClass.Odemeler.PosIslem(SHOPClass.Fonksiyonlar.IslemID("TEST", 24), SHOPClass.Sabitler.PosIslemTipleri.PuanSorgula, POS, Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri, Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri);
                        #endregion

                        if (POSD.Message.Type != Class.Sabitler.MessageTypes.OK)
                        {
                            Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Puan = double.Parse(POSD.POSIslem.KullanilabilirToplamPuanTutari);
                            Response.Redirect("/payment-pos.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }
                    }
                    else
                    {
                        #region Vade Kontrolü (Kart Doğrulama)
                        if (POS.VadeKontrol)
                        {
                            #region Vade Farkı Sorgula (Bu işleme kart doğrulama da denilebilir)
                            POSD = SHOPClass.Odemeler.PosIslem(SHOPClass.Fonksiyonlar.IslemID("TEST", 24), SHOPClass.Sabitler.PosIslemTipleri.Vade, POS, Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri, Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri);
                            #endregion

                            if (POSD.Message.Type != Class.Sabitler.MessageTypes.OK)
                            {
                                Response.Redirect("/payment-pos.aspx", false);
                                Context.ApplicationInstance.CompleteRequest();
                            }
                            else
                            {
                                //HATA
                            }
                        }
                        else
                        {
                            //vade kontrol yok!
                        }
                        #endregion
                    }
                }
                #endregion
                #region Bin Kontrolünden Geçemezse
                else
                {
                    #region Vade Kontrolü (Kart Doğrulama)
                    if (POS.VadeKontrol)
                    {
                        #region Vade Farkı Sorgula (Bu işleme kart doğrulama da denilebilir)
                        POSD = SHOPClass.Odemeler.PosIslem(SHOPClass.Fonksiyonlar.IslemID("TEST", 24), SHOPClass.Sabitler.PosIslemTipleri.Vade, POS, Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri, Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri);
                        #endregion

                        if (POSD.Message.Type != Class.Sabitler.MessageTypes.OK)
                        {
                            Response.Redirect("/payment-pos.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }
                        else
                        {
                            //HATA
                        }
                    }
                    else
                    {
                        //vade kontrol yok!
                    }
                    #endregion
                }
                #endregion

                //POS İşlemi Sonucu Dönen Değer Yazılıyor
                Sistem.Odeme.OdemeSekilleri.KrediKarti.PosIslem = POSD.POSIslem;
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }
    }
}