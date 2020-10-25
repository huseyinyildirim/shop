using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using MySQLDataModel;

namespace SHOP
{
    //http://www.csharphelp.com/2006/06/setting-up-global-objects-with-the-global-asax-file/
    [Serializable]
    public class Global : System.Web.HttpApplication
    {
        /*
         * Edit FÜ - 21.10.2012 21:20 Elmah eklendi.
         */
        void RegisterRoutes(RouteCollection routes)
        {
#if DEBUG
            try
            {
#endif
                routes.MapPageRoute("product", "product/{UrunID}/{UrunAdi}", "~/product.aspx");
                routes.MapPageRoute("products", "products", "~/products.aspx");
                routes.MapPageRoute("tag", "tag/{Tag}", "~/tag.aspx");
                routes.MapPageRoute("brand", "brand/{MarkaID}/{MarkaAdi}", "~/brand.aspx");
                routes.MapPageRoute("category", "category/{KategoriID}/{KategoriAdi}", "~/category.aspx");
                routes.MapPageRoute("basket", "basket/{BasketID}/{BasketAdi}", "~/basket.aspx");
                routes.MapPageRoute("buy-now", "buy-now/{BasketID}/{BasketAdi}", "~/basket.aspx");
                routes.MapPageRoute("search", "search/{Kelime}", "~/search.aspx");
                routes.MapPageRoute("shop", "shop", "~/default.aspx");
                routes.MapPageRoute("hakkimizda", "hakkimizda", "~/about-us.aspx");
                routes.MapPageRoute("iletisim", "iletisim", "~/contact.aspx");
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }

        /* 
         * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
         */
        void Application_Start(object sender, EventArgs e)
        {
            #region Add Routes
            try
            {
                RegisterRoutes(RouteTable.Routes);
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
            #endregion

            #region Add Application Object
            try
            {
                Application["Goruntulenme"] = 0;
                Application["Oturumlar"] = 0;
                Application["KapananOturumlar"] = 0;
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
            #endregion

            #region Run Functions
            Application.Lock();

            try
            {
                Diller();

                #region Otomatik kur alma
                SHOPClass.Fonksiyonlar.Genel.Doviz.KurAl();
                #endregion

                SHOPClass.Fonksiyonlar.OdemetipleriDoldur();

                SiteAyar();
                TextlerYaz();
                FirmaBilgiYaz();
                ParaBirim();
                KDV();
                Banka();
                KargoFirma();
                PosBilgileri();
                ViewPosBankalarTaksit();
                TestMode();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }

            Application.UnLock();
            #endregion
        }

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        void Application_BeginRequest(Object Sender, EventArgs e)
        {
            try
            {
                Application.Lock();

                Application["Goruntulenme"] = (int)Application["Goruntulenme"] + 1;

                Application.UnLock();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        void Application_End(object sender, EventArgs e)
        {
        }

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        void Application_Error(object sender, EventArgs e)
        {
            try
            {
                #region Error Func
                if (bool.Parse(Class.Fonksiyonlar.Genel.OzelAyar("HataModu")))
                {
                    Exception E = Server.GetLastError();
                    Response.Clear();

                    HttpException HE = E as HttpException;

                    if (HE != null)
                    {
                        int action = -1;

                        switch (HE.GetHttpCode())
                        {
                            case 404:
                                action = 404;
                                break;

                            case 500:
                                action = 500;
                                break;

                            default:
                                action = 0;
                                break;
                        }

                        Server.ClearError();
                        Response.Redirect(String.Format("~/?error={0}-{1}", action, Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.Etiket, Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.StringTemizleAdres, (E.Message)))));
                        Context.ApplicationInstance.CompleteRequest();
                    }
                }
                #endregion
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        void Session_Start(object sender, EventArgs e)
        {
            try
            {
                Session.Timeout = 1440;
                Application.Lock();
                Application["Oturumlar"] = (int)Application["Oturumlar"] + 1;
                Application.UnLock();

                TestMode();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        void Session_End(object sender, EventArgs e)
        {
            try
            {
                Application.Lock();

                Application["KapananOturumlar"] = (int)Application["KapananOturumlar"] + 1;

                Application.UnLock();
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        // Create HY 07.12.12 11:32 BEGIN
        void TestMode()
        {
#if DEBUG
            try
            {
#endif
                if (Class.Fonksiyonlar.Firma.Ayar().Select(p => p.mode).FirstOrDefault() == true)
                {
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        var SQL = (from a in db.tbl_kullanicilar
                                   where a.id == 1
                                   select new
                                   {
                                       a.mail,
                                       a.uyelik_metot_id
                                   });

                        if (SQL.Any())
                        {
                            foreach (var i in SQL)
                            {
                                SHOPClass.Fonksiyonlar.Kullanici.Kontroller.GirisOlustur(i.mail, i.uyelik_metot_id);
                            }
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        // Create HY 07.12.12 11:32 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        void Diller()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    Objeler.Listeler.Diller.Clear();

                    var SQL = (from a in db.tbl_diller
                               select new
                               {
                                   a.dil,
                                   a.id,
                                   a.ikon,
                                   a.kodlama,
                                   a.sira,
                                   a.onay,
                                   a.ana_dil,
                                   kisaltma = db.tbl_sbt_ulke.Where(p => p.id == a.ulke_id).Select(p => p.kisaltma).FirstOrDefault()
                               });

                    foreach (var i in SQL)
                    {
                        using (Objeler.Tanimlar.Diller D = new Objeler.Tanimlar.Diller())
                        {
                            D.Dil = i.dil;
                            D.ID = i.id;
                            D.Ikon = i.ikon;
                            D.Kodlama = i.kodlama;
                            D.Sira = i.sira;
                            D.Onay = i.onay;
                            D.AnaDil = i.ana_dil;
                            D.Kisaltma = i.kisaltma;
                            Objeler.Listeler.Diller.Add(D);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 22.08.12 09:51 BEGIN
        #region Textler için obje oluşturuluyor
        void TextlerYaz()
        {
#if DEBUG
            try
            {
#endif
                int DilID = Class.Fonksiyonlar.Dil.ID();
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from s in db.tbl_textler
                               from t in db.tbl_sbt_sabit
                               from d in db.tbl_diller
                               from k in db.tbl_sbt_ulke
                               where s.sabitler_id == t.id && s.dil_id == DilID && s.onay == true && s.dil_id == d.id && d.ulke_id == k.id
                               select new
                               {
                                   s.id,
                                   s.sabitler_id,
                                   s.text
                               });

                    foreach (var i in SQL)
                    {
                        using (Objeler.Tanimlar.Textler T = new Objeler.Tanimlar.Textler())
                        {
                            T.ID = i.id;
                            T.SabitID = i.sabitler_id;
                            T.Text = i.text;
                            Objeler.Listeler.Textler.Add(T);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 22.08.12 09:51 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 23.08.12 11:29 BEGIN
        #region Firma bilgileri için obje oluşturuluyor
        void FirmaBilgiYaz()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_sbt_firma where p.id == 1 select p);

                    foreach (var i in SQL)
                    {
                        using (Objeler.Tanimlar.Firma F = new Objeler.Tanimlar.Firma())
                        {
                            F.ID = i.id;
                            F.UlkeID = i.ulke_id;
                            F.Ad = i.firma;
                            F.Unvan = i.unvan;
                            F.Marka = i.marka;
                            F.Domain = i.domain;
                            F.Mail = i.mail;
                            F.Description = i.description;
                            F.Title = i.title;
                            F.GoogleAnalytics = i.google_analytics;
                            F.GoogleDogrulamaKodu = i.google_dogrulama_kodu;
                            F.Flickr = i.flickr;
                            F.Youtube = i.youtube;
                            F.Vimeo = i.vimeo;
                            F.Facebook = i.facebook;
                            F.Twitter = i.twitter;
                            F.Paypal = i.paypal;
                            Objeler.Listeler.Firma.Add(F);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 23.08.12 11:29 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 23.08.12 13:20 BEGIN
        #region Para birimleri için obje oluşturuluyor
        void ParaBirim()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_sbt_para_birim select p);

                    foreach (var i in SQL)
                    {
                        using (SHOPObjeler.Tanimlar.ParaBirim F = new SHOPObjeler.Tanimlar.ParaBirim())
                        {
                            F.ID = i.id;
                            F.Ad = i.ad;
                            F.Kisaltma = i.kisaltma;
                            F.Simge = i.simge;
                            F.Uzunluk = i.uzunluk;
                            F.SabitKur = i.sabit_kur;
                            F.HesaplamaTip = i.hesaplama_tip;
                            F.HesaplamaBirim = i.hesaplama_birim;
                            F.Kur = i.kur;
                            SHOPObjeler.Listeler.ParaBirim.Add(F);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 23.08.12 13:20 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 24.08.2012 17:01 BEGIN
        #region KDV için obje oluşturuluyor
        void KDV()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_sbt_kdv select p);

                    foreach (var i in SQL)
                    {
                        using (SHOPObjeler.Tanimlar.KDV F = new SHOPObjeler.Tanimlar.KDV())
                        {
                            F.ID = i.id;
                            F.Ad = i.ad;
                            F.Yuzde = i.yuzde;
                            F.Sira = i.sira;
                            SHOPObjeler.Listeler.KDV.Add(F);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 24.08.2012 17:01 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 01.10.2012 16:17 BEGIN
        #region Site ayarları için obje oluşturuluyor
        void SiteAyar()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_sbt_ayar
                               where p.id == 1
                               select p);

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            using (SHOPObjeler.Tanimlar.SiteAyarlar F = new SHOPObjeler.Tanimlar.SiteAyarlar())
                            {
                                F.ID = i.id;
                                F.Type = i.type;
                                F.Mode = i.mode;
                                F.Www = i.www;
                                F.RootYonlendir = i.root_yonlendir;
                                F.Url = i.url;
                                F.Bsmv = i.bsmv;
                                F.Kkdf = i.kkdf;
                                F.Buton = i.buton;
                                F.Fiyat = i.fiyat;
                                F.Kdv = i.kdv;
                                F.KdvFiyat = i.kdv_fiyat;
                                F.UyeKayit = i.uye_kaydi;
                                F.Stok = i.stok;
                                F.Onay = i.onay;
                                SHOPObjeler.Listeler.SiteAyar.Add(F);
                            }
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 01.10.2012 16:17 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 25.08.2012 13:06 BEGIN
        #region Banka için obje oluşturuluyor
        void Banka()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_sbt_banka select p);

                    foreach (var i in SQL)
                    {
                        using (SHOPObjeler.Tanimlar.Banka F = new SHOPObjeler.Tanimlar.Banka())
                        {
                            F.ID = i.id;
                            F.Ad = i.ad;
                            F.Marka = i.marka;
                            F.Ikon = i.ikon;
                            F.Renk = i.renk;
                            SHOPObjeler.Listeler.Banka.Add(F);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 25.08.2012 13:06 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 27.08.2012 13:25 BEGIN
        #region Kargo firmaları için obje oluşturuluyor
        void KargoFirma()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_sbt_kargo select p);

                    foreach (var i in SQL)
                    {
                        using (SHOPObjeler.Tanimlar.KargoFirma F = new SHOPObjeler.Tanimlar.KargoFirma())
                        {
                            F.ID = i.id;
                            F.Tip = i.tip;
                            F.Ad = i.ad;
                            F.Ikon = i.ikon;
                            F.Url = i.url;
                            F.KmBirimFiyat = i.km_birim_fiyat;
                            F.DesiBirimFiyat = i.desi_birim_fiyat;
                            F.SabitFiyat = i.sabit_fiyat;
                            F.UcretsizFiyat = i.ucretsiz_fiyat;
                            F.UcretsizDesi = i.ucretsiz_desi;
                            SHOPObjeler.Listeler.KargoFirma.Add(F);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 27.08.2012 13:25 END

        /* 
        * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi. 
        */
        // Create HY 24.09.2012 00:30 BEGIN
        #region ViewPosBankalarTaksit için obje oluşturuluyor
        void ViewPosBankalarTaksit()
        {
#if DEBUG
            try
            {
#endif
                using (MySQLDataModel.BaglantiCumlesi db = new MySQLDataModel.BaglantiCumlesi())
                {
                    var SQL = (from p in db.view_pos_bankalar_taksit select p);

                    foreach (var i in SQL)
                    {
                        using (SHOPObjeler.Tanimlar.ViewPosBankalarTaksit F = new SHOPObjeler.Tanimlar.ViewPosBankalarTaksit())
                        {
                            F.SanalPosID = i.sanal_pos_id;
                            F.Test = i.test;
                            F.Pesin = i.pesin;
                            F.PuanKullanim = i.puan_kullanim;
                            F.Onay = i.onay;
                            F.BankaID = i.banka_id;
                            F.AnaBanka = i.ana_banka;
                            F.BankaOnay = i.banka_onay;
                            F.Banka = i.banka;
                            F.BinKontrol = i.bin_kontrol;
                            F.VadeKontrol = i.vade_kontrol;
                            F.Ay = i.ay;
                            F.Oran = i.oran;
                            F.OranOnay = i.oran_onay;
                            SHOPObjeler.Listeler.ViewPosBankalarTaksit.Add(F);
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
        #endregion
        // Create HY 24.09.2012 00:30 END

        /*
         * Create FÜ 10.09.2012 00:06 
         * Edit FÜ - 16.09.2012 04:20 Pesin Alanı, Bankalar ve Para Birimleri obje yapısına göre güncellendi.
         * Edit FÜ - 30.09.2012 07:29 Vade Kontrol Eklendi
         * Edit FÜ - 30.09.2012 23:44 Kod ID eklendi.
         * Edit FÜ - 21.10.2012 21:20 Gereksiz taglar temizlendi. Elmah eklendi.
         */
        void PosBilgileri()
        {
#if DEBUG
            try
            {
#endif
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_sbt_sanal_pos
                               let Bankalar = db.tbl_sbt_sanal_pos_banka.Where(x => x.sanal_pos_id == p.id).Select(x => new { x.banka_id, x.ana_banka, x.bin_kontrol }).AsEnumerable()
                               let ParaBirimleri = db.tbl_sbt_sanal_pos_para_birim.Where(x => x.sanal_pos_id == p.id).Select(x => new { x.para_birim_id, x.kisaltma }).AsEnumerable()
                               select
                               new
                               {
                                   p.id,
                                   p.kod_id,
                                   Bankalar,
                                   ParaBirimleri,
                                   p.magaza_no,
                                   p.api_kullanicisi,
                                   p.pos_no,
                                   p.url,
                                   p.xml_url,
                                   p.C3d_secure,
                                   p.C3d_secure_key,
                                   p.C3d_secure_url,
                                   p.C3d_secure_geri_donus_url,
                                   p.C3d_secure_hata_url,
                                   p.on_otorizasyon,
                                   p.pesin,
                                   p.sifir_komisyon,
                                   p.puan_kullanim,
                                   p.vade_kontrol,
                                   p.test,
                                   p.test_url,
                                   p.kampanya_kodu
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            #region POS Objesi
                            using (SHOPObjeler.Tanimlar.POS P = new SHOPObjeler.Tanimlar.POS())
                            {
                                P.ID = i.id;
                                P.KodID = i.kod_id;

                                #region Banka Objesi
                                List<SHOPObjeler.Tanimlar.POSBankalar> L1 = new List<SHOPObjeler.Tanimlar.POSBankalar>();

                                foreach (var t in i.Bankalar)
                                {
                                    using (SHOPObjeler.Tanimlar.POSBankalar B = new SHOPObjeler.Tanimlar.POSBankalar())
                                    {
                                        B.SanalPOSID = P.ID;
                                        B.BankaID = t.banka_id;
                                        B.BinKontrol = t.bin_kontrol;
                                        B.AnaBanka = t.ana_banka;

                                        L1.Add(B);
                                    }
                                }

                                P.Bankalar = L1;
                                #endregion

                                #region Para Birimleri Objesi
                                List<SHOPObjeler.Tanimlar.POSParaBirimleri> L2 = new List<SHOPObjeler.Tanimlar.POSParaBirimleri>();

                                foreach (var t in i.ParaBirimleri)
                                {
                                    using (SHOPObjeler.Tanimlar.POSParaBirimleri PB = new SHOPObjeler.Tanimlar.POSParaBirimleri())
                                    {
                                        PB.SanalPOSID = P.ID;
                                        PB.ParaBirimID = t.para_birim_id;
                                        PB.Kisaltma = t.kisaltma;

                                        L2.Add(PB);
                                    }
                                }

                                P.ParaBirimleri = L2;
                                #endregion

                                P.TID = i.api_kullanicisi;
                                P.MID = i.magaza_no;
                                P.PosNo = i.pos_no;
                                P.URL = i.url;
                                P.XmlURL = i.xml_url;
                                P.TDSecure = i.C3d_secure;
                                P.TDSecureKey = i.C3d_secure_key;
                                P.TDSecureURL = i.C3d_secure_url;
                                P.TDSecureGeriDonusURL = i.C3d_secure_geri_donus_url;
                                P.TDSecureHataURL = i.C3d_secure_hata_url;
                                P.OnOtorizasyon = i.on_otorizasyon;
                                P.Test = i.test;
                                P.TestURL = i.test_url;
                                P.Pesin = i.pesin;
                                P.SifirKomisyon = i.sifir_komisyon;
                                P.PuanKullanim = i.puan_kullanim;
                                P.VadeKontrol = i.vade_kontrol;
                                P.KampanyaKodu = i.kampanya_kodu;

                                SHOPObjeler.Listeler.POS.Add(P);
                            }
                            #endregion
                        }
                    }
                }
#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
#endif
        }
    }
}