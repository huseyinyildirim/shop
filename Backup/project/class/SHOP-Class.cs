using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Xml;
using System.Xml.Linq;
using _PosnetDotNetModule;
using AuthLib;
using DotNetOpenAuth.OpenId.Extensions.AttributeExchange;
using DotNetOpenAuth.OpenId.RelyingParty;
using Facebook;
using MySQLDataModel;

namespace SHOP
{
    public class SHOPClass
    {
        public class Sabitler
        {
            /// <summary>
            /// VISA, MASTERCARD, AMEX
            /// </summary>
            /*
             * Create FÜ 10.08.2012
            */
            public enum KartTipi
            {
                VISA = 0,
                MASTERCARD = 1,
                AMEX = 2
            }

            /// <summary>
            /// Pos İşlem Tipleri Puan, Vade, Otorizasyon, Satis
            /// </summary>
            /*
             * Create FÜ 10.08.12
             * Edit FÜ 12.08.2012 - 18:15 Bin tipi kaldırıldı.
             * Edit FÜ 07.10.2012 - 02:01 Pua; PuanSorgula, PuanKullan olarak değiştirildi.
            */
            public enum PosIslemTipleri
            {
                PuanSorgula, PuanKullan, Vade, Otorizasyon, Satis
            }

            /// <summary>
            /// İşlem tiplerini veren genel obje
            /// </summary>
            /*
             * Create FÜ 18.08.12 02:20
             * Edit FÜ 14.10.2012 30:08
            */
            //OdemetipleriDoldur() var bir de.
            public enum OdemeTipi
            {
                BankaHavalesi, //1
                KrediKarti, //2
                KapidaOdeme, //4
                Paypal, //5
                PostaHavalesi //6 //PTT 
            }
        }

        public class Degiskenler
        {
            public class Site
            {
                public class Yollar
                {
                    public static string Banka = Class.Degiskenler.Site.Yollar.Resim + "bank\\";
                    public static string Kargo = Class.Degiskenler.Site.Yollar.Resim + "cargo\\";
                }
            }
        }

        // Bu Fonksiyonun yeri hatalı. Fonksiyonlar altında olması gerek. İşlemler bitince oraya alınacak!
        public class Odemeler
        {
            /// <summary>
            /// Pos Durumunu ve Geri Dönüşleri Veren Obje
            /// -   (Created By Fatih ÜNAL - 10.08.2012)
            /// </summary>
            public class POSDurum
            {
                /// <summary>
                /// İşlem Tipi
                /// -   (Created By Fatih ÜNAL - 10.08.2012)
                /// </summary>
                /// <value>
                /// Bin, Puan, Vade, Otorizasyon, Satis
                /// </value>
                public Sabitler.PosIslemTipleri ProcessType { get; set; }
                /// <summary>
                /// Mesajı döndürmek için
                /// -   (Created By Fatih ÜNAL - 10.08.2012)
                /// </summary>
                /// <value>
                /// Tip, başlık, içerik
                /// </value>
                public Objeler.Tanimlar.Messages Message { get; set; }
                /// <summary>
                /// Pos İşlem Bilgilerini Döndürüyor.
                /// -   (Created By Fatih ÜNAL - 10.08.2012)
                /// </summary>
                /// <value>
                /// Referans numarası
                /// Kullanılabilir Toplam Puan
                /// Kullanılabilir Toplam Puan Tutarı
                /// Kazanılan Toplam Puan
                /// Kazanılan Toplam Puan Tutarı
                /// Taksit sayısı
                /// Taksit tutarı
                /// Vade tutarı
                /// Vade oranı
                /// Vade gün sayısı
                /// Uyarı Mesajı
                /// </value>
                public SHOPObjeler.Tanimlar.POSIslem POSIslem { get; set; }
            }

            #region Pos tablosundan ID sine göre pos bilgilerini veriyor
            /// <summary>
            /// Pos İşlem Bilgilerini Döndürüyor.
            /// -   (Edited By Fatih ÜNAL - 10.08.2012) 
            /// -   PuanKullanim, BinNoKontrol fonksiyonları eklendi.
            /// -   Kullanılmayan TDSecure, OnOtorizasyon fonksiyonları kaldırıldı.
            /// </summary>
            public class Pos
            {
                /// <summary>
                /// Sanal pos ayarları
                /// </summary>
                /*
                 * Create HY - 20.11.2012 11:35
                 */
                #region Sanal pos tablosundan bilgi çağırma
                public static List<tbl_sbt_sanal_pos> Ayar(int SanalPosID)
                {
                    List<tbl_sbt_sanal_pos> SQL = new List<tbl_sbt_sanal_pos>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            SQL = (from p in db.tbl_sbt_sanal_pos
                                   where p.id == SanalPosID
                                   select p).AsEnumerable().Take(1).Cast<tbl_sbt_sanal_pos>().ToList();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return SQL;
                }
                #endregion

                /// <summary>
                /// Kredi kartı ödeme bilgilerini static objeye ekler
                /// </summary>
                /// <param name="KKO">SHOPObjeler.Tanimlar.KrediKartiIleOdeme</param>
                /*
                 * Create FÜ - 23.09.2012 19:02
                 */
                /*public static void KrediKartiIleOdemeBilgisiEkle(SHOPObjeler.Tanimlar.KrediKartiIleOdeme KKO)
                {
                    try
                    {
                        int index = SHOPObjeler.Listeler.KrediKartiIleOdeme.Where(k => k.Key == HttpContext.Current.Session.SessionID).Select(k => k.Key).Count();

                        if (index != 0)
                        {
                            SHOPObjeler.Listeler.KrediKartiIleOdeme.Remove(HttpContext.Current.Session.SessionID);
                        }

                        SHOPObjeler.Listeler.KrediKartiIleOdeme.Add(HttpContext.Current.Session.SessionID, KKO);
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
                }*/

                #region Bilgileri Al
                /// <summary>
                /// Sanal POS ait tüm bilgileri döndürür.
                /// </summary>
                /*
                 * Create FÜ - 10.08.2012
                 * Edit FÜ - 12.08.2012 01:47 KampanyaKodu eklendi.
                 * Edit FÜ - 12.08.2012 17:25 Para birimleri eklendi.
                 * Edit FÜ - 14.08.2012 03:16 XML URL ve 3D Secure Hata URL eklendi.
                 * Edit FÜ - 16.09.2012 04:20 Pesin alanı, Bankalar ve Para Birimleri obje yapısına göre güncellendi.
                 * Edit FÜ - 30.09.2012 17:33 Vade Kontrol Eklendi.
                 * Edit FÜ - 30.09.2012 23:46 Kod ID Eklendi.
                 */
                /// <param name="SanalPosID">Sanal Pos ID</param>
                /// <returns>
                /// SHOPObjeler.Tanimlar.POS şeklinde döner.
                /// </returns>
                public static SHOPObjeler.Tanimlar.POS Bilgiler(int SanalPosID)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from p in db.tbl_sbt_sanal_pos
                                       let Bankalar = db.tbl_sbt_sanal_pos_banka.Where(x => x.sanal_pos_id == SanalPosID).Select(x => new { x.banka_id, x.ana_banka, x.bin_kontrol }).AsEnumerable()
                                       let ParaBirimleri = db.tbl_sbt_sanal_pos_para_birim.Where(x => x.sanal_pos_id == SanalPosID).Select(x => new { x.para_birim_id, x.kisaltma }).AsEnumerable()
                                       where p.id == SanalPosID
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
                                           p.puan_kullanim,
                                           p.vade_kontrol,
                                           p.test,
                                           p.test_url,
                                           p.kampanya_kodu
                                       });

                            if (SQL.Any())
                            {
                                #region POS Objesi
                                SHOPObjeler.Tanimlar.POS P = new SHOPObjeler.Tanimlar.POS();
                                P.ID = SQL.Select(p => p.id).FirstOrDefault();
                                P.KodID = SQL.Select(p => p.kod_id).FirstOrDefault();

                                #region Banka Objesi
                                List<SHOPObjeler.Tanimlar.POSBankalar> L1 = new List<SHOPObjeler.Tanimlar.POSBankalar>();

                                foreach (var t in SQL.Select(p => p.Bankalar))
                                {
                                    SHOPObjeler.Tanimlar.POSBankalar B = new SHOPObjeler.Tanimlar.POSBankalar();
                                    B.SanalPOSID = P.ID;
                                    B.BankaID = t.Select(k => k.banka_id).FirstOrDefault();
                                    B.BinKontrol = t.Select(k => k.bin_kontrol).FirstOrDefault();
                                    B.AnaBanka = t.Select(k => k.ana_banka).FirstOrDefault();

                                    L1.Add(B);
                                }

                                P.Bankalar = L1;
                                #endregion

                                #region Para Birimleri Objesi
                                List<SHOPObjeler.Tanimlar.POSParaBirimleri> L2 = new List<SHOPObjeler.Tanimlar.POSParaBirimleri>();

                                foreach (var t in SQL.Select(p => p.ParaBirimleri))
                                {
                                    SHOPObjeler.Tanimlar.POSParaBirimleri PB = new SHOPObjeler.Tanimlar.POSParaBirimleri();
                                    PB.SanalPOSID = P.ID;
                                    PB.ParaBirimID = t.Select(k => k.para_birim_id).FirstOrDefault();
                                    PB.Kisaltma = t.Select(k => k.kisaltma).FirstOrDefault();

                                    L2.Add(PB);
                                }

                                P.ParaBirimleri = L2;
                                #endregion

                                P.TID = SQL.Select(p => p.api_kullanicisi).FirstOrDefault();
                                P.MID = SQL.Select(p => p.magaza_no).FirstOrDefault();
                                P.PosNo = SQL.Select(p => p.pos_no).FirstOrDefault();
                                P.URL = SQL.Select(p => p.url).FirstOrDefault();
                                P.XmlURL = SQL.Select(p => p.xml_url).FirstOrDefault();
                                P.TDSecure = SQL.Select(p => p.C3d_secure).FirstOrDefault();
                                P.TDSecureKey = SQL.Select(p => p.C3d_secure_key).FirstOrDefault();
                                P.TDSecureURL = SQL.Select(p => p.C3d_secure_url).FirstOrDefault();
                                P.TDSecureGeriDonusURL = SQL.Select(p => p.C3d_secure_geri_donus_url).FirstOrDefault();
                                P.TDSecureHataURL = SQL.Select(p => p.C3d_secure_hata_url).FirstOrDefault();
                                P.OnOtorizasyon = SQL.Select(p => p.on_otorizasyon).FirstOrDefault();
                                P.Test = SQL.Select(p => p.test).FirstOrDefault();
                                P.TestURL = SQL.Select(p => p.test_url).FirstOrDefault();
                                P.Pesin = SQL.Select(p => p.pesin).FirstOrDefault();
                                P.VadeKontrol = SQL.Select(p => p.vade_kontrol).FirstOrDefault();
                                P.PuanKullanim = SQL.Select(p => p.puan_kullanim).FirstOrDefault();
                                P.KampanyaKodu = SQL.Select(p => p.kampanya_kodu).FirstOrDefault();
                                #endregion

                                return P;
                            }
                            else
                            {
                                return null;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }
                #endregion

                /// <summary>
                /// Sanal POS ait tüm bilgileri objeden döndürür.
                /// </summary>
                /// <param name="SanalPosID">Sanal Pos ID</param>
                /// <returns>
                /// SHOPObjeler.Tanimlar.POS şeklinde döner.
                /// </returns>
                /*
                 * Create FÜ - 17.09.2012 02:08 
                 */
                public static SHOPObjeler.Tanimlar.POS POSBilgisi(int SanalPosID)
                {
                    SHOPObjeler.Tanimlar.POS P = new SHOPObjeler.Tanimlar.POS();

#if DEBUG
                    try
                    {
#endif
                        var SQL = (from p in SHOPObjeler.Listeler.POS
                                   where p.ID == SanalPosID
                                   select p).AsEnumerable().Take(1);

                        if (SQL.Count() == 1)
                        {
                            P = SQL.Cast<SHOPObjeler.Tanimlar.POS>().FirstOrDefault();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return P;
                }

                #region Bin Numarası Kontrolü
                /// <summary>
                /// Kredi kartının ilk 6 hanesi veritabanındaki bin tablosunda karşılığı var mı kontrol eder.
                /// -   (Created By Fatih ÜNAL - 10.08.2012)
                /// </summary>
                /// <param name="BankaID">Banka ID</param>
                /// <param name="BinNo">Kredi kartı ilk 6 hane (BIN)</param>
                /// <returns>
                /// Bool döndürür.
                /// </returns>
                public static bool BinNoKontrol(int BankaID, string BinNo)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from p in db.tbl_sbt_sanal_pos_bin
                                       where p.banka_id == BankaID && p.bin_kodu == BinNo
                                       select p.id).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return false;
                    }
#endif
                }
                #endregion

                /// <summary>
                /// test kredi kartlarını listeye atıyor
                /// </summary>
                /*
                 * Create FÜ 00.00.00 00:00
                 * Edit FÜ - 14.08.2012 03:14 Test Kartı 3D Secure kullanımına uygun mu kontrol için eklenen alan eklendi.
                */
                public static List<SHOPObjeler.Tanimlar.KrediKart> TestKrediKart(int SanalPosID)
                {
                    List<SHOPObjeler.Tanimlar.KrediKart> L = new List<SHOPObjeler.Tanimlar.KrediKart>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from p in db.tbl_sbt_sanal_pos_test_kart
                                       where p.sanal_pos_id == SanalPosID
                                       select
                                       new
                                       {
                                           p.kart_no,
                                           p.son_kullanim,
                                           p.CVC,
                                           p.C3DSecure
                                       });

                            if (SQL.Any())
                            {
                                foreach (var i in SQL)
                                {
                                    SHOPObjeler.Tanimlar.KrediKart KK = new SHOPObjeler.Tanimlar.KrediKart();
                                    KK.AdSoyad = "TEST KARTI";
                                    KK.KartNo = i.kart_no;
                                    KK.SonKullanim = i.son_kullanim;
                                    KK.CVC = i.CVC;
                                    KK.TDSecure = i.C3DSecure;
                                    L.Add(KK);
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

                    return L;
                }

                /// <summary>
                /// Seçilen Banka ID sine göre POS ID si getiriyor.
                /// </summary>
                /*
                 * Create FÜ 12.08.2012 23:22
                 * Edit FÜ 16.09.2012 15:28 Objeden alması sağlandı.
                 * Edit FÜ 25.09.2012 00:21 Bilgilerin geldiği obje değişti.
                 * Edit FÜ 30.09.2012 23:06 Banka Onay eklendi.
                 */
                /// <param name="BankaID">Banka ID</param>
                /// <returns>
                /// int olarak POS ID si verir.
                /// </returns>
                public static int POSID(int BankaID)
                {
                    int POSID = 0;

#if DEBUG
                    try
                    {
#endif
                        /*
                        var L = SHOPObjeler.Listeler.POS.Where(p => p.Pesin == Pesin)
                            .Select(k => k.Bankalar)
                            .Select(p => p.Where(k => k.BankaID == BankaID).FirstOrDefault());

                        var SQL = (from p in L
                                   select p.SanalPOSID).AsEnumerable().Take(1);
                        */

                        var SQL = (from p in SHOPObjeler.Listeler.ViewPosBankalarTaksit
                                   where p.Onay == true && p.Pesin == false && p.BankaID == BankaID && p.BankaOnay == true
                                   select p.SanalPosID).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            POSID = SQL.FirstOrDefault();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return POSID;
                }

                /// <summary>
                /// Create FÜ 25.09.2012 00:24
                /// </summary>
                /// <returns>int döner</returns>
                public static int PesinPOSU()
                {
                    int POSID = 0;

#if DEBUG
                    try
                    {
#endif
                        var SQL = (from p in SHOPObjeler.Listeler.ViewPosBankalarTaksit
                                   where p.Onay == true && p.Pesin == true
                                   select p.SanalPosID).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            POSID = SQL.FirstOrDefault();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return POSID;
                }
            }
            #endregion

            #region Paypal bilgilerini veriyor
            public class Paypal
            {
                //Kullanım Response.Redirect(Paypal.Adres(toplam, “UrunAdi”, SiparisID));
                //public static string AccountEmail = Fonksiyonlar.Firma.Paypal();
                public static string AccountEmail = "fatih@acoder.info";
                public static string PayPalUrl = "https://www.sandbox.paypal.com/us/cgi-bin/webscr?";
                private static string PayPalBaseUrl = "https://www.paypal.com/cgi-bin/webscr?";
                private static string ImageUrl = "http://shop.zirvedns.com/images/logo.png";
                private static string SuccessUrl = "http://localhost:94/basket-odeme.aspx";
                private static string CancelUrl = "http://localhost:94/basket-odeme.aspx";
                private static string iNumber = "123";
                public static string Adres(decimal Amount, string iName, string SiparisID)
                {
#if DEBUG
                    try
                    {
#endif
                        //Amerikada "." kullanıldığı için "," ile replace ediyoruz
                        string tutar = Convert.ToString(Amount).Replace(',', '.');
                        StringBuilder Url = new StringBuilder();
                        //HttpUtility.UrlEncode(AccountEmail)
                        Url.Append(PayPalBaseUrl + "cmd=_xclick&undefined_quantity=0&no_shipping=1&no_note=1&currency_code=USD&add=0");
                        Url.AppendFormat("&business={0}", HttpUtility.UrlEncode(AccountEmail));
                        Url.AppendFormat("&i_name={0}", HttpUtility.UrlEncode(iName));
                        Url.AppendFormat("&i_number={0}", HttpUtility.UrlEncode(iNumber));
                        Url.AppendFormat("&image_url={0}", HttpUtility.UrlEncode(ImageUrl));
                        Url.AppendFormat("&amount={0:f2}", tutar);
                        Url.AppendFormat("&return={0}", HttpUtility.UrlEncode(SuccessUrl));
                        Url.AppendFormat("&cancel_return={0}", HttpUtility.UrlEncode(CancelUrl));
                        return Url.ToString();
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }
            }
            #endregion

            /// <summary>
            /// Puan Sorgulama, Vade Sorgulama, Ön Otorizasyon, Satış gibi POS İşlemlerini gerçekleştirir.
            /// </summary>
            /* 
             * Create FÜ - 00.00.00 - 00:00
             * Edit FÜ - 12.08.2012 - 18:30 Summary kısmı eklendi.
             * Edit FÜ - 16.09.2012 - 04:23 Para Birimleri kısmı güncellendi.
             * Edit FÜ - 30.09.2012 - 23:47 Vade Kontrol Eklendi.
             */
            /// <param name="PT">POS İşlem Tipleri Objesi</param>
            /// <param name="P">POS Bilgileri Objesi</param>
            /// <param name="K">Kredi Kartı Bilgileri Objesi</param>
            /// <param name="O">Ödeme Bilgileri Objesi</param>
            /// <returns>
            /// SHOPClass.Odemeler.POSDurum objesi döndürür.
            /// </returns>
            public static SHOPClass.Odemeler.POSDurum PosIslem(string IslemID, SHOPClass.Sabitler.PosIslemTipleri PT, SHOPObjeler.Tanimlar.POS P, SHOPObjeler.Tanimlar.KrediKart K, SHOPObjeler.Tanimlar.KKOdemeBilgileri O)
            {
                #region POS Durum Objesi
                SHOPClass.Odemeler.POSDurum PD = new SHOPClass.Odemeler.POSDurum();
                #endregion

                #region Obje İçin Yeni Instance Oluşturma
                SHOPObjeler.Tanimlar.POSIslem PI = new SHOPObjeler.Tanimlar.POSIslem();
                Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                #endregion

                if (P.KodID == 1)
                {
                    if (P != null && K != null)
                    {
#if DEBUG
                        try
                        {
#endif
                            #region YKB Pos Instance
                            C_Posnet CP = new C_Posnet();
                            #endregion

                            #region Empty Bool Instance
                            Boolean B = false;
                            #endregion

                            #region POS Bilgileri
                            #region Mağaza ID, Terminal ID vb. Gibi Bilgileri Atama
                            CP.SetMid(P.MID);
                            CP.SetTid(P.TID);
                            #endregion
                            #region URL Ayarlama
                            if (P.Test)
                            {
                                if (!string.IsNullOrEmpty(P.TestURL))
                                {
                                    CP.SetURL(P.TestURL);
                                }
                                else
                                {
                                    CP.SetURL(P.URL);
                                }
                            }
                            else
                            {
                                CP.SetURL(P.URL);
                            }
                            #endregion
                            #endregion

                            #region Islem ID
                            //! 24 karakter istiyor 
                            IslemID = IslemID.Substring(0, 24);
                            #endregion

                            #region İşlem Tipleri
                            switch (PT)
                            {
                                #region Puan Sorgula
                                case SHOPClass.Sabitler.PosIslemTipleri.PuanSorgula:
                                    #region İşlem Tipini Atama
                                    PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.PuanSorgula;
                                    #endregion
                                    B = CP.DoPointInquiryTran(K.KartNo, Fonksiyonlar.Genel.TersCevir(K.SonKullanim));
                                    break;
                                #endregion

                                #region Puan Kullan
                                case SHOPClass.Sabitler.PosIslemTipleri.PuanKullan:
                                    #region İşlem Tipini Atama
                                    PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.PuanKullan;
                                    #endregion
                                    B = CP.DoPointUsageTran(K.KartNo, Fonksiyonlar.Genel.TersCevir(K.SonKullanim), IslemID, Fonksiyonlar.Genel.KurusCevir(O.Tutar.ToString()), P.ParaBirimleri.Select(t => t.Kisaltma).FirstOrDefault());
                                    break;
                                #endregion

                                #region Vade Farkı Öğren
                                case SHOPClass.Sabitler.PosIslemTipleri.Vade:
                                    #region İşlem Tipini Atama
                                    PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Vade;
                                    #endregion
                                    B = CP.DoVFTInquiry(K.KartNo, Fonksiyonlar.Genel.KurusCevir(O.Tutar.ToString()), O.Taksit.ToString(), P.KampanyaKodu);
                                    break;
                                #endregion

                                #region Ön Otorizasyon Yap
                                case SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon:
                                    #region İşlem Tipini Atama
                                    PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon;
                                    #endregion
                                    B = CP.DoAuthTran(K.KartNo, Fonksiyonlar.Genel.TersCevir(K.SonKullanim), K.CVC, IslemID, Fonksiyonlar.Genel.KurusCevir(O.Tutar.ToString()), P.ParaBirimleri.Select(t => t.Kisaltma).FirstOrDefault(), O.Taksit.ToString());
                                    break;
                                #endregion

                                #region Satış Yap
                                case SHOPClass.Sabitler.PosIslemTipleri.Satis:
                                    #region İşlem Tipini Atama
                                    PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Satis;
                                    #endregion
                                    B = CP.DoSaleTran(K.KartNo, Fonksiyonlar.Genel.TersCevir(K.SonKullanim), K.CVC, IslemID, Fonksiyonlar.Genel.KurusCevir(O.Tutar.ToString()), P.ParaBirimleri.Select(t => t.Kisaltma).FirstOrDefault(), O.Taksit.ToString());
                                    break;
                                #endregion
                            }
                            #endregion

                            if (B == true)
                            {
                                #region Durum Kodu
                                if (!string.IsNullOrEmpty(CP.GetApprovedCode()))
                                {
                                    PI.DurumKodu = CP.GetApprovedCode();
                                }
                                #endregion

                                if (CP.GetApprovedCode() == "1" || CP.GetApprovedCode() == "2")
                                {
                                    //- İşlem Onaylandıysa
                                    #region INFO
                                    //x GetHostlogkey Referans numarası
                                    //x GetAuthcode Onay Kodu
                                    //x GetTotalPoint Kullanılabilir Toplam Puan
                                    //x GetTotalPointAmount Kullanılabilir Toplam Puan Tutarı (Yeni Kuruş cinsinden)
                                    //x GetPoint Kazanılan Toplam Puan
                                    //x GetPointAmount Kazanılan Toplam Puan Tutarı (Yeni Kuruş cinsinden)
                                    //x GetInstalmentNumber Taksit sayısı
                                    //x GetInstalmentAmount Taksit tutarı (Yeni Kuruş cinsinden)
                                    #endregion

                                    #region Onay Bilgisi
                                    #region Onay Kodu
                                    if (!string.IsNullOrEmpty(CP.GetAuthcode().Trim()))
                                    {
                                        PI.OnayKodu = CP.GetAuthcode();
                                    }
                                    #endregion
                                    #region Referans Numarası
                                    if (!string.IsNullOrEmpty(CP.GetHostlogkey().Trim()))
                                    {
                                        PI.ReferansNumarasi = CP.GetHostlogkey();
                                    }
                                    #endregion
                                    #endregion
                                    #region Puan Bilgileri
                                    if (!string.IsNullOrEmpty(CP.GetTotalPoint()))
                                    {
                                        PI.KullanilabilirToplamPuan = CP.GetTotalPoint();
                                    }
                                    if (!string.IsNullOrEmpty(CP.GetTotalPointAmount()))
                                    {
                                        PI.KullanilabilirToplamPuanTutari = CP.GetTotalPointAmount();
                                    }
                                    if (!string.IsNullOrEmpty(CP.GetPoint()))
                                    {
                                        PI.KazanilanToplamPuan = CP.GetPoint();
                                    }
                                    if (!string.IsNullOrEmpty(CP.GetPointAmount()))
                                    {
                                        PI.KazanilanToplamPuanTutari = CP.GetPointAmount();
                                    }
                                    #endregion
                                    #region Taksit Bilgileri
                                    if (!string.IsNullOrEmpty(CP.GetInstalmentNumber()))
                                    {
                                        PI.TaksitSayisi = CP.GetInstalmentNumber();
                                    }
                                    if (!string.IsNullOrEmpty(CP.GetInstalmentAmount()))
                                    {
                                        PI.TaksitTutari = Fonksiyonlar.Genel.TLCevir(CP.GetInstalmentAmount());
                                    }
                                    #endregion
                                    #region Vade Bilgileri
                                    if (!string.IsNullOrEmpty(CP.GetVFTAmount()))
                                    {
                                        PI.VadeTutari = Fonksiyonlar.Genel.TLCevir(CP.GetVFTAmount());
                                    }
                                    if (!string.IsNullOrEmpty(CP.GetVFTRate()))
                                    {
                                        PI.VadeOrani = CP.GetVFTRate();
                                    }
                                    if (!string.IsNullOrEmpty(CP.GetVFTDayCount()))
                                    {
                                        PI.VadeGunSayisi = CP.GetVFTDayCount();
                                    }
                                    #endregion
                                    #region Dönüş Mesajı
                                    PD.Message.Type = Class.Sabitler.MessageTypes.OK;
                                    PD.Message.Header = "İşlem Başarılı";
                                    PD.Message.Text = "İşlem başarıyla gerçekleştirilmiştir.";
                                    #endregion
                                }
                                else
                                {
                                    //- İşlem Onaylanmadıysa
                                    #region INFO
                                    //x GetResponseCode Hata kodu
                                    //x GetResponseText Hata mesajı
                                    #endregion

                                    #region POS Hata Mesajı
                                    if (!string.IsNullOrEmpty(CP.GetResponseCode()))
                                    {
                                        PI.HataMesajiKodu = CP.GetResponseCode();
                                    }
                                    if (!string.IsNullOrEmpty(CP.GetResponseText()))
                                    {
                                        PI.HataMesaji = CP.GetResponseText();
                                    }
                                    #endregion
                                    #region Dönüş Mesajı
                                    PD.Message.Type = Class.Sabitler.MessageTypes.ERROR;
                                    PD.Message.Header = "Bir Hata Oluştu";
                                    PD.Message.Text = CP.GetResponseCode() + " - " + CP.GetResponseText();
                                    #endregion
                                }
                            }
                            else
                            {
                                #region Dönüş Mesajı
                                M.Type = Class.Sabitler.MessageTypes.ERROR;
                                M.Header = "Bir Hata Oluştu";
                                M.Text = "False geldi.";
                                #endregion
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                            #region Dönüş Mesajı
                            M.Type = Class.Sabitler.MessageTypes.ERROR;
                            M.Header = "Bir Hata Oluştu";
                            M.Text = ex.Message;
                            #endregion
                        }
#endif
                    }
                    else
                    {
                        #region Dönüş Mesajı
                        M.Type = Class.Sabitler.MessageTypes.Other;
                        M.Header = "İşlem Hatası";
                        M.Text = "POS yada Kart Objesi Boş Geldi.";
                        #endregion
                    }
                }
                else
                {
                    #region Dönüş Mesajı
                    M.Type = Class.Sabitler.MessageTypes.Other;
                    M.Header = "POS Hatası";
                    M.Text = "Başka banka için çağırıldı.";
                    #endregion
                }

                #region Objeye Diğer Objeleri Atama
                PD.POSIslem = PI;
                PD.Message = M;
                #endregion

                return PD;
            }

            /// <summary>
            /// Seçilen banka için Bin kontrolü ve gönderilen kart için Bin doğrulama işlemi yapıyor.
            /// </summary>
            /* 
             * Create FÜ - 10.08.2012
             * Edit FÜ - 12.08.2012 - 18:23 If kısmına comment eklendi, Summary alanı açıklaması değiştirildi.
             * Edit FÜ - 16.09.2012 - 04:25 BankaID kısmı objective oldu.
             */
            /// <param name="P">SHOPObjeler.Tanimlar.POS</param>
            /// <param name="K">SHOPObjeler.Tanimlar.KrediKart</param>
            /// <returns>
            /// Bool döndürür
            /// </returns>
            public static bool BinKontrol(SHOPObjeler.Tanimlar.POS P, SHOPObjeler.Tanimlar.KrediKart K)
            {
#if DEBUG
                try
                {
#endif
                    if (P != null && K != null)
                    {
                        if (K.BankaID > 0)
                        {
                            int sonuc = P.Bankalar.Where(p => p.BankaID == K.BankaID).Select(p => p.SanalPOSID).Count();

                            bool B = false;

                            if (sonuc > 0)
                            {
                                B = true;
                            }

                            #region Seçilen Bankada Bin Kontrolü Açıksa
                            if (B)
                            {
                                if (!string.IsNullOrEmpty(K.KartNo))
                                {
                                    return SHOPClass.Odemeler.Pos.BinNoKontrol(K.BankaID, K.KartNo.Substring(0, 6));
                                }
                                else
                                {
                                    return false;
                                }
                            }
                            #endregion
                            else
                            {
                                return false;
                            }
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
#if DEBUG
                }
                catch (Exception ex)
                {
                    Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    return false;
                }
#endif
            }
        }

        public class Fonksiyonlar
        {
            /// <summary>
            /// POS İçin İşlem ID si üreti.
            /// </summary>
            /// <param name="Kelime">Baştaki kelime TEST_1234567890 gibi verilmesini sağlar. Boş ise TEST diye otomatik ekler.</param>
            /// <param name="Karakter">Geri dönecek karakter uzunluğu.</param> 
            /*
             * Create FÜ 07.10.2012 - 02:15
             */
            public static string IslemID(string Kelime, int Karakter)
            {
                string RIslemID = null;
                string NKelime = "TEST";

#if DEBUG
                try
                {
#endif
                    if (!string.IsNullOrEmpty(Kelime))
                    {
                        NKelime = Kelime;
                    }

                    RIslemID = NKelime + "_" + (new Random((int)DateTime.Now.Ticks)).Next().ToString() + (DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond).ToString() + (new Random((int)DateTime.Now.Ticks)).Next().ToString();

                    if (Karakter > 0)
                    {
                        RIslemID = RIslemID.Substring(0, Karakter);
                    }

                    return RIslemID;
#if DEBUG
                }
                catch (Exception ex)
                {
                    Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    return null;
                }
#endif
            }

            /// <summary>
            /// Kredi kartı numarasını formatlar.
            /// Sifrele kısmı <c>true</c> ise Ayrac ve Karakter parametreleri aktif hale gelir.
            /// </summary>
            /// <param name="KrediKartiNo">Kredi Kartı Numarası</param>
            /// <param name="Sifrele">Eğer <c>true</c> olursa geri dönürken ilk 6 karakteri ve son 3 karakteri gönderir.</param>
            /// <param name="Ayrac">Ayraç karakteri</param>
            /// <param name="Karakter">Şifreleme karakteri</param>
            /// <returns></returns>
            /*
             * Create FÜ - 13.09.2012 19:52
             */
            public static string KartNoFormatla(string KrediKartiNo, bool Sifrele, string Ayrac, string Karakter)
            {
                if (!string.IsNullOrEmpty(KrediKartiNo))
                {
                    if (KrediKartiNo.Length == 16)
                    {
#if DEBUG
                        try
                        {
#endif
                            string e = String.Format("{0:0000 0000 0000 0000}", (Int64.Parse(KrediKartiNo)));
                            string[] t = e.Split();


                            if (Sifrele)
                            {
                                string k = e;
                                string karak = "*";

                                if (!string.IsNullOrEmpty(Karakter))
                                {
                                    karak = Karakter;
                                }

                                if (!string.IsNullOrEmpty(Ayrac))
                                {
                                    k = t[0] + Ayrac + t[1].Substring(0, 2) + karak + karak + Ayrac + karak + karak + karak + karak + Ayrac + karak + t[3].Substring(1, 3);
                                }
                                else
                                {
                                    k = t[0] + t[1].Substring(0, 2) + karak + karak + karak + karak + karak + karak + karak + t[3].Substring(1, 3);
                                }

                                return k;
                            }
                            else
                            {
                                return e;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }
                    else
                    {
                        return KrediKartiNo;
                    }
                }
                else
                {
                    return null;
                }
            }

            /// <summary>
            /// TC Kimlik no kontrol
            /// </summary>
            /*
             * Create HY 10/09/12 23:43
            */
            public static bool TCKimlikNoKontrol(string TcKimlikNo)
            {
#if DEBUG
                try
                {
#endif
                    int index = 0;
                    int toplam = 0;
                    foreach (char n in TcKimlikNo)
                    {
                        if (index < 10)
                        {
                            toplam += Convert.ToInt32(char.ToString(n));
                        }
                        index++;
                    }
                    if (toplam % 10 == Convert.ToInt32(TcKimlikNo[10].ToString()))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
#if DEBUG
                }
                catch (Exception ex)
                {
                    Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    return false;
                }
#endif
            }

            /// <summary>
            /// Database deki ödeme tiplerini tbl_sbt_odeme_sekli tablosundan alıp dolduruyor.
            /// </summary>
            /*
             * Create FÜ 18.08.2012 01:15
            */
            public static void OdemetipleriDoldur()
            {
#if DEBUG
                try
                {
#endif
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        var SQL = (from p in db.tbl_sbt_odeme_sekli
                                   select
                                   new
                                   {
                                       p.id,
                                       p.ad
                                   });

                        if (SQL.Any())
                        {
                            foreach (var i in SQL)
                            {
                                #region Genel Objesi Tanımlama
                                SHOPObjeler.Tanimlar.Genel G = new SHOPObjeler.Tanimlar.Genel();
                                G.ID = i.id;
                                G.AD = i.ad;
                                #endregion
                                SHOPObjeler.Listeler.OdemeTipleri.Add(G);
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

            public class Firma
            {
                public static string Paypal()
                {
#if DEBUG
                    try
                    {
#endif
                        var SQL = (from p in Objeler.Listeler.Firma
                                   where p.ID == 1
                                   select p.Paypal).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            return SQL.FirstOrDefault();
                        }
                        else
                        {
                            return null;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }
            }

            public class Uygulama
            {
                /// <summary>
                /// Kullanıcı fatura adres ve teslimat adres çağırma
                /// </summary>
                /*
                 * Create HY 14.09.2012 15:39
                 */
                #region Fatura adres ve teslimat adres çağırma
                public static SHOPObjeler.Sonuclar.Adres AdresGetir(int AdresID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Adres Sonuc = new SHOPObjeler.Sonuclar.Adres();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Adresler> L = new List<SHOPObjeler.Tanimlar.Adresler>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_kullanicilar_adresler
                                       where a.id == AdresID
                                       select new
                                       {
                                           a.id,
                                           a.kullanici_id,
                                           a.tip,
                                           a.baslik,
                                           a.il_id,
                                           a.il,
                                           a.ilce_id,
                                           a.ilce,
                                           a.adres,
                                           a.acik_adres,
                                           a.posta_kodu,
                                           a.ulke_id,
                                           ulke = db.tbl_sbt_ulke.Where(p => p.id == a.ulke_id).Select(p => p.ad).FirstOrDefault()
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.OK;
                                #endregion

                                #region Kullanıcı Objesi
                                SHOPObjeler.Tanimlar.Kullanici K = new SHOPObjeler.Tanimlar.Kullanici();
                                K.ID = SQL.kullanici_id;
                                #endregion;

                                #region Ülke Objesi
                                SHOPObjeler.Tanimlar.Ulke U = new SHOPObjeler.Tanimlar.Ulke();
                                U.ID = SQL.ulke_id;
                                U.Ad = SQL.ulke;
                                #endregion;

                                #region İl Objesi
                                SHOPObjeler.Tanimlar.UlkeIl Il = new SHOPObjeler.Tanimlar.UlkeIl();
                                Il.ID = SQL.il_id;
                                #endregion;

                                #region İlçe Objesi
                                SHOPObjeler.Tanimlar.UlkeIlce Ilce = new SHOPObjeler.Tanimlar.UlkeIlce();
                                Ilce.ID = SQL.ilce_id;
                                #endregion;

                                #region Adres Objesi
                                SHOPObjeler.Tanimlar.Adresler A = new SHOPObjeler.Tanimlar.Adresler();
                                A.ID = SQL.id;
                                A.Kullanici = K;
                                A.Tip = SQL.tip;
                                A.Baslik = SQL.baslik;
                                A.UlkeID = U;
                                A.Il = SQL.il;
                                A.IlID = Il;
                                A.Ilce = SQL.ilce;
                                A.IlceID = Ilce;
                                A.PostaKodu = SQL.posta_kodu;
                                A.Adres = SQL.adres;
                                A.AcikAdres = SQL.acik_adres;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Adresler = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Kullanıcı vergi bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 14.09.2012 20:24
                 */
                #region Kullanıcı vergi bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.VergiBilgi VergiBilgiGetir(int AdresID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.VergiBilgi Sonuc = new SHOPObjeler.Sonuclar.VergiBilgi();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.VergiBilgiler> L = new List<SHOPObjeler.Tanimlar.VergiBilgiler>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_kullanicilar_vergi_bilgiler
                                       where a.id == AdresID
                                       select new
                                       {
                                           a.id,
                                           a.kullanici_id,
                                           a.adres_id,
                                           a.tip,
                                           a.vergi_dairesi,
                                           a.vergi_no,
                                           a.tc_kimlik_no
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.OK;
                                #endregion

                                #region Kullanıcı Objesi
                                SHOPObjeler.Tanimlar.Kullanici Kullanici = new SHOPObjeler.Tanimlar.Kullanici();
                                Kullanici.ID = SQL.kullanici_id;
                                #endregion;

                                #region Vergi bilgi Objesi
                                SHOPObjeler.Tanimlar.VergiBilgiler A = new SHOPObjeler.Tanimlar.VergiBilgiler();
                                A.ID = SQL.id;
                                A.Kullanici = Kullanici;
                                A.AdresID = SQL.adres_id;
                                A.Tip = SQL.tip;
                                //A.Firma = SQL.firma;
                                A.VergiDairesi = SQL.vergi_dairesi;
                                A.VergiNo = SQL.vergi_no;
                                A.TcKimlikNo = SQL.tc_kimlik_no;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.VergiBilgiler = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Kullanıcı bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 14.09.2012 20:05
                 */
                #region Kullanıcı bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.Kullanici KullanıcıGetir(int KullaniciID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Kullanici Sonuc = new SHOPObjeler.Sonuclar.Kullanici();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Kullanici> L = new List<SHOPObjeler.Tanimlar.Kullanici>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_kullanicilar
                                       where a.id == KullaniciID
                                       select new
                                       {
                                           a.id,
                                           a.uyelik_metot_id,
                                           a.uyelik_metot_uye_id,
                                           a.uyelik_metot_info,
                                           a.ad_soyad,
                                           a.sifre,
                                           a.mail,
                                           a.alan_kodu_id,
                                           a.gsm,
                                           a.onay
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.OK;
                                #endregion

                                #region Uyelik metotu
                                SHOPObjeler.Tanimlar.Genel UyelikMetot = new SHOPObjeler.Tanimlar.Genel();
                                UyelikMetot.ID = SQL.uyelik_metot_id;
                                #endregion

                                #region Adres Objesi
                                SHOPObjeler.Tanimlar.Kullanici A = new SHOPObjeler.Tanimlar.Kullanici();
                                A.ID = SQL.id;
                                A.UyelikMetotID = UyelikMetot;
                                A.UyelikMetotUyeID = SQL.uyelik_metot_uye_id;
                                A.UyelikMetotInfo = SQL.uyelik_metot_info;
                                A.AdSoyad = SQL.ad_soyad;
                                A.Sifre = SQL.sifre;
                                A.Mail = SQL.mail;
                                A.AlanKoduID = SQL.alan_kodu_id;
                                A.Gsm = SQL.gsm;
                                A.Onay = SQL.onay;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Kullanicilar = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Ürün bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 14.09.2012 22:17
                 */
                #region Ürün bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.Urun UrunGetir(int UrunID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Urun Sonuc = new SHOPObjeler.Sonuclar.Urun();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Urunler> L = new List<SHOPObjeler.Tanimlar.Urunler>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_urunler
                                       where a.id == UrunID
                                       select new
                                       {
                                           a.id,
                                           a.dil_id,
                                           a.kod_id,
                                           a.resim_id,
                                           a.resim_kategori_id,
                                           a.video_kategori_id,
                                           a.ad,
                                           a.on_aciklama,
                                           a.aciklama,
                                           a.en,
                                           a.boy,
                                           a.yukseklik,
                                           a.desi,
                                           a.kg,
                                           a.fiyat,
                                           a.para_birimi_id,
                                           a.kdv_id,
                                           a.kargo_hesaplama_id,
                                           a.indirim_id,
                                           a.stok,
                                           a.yeni,
                                           a.anasayfa,
                                           a.onay
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.OK;
                                #endregion

                                #region Kdvler
                                SHOPObjeler.Tanimlar.SbtKdv Kdv = new SHOPObjeler.Tanimlar.SbtKdv();
                                Kdv.ID = SQL.kdv_id;
                                #endregion

                                #region Diller
                                SHOPObjeler.Tanimlar.Diller Diller = new SHOPObjeler.Tanimlar.Diller();
                                Diller.ID = SQL.dil_id;
                                #endregion

                                #region Para Birim
                                SHOPObjeler.Tanimlar.ParaBirim ParaBirim = new SHOPObjeler.Tanimlar.ParaBirim();
                                ParaBirim.ID = SQL.para_birimi_id;
                                #endregion

                                #region Kod
                                SHOPObjeler.Tanimlar.Genel Kod = new SHOPObjeler.Tanimlar.Genel();
                                Kod.ID = SQL.kod_id;
                                #endregion

                                #region Para Birim
                                SHOPObjeler.Tanimlar.Indirim Indirim = new SHOPObjeler.Tanimlar.Indirim();
                                Indirim.ID = SQL.indirim_id;
                                #endregion

                                #region Adres Objesi
                                SHOPObjeler.Tanimlar.Urunler A = new SHOPObjeler.Tanimlar.Urunler();
                                A.ID = SQL.id;
                                A.DilID = Diller;
                                A.KodID = Kod;
                                A.ResimID = SQL.resim_id;
                                A.ResimKategoriID = SQL.resim_kategori_id;
                                A.VideoKategoriID = SQL.video_kategori_id;
                                A.Ad = SQL.ad;
                                A.OnAciklama = SQL.on_aciklama;
                                A.En = SQL.en;
                                A.Boy = SQL.boy;
                                A.Yukseklik = SQL.yukseklik;
                                A.Desi = SQL.desi;
                                A.Kg = SQL.kg;
                                A.Fiyat = SQL.fiyat;
                                A.ParaBirimID = ParaBirim;
                                A.KdvID = Kdv;
                                A.KargoHesaplamaID = SQL.kargo_hesaplama_id;
                                A.IndirimID = Indirim;
                                A.Stok = SQL.stok;
                                A.Yeni = SQL.yeni;
                                A.AnaSayfa = SQL.anasayfa;
                                A.Onay = SQL.onay;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Urunler = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Ürün indirim bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 15.09.2012 22:17
                 */
                #region Ürün indirim bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.Indirim IndirimGetir(int IndirimID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Indirim Sonuc = new SHOPObjeler.Sonuclar.Indirim();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Indirim> L = new List<SHOPObjeler.Tanimlar.Indirim>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_indirimler
                                       where a.id == IndirimID
                                       select new
                                       {
                                           a.id,
                                           a.ad,
                                           a.yuzde,
                                           a.onay
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region İndirim Objesi
                                SHOPObjeler.Tanimlar.Indirim A = new SHOPObjeler.Tanimlar.Indirim();
                                A.ID = SQL.id;
                                A.Ad = SQL.ad;
                                A.Yuzde = SQL.yuzde;
                                A.Onay = SQL.onay;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Indirimler = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Ödeme türüne göre indirim bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 15.09.2012 22:24
                 */
                #region Ödeme türüne göre indirim bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.IndirimKomisyon IndirimKomisyonGetir(int IndirimKomisyonID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.IndirimKomisyon Sonuc = new SHOPObjeler.Sonuclar.IndirimKomisyon();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.IndirimKomisyon> L = new List<SHOPObjeler.Tanimlar.IndirimKomisyon>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_indirimler_komisyonlar
                                       where a.id == IndirimKomisyonID
                                       select new
                                       {
                                           a.id,
                                           a.odeme_sekli_id,
                                           a.ad,
                                           a.yuzde,
                                           a.tip
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Odeme şekli objesi
                                SHOPObjeler.Tanimlar.Genel OdemeSekli = new SHOPObjeler.Tanimlar.Genel();
                                OdemeSekli.ID = SQL.odeme_sekli_id;
                                #endregion

                                #region İndirim komisyon Objesi
                                SHOPObjeler.Tanimlar.IndirimKomisyon A = new SHOPObjeler.Tanimlar.IndirimKomisyon();
                                A.ID = SQL.id;
                                A.OdemeSekliID = OdemeSekli;
                                A.Ad = SQL.ad;
                                A.Yuzde = SQL.yuzde;
                                A.Tip = SQL.tip;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.IndirimKomisyonlar = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Ürün kod bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 15.09.2012 22:29
                 */
                #region Ürün kod bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.Kodlar KodGetir(int KodID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Kodlar Sonuc = new SHOPObjeler.Sonuclar.Kodlar();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Genel> L = new List<SHOPObjeler.Tanimlar.Genel>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_kodlar
                                       where a.id == KodID
                                       select new
                                       {
                                           a.id,
                                           a.kod
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Odeme şekli objesi
                                SHOPObjeler.Tanimlar.Genel A = new SHOPObjeler.Tanimlar.Genel();
                                A.ID = SQL.id;
                                A.AD = SQL.kod;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Kod = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Dil bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 15.09.2012 23:08
                 */
                #region Dil bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.Dil DilGetir(int DilID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Dil Sonuc = new SHOPObjeler.Sonuclar.Dil();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Diller> L = new List<SHOPObjeler.Tanimlar.Diller>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_diller
                                       where a.id == DilID
                                       select new
                                       {
                                           a.id,
                                           a.dil,
                                           a.ulke_id,
                                           a.kodlama,
                                           a.ikon,
                                           a.para_birimi_id,
                                           a.sira,
                                           a.ana_dil,
                                           a.onay
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Ülke objesi
                                SHOPObjeler.Tanimlar.Ulke Ulke = new SHOPObjeler.Tanimlar.Ulke();
                                Ulke.ID = SQL.ulke_id;
                                #endregion

                                #region Para birim objesi
                                SHOPObjeler.Tanimlar.ParaBirim ParaBirim = new SHOPObjeler.Tanimlar.ParaBirim();
                                ParaBirim.ID = SQL.para_birimi_id;
                                #endregion

                                #region Dil objesi
                                SHOPObjeler.Tanimlar.Diller A = new SHOPObjeler.Tanimlar.Diller();
                                A.ID = SQL.id;
                                A.Dil = SQL.dil;
                                A.UlkeID = Ulke;
                                A.Kodlama = SQL.kodlama;
                                A.Ikon = SQL.ikon;
                                A.ParaBirimID = ParaBirim;
                                A.Sira = SQL.sira;
                                A.AnaDil = SQL.ana_dil;
                                A.Onay = SQL.onay;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Diller = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                /// <summary>
                /// Marka bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 15.09.2012 23:33
                 */
                #region Marka bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.Marka MarkaGetir(int MarkaID)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Marka Sonuc = new SHOPObjeler.Sonuclar.Marka();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Markalar> L = new List<SHOPObjeler.Tanimlar.Markalar>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_markalar
                                       where a.id == MarkaID
                                       select new
                                       {
                                           a.id,
                                           a.ad,
                                           a.ikon,
                                           a.onay
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Marka objesi
                                SHOPObjeler.Tanimlar.Markalar A = new SHOPObjeler.Tanimlar.Markalar();
                                A.ID = SQL.id;
                                A.Ad = SQL.ad;
                                A.Ikon = SQL.ikon;
                                A.Onay = SQL.onay;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Markalar = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                #region Ürünlerin listelendiği sayfalardaki ürün detayları ID sine göre yazılıyor
                public static string UrunDetay(string UrunID)
                {
#if DEBUG
                    try
                    {
#endif
                        int ID = int.Parse(UrunID);
                        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();
                        int KullanilacakDoviz = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_urunler
                                       where a.id == ID
                                       orderby a.tarih_ek descending
                                       select new
                                       {
                                           a.id,
                                           a.resim_id,
                                           a.ad,
                                           a.fiyat,
                                           a.kdv,
                                           a.kdv_id,
                                           a.para_birimi_id,
                                           a.indirim_id,
                                           a.kargo_hesaplama_id,
                                           a.stok,
                                           a.yeni,
                                           urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                           indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde).FirstOrDefault()
                                       }).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                StringBuilder sb = new StringBuilder();
                                foreach (var i in SQL)
                                {
                                    sb.Append("<div class=\"urunkapsul\"><div class=\"urunkapsul2\"><a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img src=\"/ashx/product-image.ashx?i=" + i.resim_id + "&amp;w=150&amp;h=150&amp;k=t\" alt=\"" + i.ad + "\" class=\"image-border\"/></a><br /><strong>" + i.ad + "</strong>");

                                    #region Eğer yeni ürünse ikon yazılıyor
                                    if (i.yeni == true)
                                    {
                                        sb.Append("&nbsp;&nbsp;<img src=\"/images/icon-yeniurun.png\" alt=\"Yeni Ürün\" />");
                                    }
                                    #endregion

                                    #region Eğer ürün kodu yoksa ürün kodu satırı yazılmıyor
                                    if (!string.IsNullOrEmpty(i.urunkod))
                                    {
                                        sb.Append("<br />" + Class.Fonksiyonlar.Uygulama.SabitlerText(208) + ": " + i.urunkod);
                                    }
                                    #endregion

                                    #region Eğer fiyat yoksa fiyat satırı yazılmıyor
                                    if (i.fiyat != 0 && !string.IsNullOrEmpty(i.fiyat.ToString()))
                                    {
                                        if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                        {
                                            sb.Append("<br /><span class=\"kirmizibold\">%" + i.indirim.ToString() + " <img src=\"/images/icon-indirim.png\" alt=\"indirim\" /></span> <strike>" + Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike>");

                                            #region Eğer KDV varsa yazı olarak + KDV ibaresi ekleniyor
                                            if (!i.kdv)
                                            {
                                                sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293));
                                            }
                                            else
                                            {
                                                sb.Append(" <strike>" + Class.Fonksiyonlar.Genel.HarfBoyutlandirma(Class.Fonksiyonlar.Uygulama.SabitlerText(333), Class.Sabitler.StringIslemleri.HarfClass.Tip.Buyuk, Class.Sabitler.StringIslemleri.HarfClass.Islem.Hepsi, null) + "</strike>");
                                            }
                                            #endregion

                                            if (KullanilacakDoviz != i.para_birimi_id)
                                            {
                                                //sb.Append("<br />" + Finans.Hesaplama.IndirimliKdvsiz(i.fiyat.ToString(), i.indirim.ToString()) + " " + i.parabirim);
                                            }

                                            sb.Append("<br /><span class=\"urunfiyat\">" + Finans.Cevirme.ParaFormat(Finans.Hesaplama.DovizCevir(Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                        }
                                        else
                                        {
                                            #region Eğer ürün dövizi kullanılacak döviz ile aynı değilse dövizli fiyatı yazıyor
                                            if (KullanilacakDoviz != i.para_birimi_id)
                                            {
                                                sb.Append("<br />" + Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + Genel.ParaSimgeVer(i.para_birimi_id.ToString()));

                                                #region Eğer KDV varsa yazı olarak + KDV ibaresi ekleniyor
                                                if (!i.kdv)
                                                {
                                                    sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293));
                                                }
                                                else
                                                {
                                                    sb.Append(" <strike>" + Class.Fonksiyonlar.Genel.HarfBoyutlandirma(Class.Fonksiyonlar.Uygulama.SabitlerText(333), Class.Sabitler.StringIslemleri.HarfClass.Tip.Buyuk, Class.Sabitler.StringIslemleri.HarfClass.Islem.Hepsi, null) + "</strike>");
                                                }
                                                #endregion
                                            }
                                            #endregion

                                            #region Ürünün kullanılacak dövize çevrilmiş şekilde basıyor
                                            sb.Append("<br /><span class=\"urunfiyat\">" + Finans.Cevirme.ParaFormat(Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd);
                                            #endregion
                                        }

                                        #region Eğer KDV varsa yazı olarak + KDV ibaresi ekleniyor
                                        if (!i.kdv)
                                        {
                                            sb.Append(" + " + Class.Fonksiyonlar.Uygulama.SabitlerText(293));
                                        }
                                        else
                                        {
                                            sb.Append(" <strike>" + Class.Fonksiyonlar.Genel.HarfBoyutlandirma(Class.Fonksiyonlar.Uygulama.SabitlerText(333), Class.Sabitler.StringIslemleri.HarfClass.Tip.Buyuk, Class.Sabitler.StringIslemleri.HarfClass.Islem.Hepsi, null) + "</strike>");
                                        }
                                        #endregion

                                        sb.Append("</span>");
                                    }
                                    #endregion

                                    sb.Append("</div>");

                                    // Create HY 01.10.2012 18:13 Listelerde buton gösterilsin mi?
                                    if (SHOPObjeler.Listeler.SiteAyar.Select(p => p.Buton).FirstOrDefault() == true)
                                    {
                                        sb.Append("<br />");

                                        #region Eğer ürün stokta var ise sepete at, yoksa stok yok ikonu çıkıyor
                                        if (i.stok == true && i.fiyat != 0 && i.fiyat != 0 && !string.IsNullOrEmpty(i.fiyat.ToString()))
                                        {
                                            sb.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("basket", i.ad, i.id.ToString()) + "\"><img src=\"/images/btn-sepeteat.png\" alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(103) + "\" /></a> ");
                                        }
                                        else
                                        {
                                            sb.Append("<img src=\"/images/btn-stokyok.png\" alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(107) + "\" /> ");
                                        }
                                        #endregion

                                        #region Ürün detay için ikon
                                        sb.Append("<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(104) + "\" src=\"/images/btn-urunuincele.png\" /></a>");
                                        #endregion

                                        #region Eğer ürüne kargo bedava ise ikon çıkıyor
                                        if (i.kargo_hesaplama_id == 1)
                                        {
                                            sb.Append(" <a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(216) + "\" src=\"/images/btn-ucretsizkargo.png\" /></a>");
                                        }
                                        #endregion
                                    }
                                    sb.Append("</div>");
                                }

                                return sb.ToString();
                            }
                            else
                            {
                                return "null";
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }
                #endregion

                /// <summary>
                /// Sipariş bilgilerini çağırma
                /// </summary>
                /*
                 * Create HY 18.09.2012 11:32
                 */
                #region Sipariş bilgilerini çağırma
                public static SHOPObjeler.Sonuclar.Siparis SiparisGetir(string SiparisNo)
                {
                    #region Boş Instancelar
                    SHOPObjeler.Sonuclar.Siparis Sonuc = new SHOPObjeler.Sonuclar.Siparis();
                    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
                    List<SHOPObjeler.Tanimlar.Siparisler> L = new List<SHOPObjeler.Tanimlar.Siparisler>();
                    #endregion

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region SQL
                            var SQL = (from a in db.tbl_siparisler
                                       where a.no == SiparisNo
                                       select new
                                       {
                                           a.id,
                                           a.kullanici_id,
                                           a.no,
                                           a.kargo_adres_id,
                                           a.fatura_adres_id,
                                           a.vergi_bilgileri_id,
                                           a.tutar,
                                           a.indirim_tutari,
                                           a.toplam_tutar,
                                           a.toplam_kdv,
                                           a.genel_toplam,
                                           a.indirim_komisyon_id,
                                           a.komisyon_tutari,
                                           a.kargo_payi,
                                           a.puan_tutari,
                                           a.toplam,
                                           a.para_birimi_id,
                                           a.odeme_sekli_id,
                                           a.kur_tarih,
                                           a.tarih
                                       }).AsEnumerable().Take(1).FirstOrDefault();
                            #endregion

                            if (!string.IsNullOrEmpty(SQL.id.ToString()))
                            {
                                #region Kullanıcı objesi
                                SHOPObjeler.Tanimlar.Kullanici Kullanici = new SHOPObjeler.Tanimlar.Kullanici();
                                Kullanici.ID = SQL.kullanici_id;
                                #endregion

                                #region Kopya kargo adres objesi
                                SHOPObjeler.Tanimlar.CpySiparislerKullanicilarAdresler KargoAdres = new SHOPObjeler.Tanimlar.CpySiparislerKullanicilarAdresler();
                                KargoAdres.ID = SQL.kargo_adres_id;
                                #endregion

                                #region Kopya fatura adres objesi
                                SHOPObjeler.Tanimlar.CpySiparislerKullanicilarAdresler FaturaAdres = new SHOPObjeler.Tanimlar.CpySiparislerKullanicilarAdresler();
                                FaturaAdres.ID = SQL.kargo_adres_id;
                                #endregion

                                #region Kopya vergi adres objesi
                                SHOPObjeler.Tanimlar.CpySiparislerKullanicilarVergiBilgiler VergiBilgi = new SHOPObjeler.Tanimlar.CpySiparislerKullanicilarVergiBilgiler();
                                VergiBilgi.ID = SQL.vergi_bilgileri_id;
                                #endregion

                                #region Kopya indirim komisyon objesi
                                SHOPObjeler.Tanimlar.CpyIndirimlerKomisyonlar IndirimKomisyon = new SHOPObjeler.Tanimlar.CpyIndirimlerKomisyonlar();
                                IndirimKomisyon.ID = SQL.indirim_komisyon_id;
                                #endregion

                                #region Para birim objesi
                                SHOPObjeler.Tanimlar.ParaBirim ParaBirim = new SHOPObjeler.Tanimlar.ParaBirim();
                                ParaBirim.ID = SQL.para_birimi_id;
                                #endregion

                                #region Marka objesi
                                SHOPObjeler.Tanimlar.Siparisler A = new SHOPObjeler.Tanimlar.Siparisler();
                                A.ID = SQL.id;
                                A.Kullanici = Kullanici;
                                A.No = SQL.no;
                                A.KargoAdresID = KargoAdres;
                                A.FaturaAdresID = FaturaAdres;
                                A.VergiBilgilerID = VergiBilgi;
                                A.Tutar = SQL.tutar;
                                A.IndirimTutari = SQL.indirim_tutari;
                                A.ToplamTutar = SQL.toplam_tutar;
                                A.ToplamKdv = SQL.toplam_kdv;
                                A.GenelToplam = SQL.genel_toplam;
                                A.IndirimKomisyonID = IndirimKomisyon;
                                A.KomisyonTutari = SQL.komisyon_tutari;
                                A.KargoPayi = SQL.kargo_payi;
                                A.PuanTutari = SQL.puan_tutari;
                                A.Toplam = SQL.toplam;
                                A.ParaBirimID = ParaBirim;
                                A.OdemeSekliID = SQL.odeme_sekli_id;
                                A.KurTarih = SQL.kur_tarih;
                                #endregion

                                L.Add(A);
                            }
                            else
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.Other;
                                M.Header = "Sıfır Sonuç";
                                M.Text = "Hiç bir kayıt dönmedi.";
                                #endregion
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Bir iç hata Oluştu";
                        M.Text = ex.Message;
                        #endregion
                    }
#endif

                    #region Return Parametleri İçin Obje Setle
                    Sonuc.Siparisler = L;
                    Sonuc.Message = M;
                    #endregion

                    return Sonuc;
                }
                #endregion

                #region Admin ürün bilgisi çağırma
                public static List<tbl_urunler> UrunBilgisiGetir(int UrunID)
                {
                    List<tbl_urunler> SQL = new List<tbl_urunler>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            SQL = (from p in db.tbl_cpy_siparisler_urunler
                                   where p.id == UrunID
                                   select p).AsEnumerable().Take(1).Cast<tbl_urunler>().ToList();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return SQL;
                }
                #endregion

                #region Admin kopya tablosundan ürün bilgisi çağırma
                public static List<tbl_cpy_siparisler_urunler> CpyUrunBilgisiGetir(int SiparislerUrunlerID)
                {
                    List<tbl_cpy_siparisler_urunler> SQL = new List<tbl_cpy_siparisler_urunler>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            SQL = (from p in db.tbl_cpy_siparisler_urunler
                                   where p.id == SiparislerUrunlerID
                                   select p).AsEnumerable().Take(1).Cast<tbl_cpy_siparisler_urunler>().ToList();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return SQL;
                }
                #endregion

                #region Admin adres bilgilerini getirme
                public static SHOPObjeler.Tanimlar.Adres AdresiBilgisiGetir(int FaturaAdresID, bool CopyTable)
                {
                    //CopyTable true ise bilgileri KopyaTablosundan alacak!

                    SHOPObjeler.Tanimlar.Adres A = new SHOPObjeler.Tanimlar.Adres();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var a1 = (db.tbl_kullanicilar_adresler).AsEnumerable();
                            var a2 = (db.tbl_cpy_siparisler_kullanicilar_adresler).AsEnumerable();
                            //var b = (CopyTable) ? a1 : a2;

                            var SQL = (from p in db.tbl_kullanicilar_adresler
                                       where p.id == FaturaAdresID
                                       select new
                                       {
                                           p.il,
                                           p.ilce,
                                           p.adres,
                                           p.posta_kodu,
                                           ulke = db.tbl_sbt_ulke.Where(x => x.id == p.ulke_id).Select(x => x.ad).FirstOrDefault(),
                                           vergitip = db.tbl_kullanicilar_vergi_bilgiler.Where(x => x.adres_id == p.id).Select(x => x.tip).FirstOrDefault(),
                                           vergidaire = db.tbl_kullanicilar_vergi_bilgiler.Where(x => x.adres_id == p.id).Select(x => x.vergi_dairesi).FirstOrDefault(),
                                           vergino = db.tbl_kullanicilar_vergi_bilgiler.Where(x => x.adres_id == p.id).Select(x => x.vergi_no).FirstOrDefault(),
                                           tcno = db.tbl_kullanicilar_vergi_bilgiler.Where(x => x.adres_id == p.id).Select(x => x.tc_kimlik_no).FirstOrDefault(),
                                       }).AsEnumerable().Take(1);
                        }

                        //Adres Bilgileri Burada
                        SHOPObjeler.Tanimlar.AdresBilgileri AB = new SHOPObjeler.Tanimlar.AdresBilgileri();
                        AB.Adres = "bla bla";
                        AB.Il = "Köyümüzün Adı";
                        AB.Ulke = "TÜRKİYE";

                        //Bireysel Fatura Bilgileri
                        SHOPObjeler.Tanimlar.FaturaBireysel FB = new SHOPObjeler.Tanimlar.FaturaBireysel();
                        FB.TcKimlikNo = "1234567890";

                        //Kurumsal Fatura Bilgileri
                        SHOPObjeler.Tanimlar.FaturaKurumsal FK = new SHOPObjeler.Tanimlar.FaturaKurumsal();
                        FK.FirmaUnvani = "Yallah Turizm";

                        //Kargo Adresi Döndürmek İçin
                        A.AdresTipi = SHOPObjeler.Tanimlar.AdresTipleri.Kargo;
                        A.AdresBilgisi = AB;

                        //Fatura Adresi Döndürmek İçin (Bireysel)
                        A.AdresTipi = SHOPObjeler.Tanimlar.AdresTipleri.Fatura;
                        A.AdresBilgisi = AB;
                        A.FaturaBilgisi.FaturaTipi = SHOPObjeler.Tanimlar.FaturaTipleri.Bireysel;
                        A.FaturaBilgisi.BireyselFaturaBilgileri = FB;

                        //Fatura Adresi Döndürmek İçin (Kurumsal)
                        A.AdresTipi = SHOPObjeler.Tanimlar.AdresTipleri.Fatura;
                        A.AdresBilgisi = AB;
                        A.FaturaBilgisi.FaturaTipi = SHOPObjeler.Tanimlar.FaturaTipleri.Kurumsal;
                        A.FaturaBilgisi.BireyselFaturaBilgileri = FB;

                        //Fatura Adresi Döndürmek İçin (Yabancı)
                        A.AdresTipi = SHOPObjeler.Tanimlar.AdresTipleri.Fatura;
                        A.AdresBilgisi = AB;
                        A.FaturaBilgisi.FaturaTipi = SHOPObjeler.Tanimlar.FaturaTipleri.Diger;
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return A;
                }
                #endregion

                /// <summary>
                /// Taksik hesaplama tablosu oluşturma
                /// </summary>
                /*
                 * Create HY 28.1.2012 14:01
                 */
                #region Taksik hesaplama tablosu
                public static string TaksitHesaplamaTablosu(double UrunFiyat)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_sbt_sanal_pos
                                       where a.onay == true && a.pesin == false
                                       select new
                                       {
                                           a.id,
                                           a.ikon,
                                           taksitsayi = db.tbl_sbt_sanal_pos_oran.Where(p => p.sanal_pos_id == a.id).Count()
                                       }).AsEnumerable();

                            if (SQL.Any())
                            {
                                StringBuilder sb = new StringBuilder();
                                sb.Append("<table width=\"100%\" summary=\"\"><tbody><tr>");
                                int x = 1;
                                foreach (var i in SQL)
                                {
                                    if (i.taksitsayi > 0)
                                    {
                                        sb.Append("<td width=\"33%\" valign=\"top\">" + TaksitSecenekler(i.ikon, i.id, UrunFiyat) + "</td>");

                                        if (x == 3)
                                        {
                                            sb.Append("</tr><tr>");
                                            x = 1;
                                        }
                                        else
                                        {
                                            x++;
                                        }
                                    }
                                }
                                sb.Append("</tr></tbody></table>");

                                return sb.ToString();
                            }
                            else
                            {
                                return "<div class=\"bilgi\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(128) + "</div>";
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                static string TaksitSecenekler(string KartAdi, int SanalPosID, double UrunFiyat)
                {
#if DEBUG
                    try
                    {
#endif
                        StringBuilder sb = new StringBuilder();
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_sbt_sanal_pos_oran
                                       where a.onay == true && a.sanal_pos_id == SanalPosID
                                       select new
                                       {
                                           a.ay,
                                           a.oran
                                       }).AsEnumerable();

                            if (SQL.Any())
                            {
                                sb.Append("<table cellspacing=\"1\" class=\"taksitsecenek\" summary=\"\"><tbody><tr><td colspan=\"3\" class=\"banka\"><img src=\"/images/bank/" + KartAdi + "\" alt=\"\" /></td></tr><tr><td class=\"taksitbaslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(129) + "</td><td class=\"taksit2baslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(130) + "</td><td class=\"taksit2baslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(131) + "</td></tr>");
                                foreach (var i in SQL)
                                {
                                    sb.Append("<tr><td class=\"taksit\">" + i.ay + "</td><td class=\"taksit2\">" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(i.ay, UrunFiyat, i.oran)) + " " + Genel.KullanilacakDovizAd() + "</td><td class=\"taksit2\">" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(1, UrunFiyat, i.oran)) + " " + Genel.KullanilacakDovizAd() + "</td></tr>");
                                }

                                var SQL2 = (from b in db.tbl_sbt_sanal_pos_banka
                                            where b.sanal_pos_id == SanalPosID
                                            select new
                                            {
                                                banka = db.tbl_sbt_banka.Where(p => p.id == b.banka_id).Select(p => p.marka).FirstOrDefault() != null ? db.tbl_sbt_banka.Where(p => p.id == b.banka_id).Select(p => p.marka).FirstOrDefault() : db.tbl_sbt_banka.Where(p => p.id == b.banka_id).Select(p => p.ad).FirstOrDefault()
                                            }).AsEnumerable();

                                if (SQL2.Any())
                                {
                                    sb.Append("<tr><td colspan=\"3\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(294) + " ");
                                    int x = 1;
                                    int sayi = SQL2.AsEnumerable().Count();
                                    foreach (var i in SQL2)
                                    {
                                        sb.Append(i.banka);

                                        if (x != sayi)
                                        {
                                            sb.Append(", ");
                                            x++;
                                        }
                                        else
                                        {
                                            x = 1;
                                        }
                                    }
                                    sb.Append("</td></tr>");
                                }

                                sb.Append("</tbody></table>");
                            }
                        }
                        return sb.ToString();
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }
                #endregion
            }

            public class Genel
            {
                //FÜ 09.09.2012 21:27
                public static string TLCevir(string KurusTutar)
                {
                    string sonuc = "0";

#if DEBUG
                    try
                    {
#endif
                        if (!string.IsNullOrEmpty(KurusTutar))
                        {
                            double Kurus = double.Parse(KurusTutar);
                            sonuc = (Kurus / 100).ToString();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return sonuc;
                }

                //FÜ 09.09.2012 21:27
                public static string KurusCevir(string TLTutar)
                {
                    string sonuc = "0";

#if DEBUG
                    try
                    {
#endif
                        if (!string.IsNullOrEmpty(TLTutar))
                        {
                            double TL = double.Parse(TLTutar);
                            sonuc = (TL * 100).ToString();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return sonuc;
                }

                //FÜ 09.09.2012 21:27
                public static string TersCevir(string s)
                {
                    if (!string.IsNullOrEmpty(s))
                    {
#if DEBUG
                        try
                        {
#endif
                            char[] arr = s.ToCharArray();
                            Array.Reverse(arr);
                            return new string(arr);
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return s;
                        }
#endif
                    }
                    else
                    {
                        return s;
                    }
                }

                public class Doviz
                {
                    #region TCMB kur değerleri alınıyor
                    public static void KurAl()
                    {
                        if (!KurAlinmisMi())
                        {
#if DEBUG
                            try
                            {
#endif
                                XDocument TCMB = XDocument.Load("http://www.tcmb.gov.tr/kurlar/today.xml");

                                if (TCMB != null)
                                {
                                    var Kur = (from p in TCMB.Element("Tarih_Date").Elements("Currency")
                                               select new
                                               {
                                                   tarih = (string)TCMB.Element("Tarih_Date").Attribute("Tarih"),
                                                   kod = (string)p.Attribute("Kod"),
                                                   isim = (string)p.Element("Isim"),
                                                   alis = (string)p.Element("ForexBuying"),
                                                   satis = (string)p.Element("ForexSelling"),
                                                   efektifalis = (string)p.Element("BanknoteBuying"),
                                                   efektifsatis = (string)p.Element("BanknoteSelling")
                                               });

                                    if (Kur.Any())
                                    {
                                        if (!KurTarihVarMi(DateTime.Parse(Kur.Select(p => p.tarih).FirstOrDefault())))
                                        {
                                            foreach (var i in Kur)
                                            {
                                                if (DovizBizdeVarmi(i.kod))
                                                {
                                                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                                                    {
                                                        tbl_gunluk_kurlar Tbl = new tbl_gunluk_kurlar();
                                                        Tbl.para_birimi_id = DovizBizdekiID(i.kod);
                                                        Tbl.alis = double.Parse(i.alis.Replace(".", ","));
                                                        Tbl.satis = double.Parse(i.satis.Replace(".", ","));
                                                        Tbl.kur_tarih = DateTime.Parse(i.tarih);
                                                        Tbl.efektif_alis = double.Parse(i.efektifalis.Replace(".", ","));
                                                        Tbl.efektif_satis = double.Parse(i.efektifsatis.Replace(".", ","));
                                                        db.AddTotbl_gunluk_kurlar(Tbl);
                                                        db.SaveChanges();
                                                    }
                                                }
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
                    }
                    #endregion

                    #region TCMB den bugünün kuru alınmışmı genel kontrol ediyor
                    public static bool KurAlinmisMi()
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in db.tbl_gunluk_kurlar
                                           where a.tarih == DateTime.Today
                                           select new
                                           {
                                               a.id
                                           });

                                if (SQL.Any())
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }
                    #endregion

                    #region TCMB den bugünün kuru alınmışmı tarihe göre kontrol ediyor
                    public static bool KurTarihVarMi(DateTime tarih)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in db.tbl_gunluk_kurlar
                                           where a.kur_tarih == tarih
                                           select new
                                           {
                                               a.id
                                           });

                                if (SQL.Any())
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }
                    #endregion

                    #region TCMB xml sinde gereksiz gelen parabirimleri var, bunları bizim para birimleri ile karşılaştırıyoruz
                    public static bool DovizBizdeVarmi(string kod)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in SHOPObjeler.Listeler.ParaBirim
                                           where a.Kisaltma == kod && a.Kisaltma != "TRY" && a.Kisaltma != null
                                           select a.ID);

                                if (SQL.Any())
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }
                    #endregion

                    #region TCMB den gelen kodların id lerini buluyoruz
                    public static int DovizBizdekiID(string kod)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in SHOPObjeler.Listeler.ParaBirim
                                           where a.Kisaltma == kod
                                           select a.ID);

                                return SQL.FirstOrDefault();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return -1;
                        }
#endif
                    }
                    #endregion

                    /// <summary>
                    /// Tarih ve para birim id ye göre kur getirme
                    /// </summary>
                    /*
                     * Create FÜ
                     */
                    #region Tarih ve para birim id ye göre kur getirme
                    public static double KurGetir(int ParaBirimiID, DateTime? Tarih, SHOPObjeler.Tanimlar.DovizKuruTipleri? KurTipi)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in db.tbl_gunluk_kurlar
                                           where a.para_birimi_id == ParaBirimiID
                                           select new
                                           {
                                               a.alis,
                                               a.satis,
                                               a.efektif_alis,
                                               a.efektif_satis,
                                               a.kur_tarih
                                           }).AsEnumerable();

                                if (SQL.Any())
                                {
                                    if (Tarih != null)
                                    {
                                        SQL = SQL.Where(p => p.kur_tarih == Tarih.Value.Date).AsEnumerable().Take(1);
                                    }
                                    else
                                    {
                                        SQL = SQL.OrderByDescending(p => p.kur_tarih).AsEnumerable().Take(1);
                                    }

                                    if (SQL.Any())
                                    {
                                        string Kur = null;

                                        switch (KurTipi)
                                        {
                                            case SHOPObjeler.Tanimlar.DovizKuruTipleri.Alis:
                                                Kur = SQL.Select(p => p.alis).FirstOrDefault().ToString();
                                                break;

                                            case SHOPObjeler.Tanimlar.DovizKuruTipleri.Satis:
                                                Kur = SQL.Select(p => p.satis).FirstOrDefault().ToString();
                                                break;

                                            case SHOPObjeler.Tanimlar.DovizKuruTipleri.EfektifAlis:
                                                Kur = SQL.Select(p => p.efektif_alis).FirstOrDefault().ToString();
                                                break;

                                            case SHOPObjeler.Tanimlar.DovizKuruTipleri.EfektifSatis:
                                                Kur = SQL.Select(p => p.efektif_satis).FirstOrDefault().ToString();
                                                break;

                                            default:
                                                Kur = SQL.Select(p => p.alis).FirstOrDefault().ToString();
                                                break;
                                        }

                                        if (!string.IsNullOrEmpty(Kur))
                                        {
                                            return double.Parse(Kur);
                                        }
                                        else
                                        {
                                            return 0;
                                        }
                                    }
                                    else
                                    {
                                        return 0;
                                    }
                                }
                                else
                                {
                                    return 1;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return 0;
                        }
#endif
                    }
                    #endregion
                }

                public class Kargo
                {
                    #region Verilen bilgilere göre kargo tuturı hesaplanıyor basket-cargo.aspx için
                    public static double KargoTutar(int KargoFirmaID, double Kg, double Desi, double Paket, int KargoAdresID)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (AdresYurticiMi(KargoAdresID))
                            {
                                int BolgeID = YurticiBolgeID(KargoAdresID);
                                Desi = Math.Ceiling(Desi);
                                double Tutar = 0;

                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from a in db.tbl_sbt_kargo
                                               where a.id == KargoFirmaID
                                               select new
                                               {
                                                   desi_varmi = (db.tbl_kargo_ulke_il_bolge.Where(p => p.kargo_id == KargoFirmaID && p.bolge_id == BolgeID && p.desi == Desi).Count()),
                                                   fiyat = (db.tbl_kargo_ulke_il_bolge.Where(p => p.kargo_id == KargoFirmaID && p.bolge_id == BolgeID && p.desi == Desi).Select(p => p.fiyat).FirstOrDefault()),
                                                   a.sabit_fiyat,
                                                   a.ad,
                                                   a.desi_birim_fiyat,
                                                   desi_en_yuksek = (db.tbl_kargo_ulke_il_bolge.Where(p => p.kargo_id == KargoFirmaID && p.bolge_id == BolgeID).OrderByDescending(p => p.desi).Select(p => p.desi).Take(1).FirstOrDefault()),
                                                   desi_en_yuksek_fiyat = (db.tbl_kargo_ulke_il_bolge.Where(p => p.kargo_id == KargoFirmaID && p.bolge_id == BolgeID).OrderByDescending(p => p.desi).Select(p => p.fiyat).Take(1).FirstOrDefault())
                                               }).AsEnumerable();

                                    if (SQL.Any())
                                    {
                                        foreach (var i in SQL)
                                        {
                                            if (i.desi_varmi == 0)
                                            {
                                                if (Desi != 0)
                                                {
                                                    double fazla_desi = Desi - double.Parse(i.desi_en_yuksek.ToString());
                                                    Tutar = (double.Parse(i.desi_en_yuksek.ToString()) * double.Parse(i.desi_en_yuksek_fiyat.ToString())) + (fazla_desi * double.Parse(i.desi_birim_fiyat.ToString()));
                                                }
                                            }
                                            else
                                            {
                                                Tutar = double.Parse(Desi.ToString()) * double.Parse(i.fiyat.ToString());
                                            }

                                            Tutar = Tutar + (double.Parse(Paket.ToString()) * double.Parse(i.sabit_fiyat.ToString()));
                                        }
                                    }
                                    else
                                    {
                                        return 0;
                                    }
                                }

                                return Tutar;
                            }
                            else
                            {
                                return 0;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return 0;
                        }
#endif
                    }
                    #endregion

                    #region Teslimat yurtiçi ise bölge id sini döndürüyor
                    public static int YurticiBolgeID(int ID)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in db.tbl_kullanicilar_adresler
                                           from b in db.tbl_sbt_ulke_il
                                           where a.id == ID && b.id == a.il_id
                                           select b.bolge_id).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return SQL.FirstOrDefault();
                                }
                                else
                                {
                                    return 0;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return 0;
                        }
#endif
                    }
                    #endregion

                    #region Teslimat yurtdışı ise bölge id sini döndürüyor
                    public static int YurtdisiBolgeID(int ID)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in db.tbl_kullanicilar_adresler
                                           from b in db.tbl_sbt_ulke
                                           where a.id == ID && b.id == a.ulke_id
                                           select b.bolge_id).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return SQL.FirstOrDefault();
                                }
                                else
                                {
                                    return 0;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return 0;
                        }
#endif
                    }
                    #endregion

                    #region Teslimat adresinin yurtiçimi yoksa yurtdışımı olduğunu döndürüyor
                    public static bool AdresYurticiMi(int ID)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from a in db.tbl_kullanicilar_adresler
                                           from b in db.tbl_sbt_ulke_il
                                           where a.id == ID && b.id == a.il_id
                                           select b.ulke_id).AsEnumerable().Take(1);

                                if (SQL.Any() && SQL.FirstOrDefault() == 235)
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }
                    #endregion

                    #region Kargo firması adını döndür
                    public static string KargoFirmaAdi(int KargoFirmaID)
                    {
#if DEBUG
                        try
                        {
#endif
                            var SQL = (from a in SHOPObjeler.Listeler.KargoFirma
                                       where a.ID == KargoFirmaID
                                       select a.Ad).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault();
                            }
                            else
                            {
                                return null;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }
                    #endregion
                }

                #region Seo link oluşturma
                public static string SeoLink(string sayfa, string baslik, string ID)
                {
#if DEBUG
                    try
                    {
#endif
                        return "/" + sayfa + "/" + ID + "/" + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.Etiket, baslik) + ".aspx";
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }
                #endregion

                #region Siparişin kullanıcıya ait olduğunu döndürüyor
                public static bool SiparisKullaniciyamiAit(int SiparisID)
                {
#if DEBUG
                    try
                    {
#endif
                        int KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_siparisler
                                       where a.id == SiparisID && a.kullanici_id == KullaniciID
                                       select a.id).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return false;
                    }
#endif
                }
                #endregion

                #region Diller tablosundaki seçime göre çevirilecek ortak dövizi getiriyor
                public static int KullanilacakDoviz()
                {
#if DEBUG
                    try
                    {
#endif
                        int DilID = Class.Fonksiyonlar.Dil.ID();
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_diller
                                       where a.id == DilID
                                       select a.para_birimi_id).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault();
                            }
                            else
                            {
                                return 1;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return 1;
                    }
#endif
                }
                #endregion

                #region Sipariş sırasında geçerli olan dövizin virgülden sonraki uzunluğu
                public static int KullanilacakDovizUzunlugu()
                {
#if DEBUG
                    try
                    {
#endif
                        int DovizID = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

                        var SQL = (from a in SHOPObjeler.Listeler.ParaBirim
                                   where a.ID == DovizID
                                   select a.Uzunluk).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            return SQL.FirstOrDefault();
                        }
                        else
                        {
                            return 2;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return 2;
                    }
#endif
                }
                #endregion

                #region Sipariş sırasında geçerli olan kullanılacak döviz adını verir
                public static string KullanilacakDovizAd()
                {
#if DEBUG
                    try
                    {
#endif
                        int DovizID = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

                        var SQL = (from a in SHOPObjeler.Listeler.ParaBirim
                                   where a.ID == DovizID
                                   select new
                                   {
                                       a.Simge,
                                       a.Kisaltma
                                   }).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            return SQL.Select(p => (p.Simge == null ? p.Kisaltma : p.Simge)).FirstOrDefault();
                        }
                        else
                        {
                            return null;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }
                #endregion

                #region ID ye göre para simgesi çağırma
                public static string ParaSimgeVer(string ParaBirimiID)
                {
                    if (!string.IsNullOrEmpty(ParaBirimiID))
                    {
#if DEBUG
                        try
                        {
#endif
                            int PBI = int.Parse(ParaBirimiID);

                            var SQL = (from p in SHOPObjeler.Listeler.ParaBirim
                                       where p.ID == PBI
                                       select new
                                       {
                                           p.Simge,
                                           p.Kisaltma
                                       }).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return SQL.Select(x => (x.Simge == null ? x.Kisaltma : x.Simge)).FirstOrDefault();
                            }
                            else
                            {
                                return null;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }
                    else
                    {
                        return null;
                    }
                }
                #endregion

                /// <summary>
                /// Geçmiş siparişlerin id sine göre kur tarihini getiriyor
                /// </summary>
                /*
                 * Create HY 00.00.00 00:00
                */
                public static DateTime SiparisKurTarih(int SiparisID)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_siparisler
                                       where a.id == SiparisID
                                       select a.kur_tarih).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault().Value;
                            }
                            else
                            {
                                return new DateTime();
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return new DateTime();
                    }
#endif
                }

                /// <summary>
                /// sbt_banka tablosundan banka adını alıyoruz
                /// </summary>
                /*
                 * Edit HY 25.08.12 13:18 Fonksiyon objeye aktarıldı
                 * Create HY 00.00.00 00:00
                */
                public static string BankaAdi(int BankaID)
                {
#if DEBUG
                    try
                    {
#endif
                        // HY 25.08.12 13:18 BEGIN
                        var SQL = (from a in SHOPObjeler.Listeler.Banka
                                   where a.ID == BankaID
                                   select new
                                   {
                                       marka = a.Marka != null ? a.Marka : a.Ad
                                   }).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            return SQL.Select(p => p.marka).FirstOrDefault();
                        }
                        else
                        {
                            return null;
                        }
                        // HY 25.08.12 13:18 END
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                /// <summary>
                /// KDV yüzde bilgilerini alıyoruz
                /// </summary>
                /*
                 * Create HY 25.08.12 13:26
                */
                public static float? KdvYuzde(int ID)
                {
#if DEBUG
                    try
                    {
#endif
                        var SQL = (from a in SHOPObjeler.Listeler.KDV
                                   where a.ID == ID
                                   select a.Yuzde).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            return SQL.FirstOrDefault();
                        }
                        else
                        {
                            return 0;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return 0;
                    }
#endif
                }

                /// <summary>
                /// KDV ad bilgilerini alıyoruz
                /// </summary>
                /*
                 * Create HY 25.08.12 13:32
                */
                public static string KdvAd(int ID)
                {
#if DEBUG
                    try
                    {
#endif
                        var SQL = (from a in SHOPObjeler.Listeler.KDV
                                   where a.ID == ID
                                   select a.Ad);

                        if (SQL.Any())
                        {
                            return SQL.FirstOrDefault();
                        }
                        else
                        {
                            return null;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                /// <summary>
                /// Sipariş detayları için copy tablosundan banka bilgileri alınıyor
                /// </summary>
                /*
                 * Create HY 00.00.00 00:00
                */
                public static string BankaHesapBilgi(int ID)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_cpy_odeme_bildirimler_hesap_nolar
                                       where a.id == ID
                                       select new
                                       {
                                           banka = (db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.marka).FirstOrDefault() != null ? db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.marka).FirstOrDefault() : db.tbl_sbt_banka.Where(p => p.id == a.banka_id).Select(p => p.ad).FirstOrDefault()),
                                           a.sube,
                                           a.sube_kodu,
                                           a.hesap_sahibi,
                                           a.hesap_no,
                                           a.iban
                                       }).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                StringBuilder sb = new StringBuilder();
                                foreach (var i in SQL)
                                {
                                    sb.Append(i.banka.ToUpper() + "<br />");
                                    sb.Append(i.hesap_sahibi + "<br />");
                                    sb.Append(i.sube + " (" + i.sube_kodu + ")<br />");
                                    sb.Append(i.hesap_no + "<br />");
                                    sb.Append(i.iban + "<br /><br />");
                                    sb.Append(Class.Fonksiyonlar.Uygulama.SabitlerText(264));
                                }
                                return sb.ToString();
                            }
                            else
                            {
                                return null;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                /*
                internal static string KdvAd(int? nullable)
                {
                    throw new NotImplementedException();
                }

                internal static float? KdvYuzde(int? nullable)
                {
                    throw new NotImplementedException();
                }
                */
            }

            public class Sepet
            {
                public static void SiparisOlustur2(Sabitler.OdemeTipi OdemeTipi)
                {
#if DEBUG
                    try
                    {
#endif
                        int KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();
                        int KurID = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

                        SHOPObjeler.Tanimlar.Sistem Sistem = (from p in SHOPObjeler.Listeler.Sistem
                                                              where p.Key == KullaniciID
                                                              select p.Value).Cast<SHOPObjeler.Tanimlar.Sistem>().ToList()[0];

                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            #region Müşteri teslimat adresinin copy sini oluşturmak için
                            tbl_cpy_siparisler_kullanicilar_adresler t1 = new tbl_cpy_siparisler_kullanicilar_adresler();
                            t1.kullanicilar_adresler_id = Sistem.Sepet.KargoAdresID;
                            db.AddTotbl_cpy_siparisler_kullanicilar_adresler(t1);
                            #endregion

                            #region Müşteri fatura adresinin copy sini oluşturmak için
                            tbl_cpy_siparisler_kullanicilar_adresler t2 = new tbl_cpy_siparisler_kullanicilar_adresler();
                            t2.kullanicilar_adresler_id = Sistem.Sepet.FaturaAdresID;
                            db.AddTotbl_cpy_siparisler_kullanicilar_adresler(t2);
                            #endregion

                            db.SaveChanges();

                            #region Müşteri vergi bilgileri copy sini oluşturmak için
                            tbl_cpy_siparisler_kullanicilar_vergi_bilgiler t3 = new tbl_cpy_siparisler_kullanicilar_vergi_bilgiler();
                            t3.kullanicilar_vergi_bilgiler_id = Sistem.Sepet.VergiBilgiID;
                            t3.cpy_siparisler_kullanicilar_adresler_id = t2.id;
                            db.AddTotbl_cpy_siparisler_kullanicilar_vergi_bilgiler(t3);
                            #endregion

                            #region Müşteri indirim/komisyon copy sini oluşturmak için
                            tbl_cpy_indirimler_komisyonlar t4 = new tbl_cpy_indirimler_komisyonlar();
                            t4.indirimler_komisyonlar_id = Sistem.Sepet.IndirimKomisyonID;
                            db.AddTotbl_cpy_indirimler_komisyonlar(t4);
                            #endregion

                            db.SaveChanges();

                            #region Müşteri siparişi siparisler tablosuna yazdırıyoruz
                            tbl_siparisler t5 = new tbl_siparisler();
                            t5.kullanici_id = KullaniciID;
                            t5.kargo_adres_id = t1.id;
                            t5.fatura_adres_id = t2.id;
                            t5.vergi_bilgileri_id = t3.id;
                            t5.tutar = Sistem.Sepet.Tutar;
                            t5.indirim_tutari = Sistem.Sepet.IndirimTutar;
                            t5.toplam_tutar = Sistem.Sepet.ToplamTutar;
                            t5.toplam_kdv = Sistem.Sepet.ToplamKdv;
                            t5.genel_toplam = Sistem.Sepet.GenelToplam;
                            t5.komisyon_tutari = Sistem.Sepet.KomisyonTutar;
                            t5.kargo_payi = Sistem.Sepet.KargoPayi;
                            t5.toplam = Sistem.Sepet.Toplam;
                            t5.para_birimi_id = KurID;
                            t5.indirim_komisyon_id = t4.id;

                            switch (OdemeTipi)
                            {
                                case Sabitler.OdemeTipi.BankaHavalesi:
                                    t5.odeme_sekli_id = 1;
                                    break;

                                case Sabitler.OdemeTipi.KrediKarti:
                                    t5.odeme_sekli_id = 2;

                                    //Kredi Kartı Ödeme Bilgileri Objesini Alıyoruz
                                    //KKIO = SHOPObjeler.Listeler.KrediKartiIleOdeme.Where(k => k.Key == HttpContext.Current.Session.SessionID).Select(k => k.Value).Cast<SHOPObjeler.Tanimlar.KrediKartiIleOdeme>().FirstOrDefault();

                                    #region Puan Kullanımı varsa puan bilgilerini db ye ekliyoruz.
                                    if (Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.PuanKullan)
                                    {
                                        t5.puan_tutari = Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.Puan;
                                    }
                                    #endregion
                                    break;

                                case Sabitler.OdemeTipi.KapidaOdeme:
                                    t5.odeme_sekli_id = 4;
                                    break;

                                case Sabitler.OdemeTipi.Paypal:
                                    t5.odeme_sekli_id = 5;
                                    break;

                                case Sabitler.OdemeTipi.PostaHavalesi:
                                    t5.odeme_sekli_id = 6;
                                    break;
                            }

                            t5.kur_tarih = db.tbl_gunluk_kurlar.OrderByDescending(p => p.kur_tarih).Select(p => p.kur_tarih).FirstOrDefault();
                            t5.tarih = DateTime.Now;
                            db.AddTotbl_siparisler(t5);
                            #endregion

                            db.SaveChanges();

                            switch (OdemeTipi)
                            {
                                case Sabitler.OdemeTipi.BankaHavalesi:
                                    #region seçilen havale adresi cpy_odeme_bildirimler_hesap_nolar kopyalanıyor
                                    tbl_cpy_odeme_bildirimler_hesap_nolar t11 = new tbl_cpy_odeme_bildirimler_hesap_nolar();
                                    t11.hesap_nolar_id = Sistem.Odeme.OdemeSekilleri.BankaHavalesi.HesapNoID;
                                    db.AddTotbl_cpy_odeme_bildirimler_hesap_nolar(t11);
                                    db.SaveChanges();
                                    #endregion

                                    #region ödeme bildirimi yazılıyor
                                    tbl_odeme_bildirimler t10 = new tbl_odeme_bildirimler();
                                    t10.siparis_id = t5.id;
                                    t10.odeme_bildirimler_hesap_nolar_id = t11.id;
                                    t10.tutar = t5.tutar;
                                    t10.tutar = Sistem.Sepet.Toplam;
                                    t10.para_birimi_id = t5.para_birimi_id;
                                    db.AddTotbl_odeme_bildirimler(t10);
                                    db.SaveChanges();
                                    #endregion
                                    break;

                                case Sabitler.OdemeTipi.KrediKarti:

                                    #region Kredi Kartı İle Ödeme
                                    tbl_siparisler_odemeler_kk t6 = new tbl_siparisler_odemeler_kk();
                                    t6.siparis_id = t5.id;

                                    /*t6.banka_id = KKIO.KK.BankaID;
                                    t6.sanal_pos_id = KKIO.POSID;
                                    t6.sanal_pos_oranlar_id = 0;
                                    t6.C3d_secure = KKIO.KK.TDSecure;
                                    t6.ad_soyad = KKIO.KK.AdSoyad;
                                    t6.kart_no = KartNoFormatla(KKIO.KK.KartNo, true, null, "*");*/

                                    t6.banka_id = Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.BankaID;
                                    t6.sanal_pos_id = Sistem.Odeme.OdemeSekilleri.KrediKarti.OdemeBilgileri.POSID;
                                    t6.sanal_pos_oranlar_id = 0; //bu yapılmalı. bundan kyıt etmiyor.
                                    t6.C3d_secure = Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.TDSecure;
                                    t6.ad_soyad = Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.AdSoyad;
                                    t6.kart_no = KartNoFormatla(Sistem.Odeme.OdemeSekilleri.KrediKarti.KartBilgileri.KartNo, true, null, "*");

                                    t6.islem_id = "0";
                                    t6.onay_kodu = "0";
                                    t6.referans_no = "0";

                                    db.AddTotbl_siparisler_odemeler_kk(t6);
                                    db.SaveChanges();
                                    #endregion
                                    break;

                                /*
                            case Sabitler.OdemeTipi.KapidaOdeme:
                                break;

                            case Sabitler.OdemeTipi.Paypal:
                                break;

                            case Sabitler.OdemeTipi.PostaHavalesi:
                                break;
                                 */
                            }

                            //tbl_sepetler objesi
                            var DBS = (from a in db.tbl_sepetler
                                       where a.kullanici_id == KullaniciID && a.durum == false
                                       select a);

                            #region Sepetler tablosundaki siparişi verilen ürünlerin detaylı bilgileri tbl_cpy_siparisler_urunler 'e kopyalanıyor
                            if (DBS.Any())
                            {
                                foreach (var i in DBS)
                                {
                                    tbl_cpy_siparisler_urunler t7 = new tbl_cpy_siparisler_urunler();
                                    t7.urunler_id = i.urun_id;
                                    db.AddTotbl_cpy_siparisler_urunler(t7);
                                }
                            }
                            #endregion

                            db.SaveChanges();

                            #region Sepete atılan ürünlerin detaylı bilgileri kopyalandığı cpy_urunler tablosundan id ler alınıp siparis_urunler tablosuna yazdırılıyor
                            if (DBS.Any())
                            {
                                foreach (var i in DBS)
                                {
                                    tbl_siparisler_urunler t9 = new tbl_siparisler_urunler();
                                    t9.siparis_id = t5.id;
                                    t9.siparisler_urunler_id = SiparisUrunID(i.urun_id);
                                    t9.adet = i.adet;
                                    t9.sepet_id = i.id;
                                    db.AddTotbl_siparisler_urunler(t9);
                                }
                            }
                            #endregion

                            db.SaveChanges();

                            #region Siparişi verilen sepetteki ürünleri durumları true yapılıyor yani ürünün siparişi oluşturulmuş
                            if (DBS.Any())
                            {
                                foreach (var i in DBS)
                                {
                                    i.durum = true;
                                }
                            }
                            #endregion

                            #region gönderilecek kargo bilgileri yazılıyor
                            tbl_siparisler_gonderimler Tbl = new tbl_siparisler_gonderimler();
                            Tbl.siparis_id = SHOPClass.Fonksiyonlar.Sepet.SiparisID();
                            Tbl.kargo_id = Sistem.Sepet.KargoFirmaID;
                            db.AddTotbl_siparisler_gonderimler(Tbl);
                            #endregion

                            db.SaveChanges();

                            Sistem.Sepet.Dispose();
                            //KKIO.Dispose();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        #region Bunu bilmeyenleri döverler walla
                        Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(186) + " / " + ex.Message, "/basket.aspx");
                        #endregion
                    }
#endif
                }

                /// <summary>
                /// Sipariş oluşturma
                /// </summary>
                /*
                 * Create HY 00.00.00 00:00
                 * Edit FÜ 04.10.2012 03:12 ÖdemeTipi Eklendi.
                */
                public static void SiparisOlustur(Sabitler.OdemeTipi OdemeTipi)
                {
                    /*try
                    {
                        //SHOPObjeler.Tanimlar.KrediKartiIleOdeme KKIO = new SHOPObjeler.Tanimlar.KrediKartiIleOdeme();
                        int KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

                        #region Müşteri teslimat adresinin copy sini oluşturmak için
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_cpy_siparisler_kullanicilar_adresler TblEkle = new tbl_cpy_siparisler_kullanicilar_adresler();
                            TblEkle.kullanicilar_adresler_id = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.KargoAdresID).FirstOrDefault();
                            db.AddTotbl_cpy_siparisler_kullanicilar_adresler(TblEkle);
                            db.SaveChanges();
                        }
                        #endregion

                        #region Müşteri fatura adresinin copy sini oluşturmak için
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_cpy_siparisler_kullanicilar_adresler TblEkle = new tbl_cpy_siparisler_kullanicilar_adresler();
                            TblEkle.kullanicilar_adresler_id = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.FaturaAdresID).FirstOrDefault();
                            db.AddTotbl_cpy_siparisler_kullanicilar_adresler(TblEkle);
                            db.SaveChanges();
                        }
                        #endregion

                        #region Müşteri vergi bilgileri copy sini oluşturmak için
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_cpy_siparisler_kullanicilar_vergi_bilgiler TblEkle = new tbl_cpy_siparisler_kullanicilar_vergi_bilgiler();
                            TblEkle.kullanicilar_vergi_bilgiler_id = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.VergiBilgiID).FirstOrDefault();
                            db.AddTotbl_cpy_siparisler_kullanicilar_vergi_bilgiler(TblEkle);
                            db.SaveChanges();
                        }
                        #endregion

                        #region Müşteri vergi bilgileri copy sini oluşturmak için
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_cpy_indirimler_komisyonlar TblEkle = new tbl_cpy_indirimler_komisyonlar();
                            TblEkle.indirimler_komisyonlar_id = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.IndirimKomisyonID).FirstOrDefault();
                            db.AddTotbl_cpy_indirimler_komisyonlar(TblEkle);
                            db.SaveChanges();
                        }
                        #endregion

                        #region Müşteri siparişi siparisler tablosuna yazdırıyoruz
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_siparisler TblEkle = new tbl_siparisler();
                            TblEkle.kullanici_id = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.KullaniciID).FirstOrDefault();
                            TblEkle.kargo_adres_id = db.tbl_cpy_siparisler_kullanicilar_adresler.Where(p => p.kullanici_id == (KullaniciID) && p.tip == true).OrderByDescending(p => p.tarih).Select(p => p.id).FirstOrDefault();
                            TblEkle.fatura_adres_id = db.tbl_cpy_siparisler_kullanicilar_adresler.Where(p => p.kullanici_id == (KullaniciID) && p.tip == false).OrderByDescending(p => p.tarih).Select(p => p.id).FirstOrDefault();
                            TblEkle.vergi_bilgileri_id = db.tbl_cpy_siparisler_kullanicilar_vergi_bilgiler.Where(p => p.kullanici_id == (KullaniciID)).OrderByDescending(p => p.tarih).Select(p => p.id).FirstOrDefault();
                            TblEkle.tutar = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.Tutar).FirstOrDefault();
                            TblEkle.indirim_tutari = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.IndirimTutar).FirstOrDefault();
                            TblEkle.toplam_tutar = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.ToplamTutar).FirstOrDefault();
                            TblEkle.toplam_kdv = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.ToplamKdv).FirstOrDefault();
                            TblEkle.genel_toplam = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.GenelToplam).FirstOrDefault();
                            TblEkle.komisyon_tutari = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.KomisyonTutar).FirstOrDefault();
                            TblEkle.kargo_payi = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.KargoPayi).FirstOrDefault();
                            TblEkle.toplam = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.Toplam).FirstOrDefault();
                            TblEkle.para_birimi_id = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();
                            TblEkle.indirim_komisyon_id = db.tbl_cpy_indirimler_komisyonlar.OrderByDescending(p => p.tarih).Select(p => p.id).FirstOrDefault();

                            switch (OdemeTipi)
                            {
                                case Sabitler.OdemeTipi.BankaHavalesi:
                                    TblEkle.odeme_sekli_id = 1;
                                    break;

                                case Sabitler.OdemeTipi.KrediKarti:
                                    TblEkle.odeme_sekli_id = 2;

                                    //Kredi Kartı Ödeme Bilgileri Objesini Alıyoruz
                                    KKIO = SHOPObjeler.Listeler.KrediKartiIleOdeme.Where(k => k.Key == HttpContext.Current.Session.SessionID).Select(k => k.Value).Cast<SHOPObjeler.Tanimlar.KrediKartiIleOdeme>().FirstOrDefault();

                                    #region Puan Kullanımı varsa puan bilgilerini db ye ekliyoruz.
                                    if (KKIO.OB.PuanKullan)
                                    {
                                        TblEkle.puan_tutari = KKIO.OB.Puan;
                                    }
                                    #endregion
                                    break;

                                case Sabitler.OdemeTipi.KapidaOdeme:
                                    TblEkle.odeme_sekli_id = 4;
                                    break;

                                case Sabitler.OdemeTipi.Paypal:
                                    TblEkle.odeme_sekli_id = 5;
                                    break;

                                case Sabitler.OdemeTipi.PostaHavalesi:
                                    TblEkle.odeme_sekli_id = 6;
                                    break;
                            }

                            //TblEkle.odeme_sekli_id = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (KullaniciID)).Select(p => p.OdemeSekliID).FirstOrDefault();
                            TblEkle.kur_tarih = db.tbl_gunluk_kurlar.OrderByDescending(p => p.kur_tarih).Select(p => p.kur_tarih).FirstOrDefault();
                            TblEkle.tarih = DateTime.Now;
                            db.AddTotbl_siparisler(TblEkle);
                            db.SaveChanges();
                        }
                        #endregion

                        #region Kredi Kartı İle Ödeme
                        if (OdemeTipi == Sabitler.OdemeTipi.KrediKarti)
                        {
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_siparisler_odemeler_kk t1 = new tbl_siparisler_odemeler_kk();
                                t1.siparis_id = SiparisID(); //bunu sadece bu fonksityonda kullanırsak gereksiz çünkü hem her zaman %100 sonuç vermez. hem de yukarıda dönüyor zaten siparis id onu almak gerek!
                                t1.banka_id = KKIO.KK.BankaID;
                                t1.sanal_pos_id = KKIO.POSID;
                                t1.sanal_pos_oranlar_id = 0;
                                t1.C3d_secure = KKIO.KK.TDSecure;
                                t1.ad_soyad = KKIO.KK.AdSoyad;
                                t1.kart_no = KartNoFormatla(KKIO.KK.KartNo, true, null, "*");

                                t1.islem_id = "0";
                                t1.onay_kodu = "0";
                                t1.referans_no = "0";

                                db.AddTotbl_siparisler_odemeler_kk(t1);
                                db.SaveChanges();
                            }
                        }
                        #endregion

                        #region Sepetler tablosundaki siparişi verilen ürünlerin detaylı bilgileri kopyalanıyor
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_sepetler
                                       where a.kullanici_id == KullaniciID && a.durum == false
                                       select a).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                foreach (var i in SQL)
                                {
                                    BaglantiCumlesi ekle = new BaglantiCumlesi();
                                    tbl_cpy_siparisler_urunler TblEkle = new tbl_cpy_siparisler_urunler();
                                    TblEkle.urunler_id = i.urun_id;
                                    ekle.AddTotbl_cpy_siparisler_urunler(TblEkle);
                                    ekle.SaveChanges();
                                }
                            }
                        }
                        #endregion

                        #region Sipariş verildiği zaman siparişin, sipariş durumlarını takip etmek amacıyla ayrı tablo yapıldı, ilk adım işleniyor
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            tbl_siparisler_durumlar TblEkle = new tbl_siparisler_durumlar();
                            TblEkle.siparis_id = SiparisID();
                            TblEkle.siparis_durum_id = 2;
                            db.AddTotbl_siparisler_durumlar(TblEkle);
                            db.SaveChanges();
                        }
                        #endregion

                        #region Sepete atılan ürünlerin detaylı bilgileri kopyalandığı cpy_urunler tablosundan id ler alınıp siparis_urunler tablosuna yazdırılıyor
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_sepetler
                                       where a.kullanici_id == KullaniciID && a.durum ==
                                           false
                                       select a).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                foreach (var i in SQL)
                                {
                                    BaglantiCumlesi ekle = new BaglantiCumlesi();
                                    tbl_siparisler_urunler TblEkle = new tbl_siparisler_urunler();
                                    TblEkle.siparis_id = SiparisID();
                                    TblEkle.siparisler_urunler_id = SiparisUrunID(i.urun_id);
                                    TblEkle.adet = i.adet;
                                    TblEkle.sepet_id = i.id;
                                    ekle.AddTotbl_siparisler_urunler(TblEkle);
                                    ekle.SaveChanges();
                                }
                            }
                        }
                        #endregion

                        #region Siparişi verilen sepetteki ürünleri durumları true yapılıyor yani ürünün siparişi oluşturulmuş
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_sepetler
                                       where a.kullanici_id == (KullaniciID) && a.durum == false
                                       select new
                                       {
                                           a.id
                                       }).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                foreach (var i in SQL)
                                {
                                    BaglantiCumlesi guncelle = new BaglantiCumlesi();
                                    tbl_sepetler Tbl = guncelle.tbl_sepetler.First(p => p.id == i.id);
                                    Tbl.durum = true;
                                    guncelle.SaveChanges();
                                }
                            }
                        }
                        #endregion
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        #region Bunu bilmeyenleri döverler walla
                        Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(186) + " / " + ex.Message, "/basket.aspx");
                        #endregion
                    }*/
                }

                /// <summary>
                /// UrunID ile siparişi alınmış ürünün copy tablosundaki ID si alınıyor
                /// </summary>
                /*
                 * Create HY 00.00.00 00:00
                */
                public static int SiparisUrunID(int UrunID)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_cpy_siparisler_urunler
                                       where a.urunler_id == UrunID
                                       orderby a.tarih descending
                                       select a.id).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault();
                            }
                            else
                            {
                                return -1;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return -1;
                    }
#endif
                }

                /// <summary>
                /// Kullanıcıya göre alınan en son siparişin ID sini veriyor
                /// </summary>
                /*
                 * Create HY 00.00.00 00:00
                */
                public static int SiparisID()
                {
#if DEBUG
                    try
                    {
#endif
                        int KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_siparisler
                                       where a.kullanici_id == KullaniciID
                                       orderby a.tarih descending
                                       select a.id).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault();
                            }
                            else
                            {
                                return -1;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return -1;
                    }
#endif
                }

                /// <summary>
                /// Fatura adresinin vergi bilgileri için ID sini veriyor
                /// </summary>
                /*
                 * Create HY 00.00.00 00:00
                */
                public static int VergiBilgiID(int ID)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_kullanicilar_vergi_bilgiler
                                       where a.adres_id == ID
                                       select a.id).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault();
                            }
                            else
                            {
                                return -1;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return -1;
                    }
#endif
                }
            }

            public class Kullanici
            {
                #region Üyelik metot tablosundan bilgi çağırma
                public static List<tbl_sbt_uyelik_metot_ayar> UyelikMetodlari(int UyelikMetodID)
                {
                    List<tbl_sbt_uyelik_metot_ayar> SQL = new List<tbl_sbt_uyelik_metot_ayar>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            SQL = (from p in db.tbl_sbt_uyelik_metot_ayar
                                   where p.id == UyelikMetodID
                                   select p).AsEnumerable().Take(1).Cast<tbl_sbt_uyelik_metot_ayar>().ToList();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return SQL;
                }
                #endregion

                public class Genel
                {
                    /// <summary>
                    /// Üyelik metoduna göre kullanici oluşturuyor
                    /// </summary>
                    /*
                     * Create HY 00.00.00 00:00
                    */
                    public static void KullaniciOlustur(int MetodID, string MetodUyeID, string MetodInfo, string Isim, string EPosta, string Sifre, int? AlanKodu, string Telefon, bool Onay)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_kullanicilar Tbl = new tbl_kullanicilar();
                                Tbl.uyelik_metot_id = MetodID;
                                Tbl.uyelik_metot_uye_id = MetodUyeID;
                                Tbl.uyelik_metot_info = MetodInfo;
                                Tbl.ad_soyad = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Isim));
                                Tbl.mail = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta));
                                Tbl.sifre = SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(HttpUtility.HtmlEncode(Sifre));
                                Tbl.alan_kodu_id = AlanKodu;
                                Tbl.gsm = HttpUtility.HtmlEncode(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Telefon));
                                Tbl.onay = Onay;
                                Tbl.tarih_ek = DateTime.Now;
                                db.AddTotbl_kullanicilar(Tbl);
                                db.SaveChanges();
                            }

                            #region siteden yapılan üyeliklere aktivasyon istiyoruz
                            if (MetodID == 1)
                            {
                                #region üye kayıt ve aktivasyon maili
                                string MailMetin = Class.Fonksiyonlar.Uygulama.SabitlerText(245);
                                MailMetin = MailMetin.Replace("{{FirmaLogo}}", "<img src=\"http://" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault() + "/images/logo.png\" alt=\"" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault() + "\" />");
                                MailMetin = MailMetin.Replace("{{MusteriAdi}}", Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Isim));
                                MailMetin = MailMetin.Replace("{{MusteriEposta}}", Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta));
                                MailMetin = MailMetin.Replace("{{MusteriSifre}}", Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Sifre));
                                MailMetin = MailMetin.Replace("{{AktivasyonLink}}", "<a target=\"_blank\" href=\"http://" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault() + "/activation.aspx?m=" + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta) + "&c=" + SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta)) + "\">http://" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault() + "/activation.aspx?m=" + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta) + "&c=" + SHOPClass.Fonksiyonlar.Kullanici.Genel.SifreOlustur(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta)) + "</a>");
                                MailMetin = MailMetin.Replace("{{FirmaAdi}}", (string)Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault());

                                string KullaniciAdi, Sifre2, Host;
                                int Port;
                                Class.Fonksiyonlar.Genel.Mail.Bilgiler(out KullaniciAdi, out Sifre2, out Host, out Port);
                                Class.Fonksiyonlar.Genel.Mail.Gonder(KullaniciAdi, Sifre2, Host, Port, Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta), null, null, Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.mail).FirstOrDefault(), Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault(), Class.Fonksiyonlar.Uygulama.SabitlerText(246), MailMetin, true);
                                #endregion

                                Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(91), "/");
                            }
                            #endregion
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    /// <summary>
                    /// Rastgele sifre oluşturur
                    /// </summary>
                    /*
                     * Create HY 00.00.00 00:00
                    */
                    public static string RastgeleSifreOlustur(int SifreUzunlugu)
                    {
                        char[] karakter = "0123456789abcdefghijklmnopqrstuvwxyz".ToCharArray();
                        string sonuc = null;

#if DEBUG
                        try
                        {
#endif
                            Random r = new Random();
                            for (int i = 0; i < SifreUzunlugu; i++)
                            {
                                sonuc += karakter[r.Next(0, karakter.Length - 1)].ToString();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                        return sonuc;
                    }

                    /// <summary>
                    /// Kullanıcı parolasını şifreleme
                    /// </summary>
                    /*
                     * Create HY 00.00.00 00:00
                    */
                    public static string SifreOlustur(string str)
                    {
#if DEBUG
                        try
                        {
#endif
                            return FormsAuthentication.HashPasswordForStoringInConfigFile(FormsAuthentication.HashPasswordForStoringInConfigFile(FormsAuthentication.HashPasswordForStoringInConfigFile(str + "- Fatih ÜNAL", "sha1"), "md5"), "md5");
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }

                    /// <summary>
                    /// Kullanıcı oturum kontrolü
                    /// </summary>
                    /*
                     * Create HY 00.00.00 00:00
                     * Edit HY 11/09/12 00:29 - Localmode olayı eklendi
                    */
                    public static bool SessionKontrol()
                    {
                        // HY 11/09/12 00:29
                        if (!Class.Fonksiyonlar.Firma.Ayar().Select(p => p.mode).FirstOrDefault())
                        {
                            int index = -1;

#if DEBUG
                            try
                            {
#endif
                                index = SHOPObjeler.Listeler.Kullanici.FindIndex(delegate(SHOPObjeler.Tanimlar.Kullanici k)
                                                        {
                                                            return (k.SessionID == HttpContext.Current.Session.SessionID);
                                                        });

                                if (index != -1)
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return false;
                            }
#endif
                        }
                        else
                        {
                            return true;
                        }
                    }

                    /// <summary>
                    /// Oturumu açan kullanıcının ID sini statik değişkenden alıyor
                    /// </summary>
                    /*
                     * Create HY 00.00.00 00:00
                    */
                    public static int ID()
                    {
                        int index = -1;

#if DEBUG
                        try
                        {
#endif
                            index = SHOPObjeler.Listeler.Kullanici.FindIndex(delegate(SHOPObjeler.Tanimlar.Kullanici p)
                                                    {
                                                        return (p.SessionID == HttpContext.Current.Session.SessionID);
                                                    });

                            if (index != -1)
                            {
                                return SHOPObjeler.Listeler.Kullanici[index].ID;
                            }
                            else
                            {
                                return -1;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return -1;
                        }
#endif
                    }

                    /// <summary>
                    /// Google giriş durumunu kontrol ediyor, eğer giriş yapılmışsa giriş işlemlerine yönlendiriyor
                    /// </summary>
                    /*
                     * Create HY 00.00.00 00:00
                    */
                    public static void GoogleKontrol()
                    {
#if DEBUG
                        try
                        {
#endif
                            OpenIdRelyingParty rp = new OpenIdRelyingParty();
                            var r = rp.GetResponse();

                            if (r != null)
                            {
                                switch (r.Status)
                                {
                                    #region Google hesabı ile giriş yapıldıysa
                                    case AuthenticationStatus.Authenticated:
                                        HttpContext.Current.Session["GoogleToken"] = r.ClaimedIdentifier.ToString();
                                        HttpContext.Current.Response.Redirect("login.aspx?p=google", false);
                                        HttpContext.Current.ApplicationInstance.CompleteRequest();
                                        break;
                                    #endregion

                                    #region Login iptal edildi
                                    case AuthenticationStatus.Canceled:
                                        Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(297));
                                        break;
                                    #endregion

                                    #region Login başarısızsa
                                    case AuthenticationStatus.Failed:
                                        Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(296));
                                        break;
                                    #endregion
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

                    /// <summary>
                    /// Google ile giriş yapıldığında kullanıcının id, isim ve mail bilgilerini alıyor
                    /// </summary>
                    /*
                     * Create HY 00.00.00 00:00
                    */
                    public static void GoogleGiris()
                    {
#if DEBUG
                        try
                        {
#endif
                            OpenIdRelyingParty openid = new OpenIdRelyingParty();
                            var response = openid.GetResponse();

                            if (response == null)
                            {
                                #region google'dan kişinin bilgilerini istemek için istek nesnesi oluşturuyoruz ve parametre olarakta daha önceden almış olduğumuz token'ı veriyoruz
                                var request = openid.CreateRequest(HttpContext.Current.Session["GoogleToken"].ToString());
                                var fetchRequest = new FetchRequest();
                                #endregion

                                #region oluşturduğumuz istek nesnesine kişinin hangi bilgilerini istediğmizi ekliyoruz ve isteği gönderiyoruz
                                fetchRequest.Attributes.AddRequired(WellKnownAttributes.Contact.Email);
                                fetchRequest.Attributes.AddRequired(WellKnownAttributes.Name.First);
                                fetchRequest.Attributes.AddRequired(WellKnownAttributes.Name.Last);
                                request.AddExtension(fetchRequest);
                                request.RedirectToProvider();
                                #endregion
                            }
                            else
                            {
                                var fetchResponse = response.GetExtension<FetchResponse>();

                                #region dönen cevabı session'da saklıyoruz
                                HttpContext.Current.Session["FetchResponse"] = fetchResponse;
                                var response1 = HttpContext.Current.Session["FetchResponse"] as FetchResponse;
                                #endregion

                                #region eğer cevap yoksa sayfa yüklenmiyor
                                if (response1 == null)
                                {
                                    HttpContext.Current.Response.Redirect("login.aspx", false);
                                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                                }
                                #endregion

                                #region giriş onaylandı ve kullanıcının bilgileri geliyor
                                SosyalAgEPostaKontrol(response1.GetAttributeValue(WellKnownAttributes.Contact.Email), response1.GetAttributeValue(WellKnownAttributes.Name.First) + " " + response1.GetAttributeValue(WellKnownAttributes.Name.Last), 4, "");
                                #endregion
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    /// <summary>
                    /// Facebook ile giriş yapıldığında kullanıcının id, isim ve mail bilgilerini alıyor
                    /// </summary>
                    /*
                     * Create HY 11.08.12 14:39
                    */
                    public static void FacebookGiris()
                    {
#if DEBUG
                        try
                        {
#endif
                            string getAccessToken = "";

                            if (HttpContext.Current.Request.QueryString["code"] != null)
                            {
                                WebRequest AccessTokenWebRequest = WebRequest.Create("tam");
                                StreamReader AccessTokenWebRequestStream = new StreamReader(AccessTokenWebRequest.GetResponse().GetResponseStream());
                                dynamic WebRequestResponse = AccessTokenWebRequestStream.ReadToEnd();
                                getAccessToken = WebRequestResponse.Substring(13, WebRequestResponse.Length - 13);

                                FacebookClient FBApp = new FacebookClient(getAccessToken);
                                dynamic user = FBApp.Get("/me");

                                SosyalAgEPostaKontrol(user.email, user.first_name + " " + user.last_name, 2, user.id);
                            }
                            else
                            {
                                HttpContext.Current.Response.Redirect("login.aspx", false);
                                HttpContext.Current.ApplicationInstance.CompleteRequest();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    /// <summary>
                    /// Twitter giriş durumunu kontrol ediyor, eğer giriş yapılmışsa giriş işlemlerine yönlendiriyor
                    /// </summary>
                    /*
                     * Create HY 13.08.12 12:37
                    */
                    public static void TwitterKontrol()
                    {
#if DEBUG
                        try
                        {
#endif
                            if (!string.IsNullOrEmpty(HttpContext.Current.Request["OAuth_token"]))
                            {
                                var OAuth = new oAuth
                                {
                                    ConsumerKey = SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(3).Select(x => x.app_id).FirstOrDefault(),
                                    ConsumerSecret = SHOPClass.Fonksiyonlar.Kullanici.UyelikMetodlari(3).Select(x => x.app_key).FirstOrDefault(),
                                    REQUEST_TOKEN = "https://api.twitter.com/oauth/request_token",
                                    ACCESS_TOKEN = "https://api.twitter.com/oauth/access_token",
                                    AUTHORIZE = "https://api.twitter.com/oauth/authorize"
                                };

                                OAuth.AccessTokenGet(HttpContext.Current.Request["OAuth_token"]);
                                if (OAuth.TokenSecret.Length > 0)
                                {
                                    const string url = "http://twitter.com/account/verify_credentials.xml";
                                    string x = OAuth.oAuthWebRequest(oAuth.Method.GET, url, String.Empty);

                                    var xml = new XmlDocument();
                                    xml.LoadXml(x);

                                    string name = "";
                                    string id = "";
                                    string mail = "";
                                    foreach (XmlNode elem in xml.DocumentElement.ChildNodes)
                                    {
                                        if (elem.Name == "name") name = elem.InnerXml;
                                        if (elem.Name == "id") id = elem.InnerXml;
                                        if (elem.Name == "email") mail = elem.InnerXml;
                                    }

                                    var bCookie = new HttpCookie("twitter_OAuth");
                                    bCookie.Values["name"] = name;
                                    bCookie.Values["id"] = id;
                                    bCookie.Values["mail"] = mail;
                                    bCookie.Values["token"] = OAuth.Token + "||" + OAuth.TokenSecret;
                                    bCookie.Expires = DateTime.Now.AddMinutes(5);
                                    HttpContext.Current.Response.Cookies.Add(bCookie);
                                }

                                HttpContext.Current.Response.Redirect("/login.aspx", false);
                                HttpContext.Current.ApplicationInstance.CompleteRequest();
                            }

                            /*if (!IsPostBack)
                            {
                                HttpCookie kuki = HttpContext.Current.Request.Cookies["twitter_OAuth"];
                                if (kuki != null)
                                {
                                    SosyalAgEPostaKontrol(kuki["mail"], kuki["name"], 3, kuki["id"]);
                                }
                            }*/
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    /// <summary>
                    /// Sosyal ağlardan giriş yapıldığındaki kullanıcının bilgilerini alarak kontrol ediyor kayıt yoksa kayıt oluşturup login oluyor
                    /// </summary>
                    /*
                     * Create HY 09.08.12 22:10
                    */
                    public static void SosyalAgEPostaKontrol(string EPosta, string Isim, int MetodID, string MetodUyeID)
                    {
#if DEBUG
                        try
                        {
#endif
                            #region sosyal ag girişinden gelen bilgileri kullanıcı veritabanımızda kontrol ettiriyoruz, kayıtı yoksa oluşturuyoruz varsa giriş yaptırıyoruz
                            if (SHOPClass.Fonksiyonlar.Kullanici.Kontroller.KullaniciAdi(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta)))
                            {
                                #region eğer gelen eposta adresi veritabanında varsa giriş yapıyor
                                Kontroller.GirisOlustur(EPosta, MetodID);
                                #endregion
                            }
                            else
                            {
                                #region eğer gelen eposta adresi veritabanında yoksa kayıt oluyor
                                using (BaglantiCumlesi db1 = new BaglantiCumlesi())
                                {
                                    var SQL = (from a in db1.tbl_kullanicilar where a.mail == EPosta select new { a.id });
                                    if (SQL.Any())
                                    {
                                        #region kayıt yapıldı giriş yapılıyor
                                        Kontroller.GirisOlustur(EPosta, MetodID);
                                        #endregion
                                    }
                                    else
                                    {
                                        #region kullanıcı ouşturuluyor
                                        SHOPClass.Fonksiyonlar.Kullanici.Genel.KullaniciOlustur(MetodID, MetodUyeID, null, Isim, EPosta, SHOPClass.Fonksiyonlar.Kullanici.Genel.RastgeleSifreOlustur(6), null, null, true);
                                        #endregion

                                        #region kayıt yapıldı giriş yapılıyor
                                        Kontroller.GirisOlustur(EPosta, MetodID);
                                        #endregion
                                    }
                                }
                                #endregion
                            }
                            #endregion
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }
                }

                #region üye girişi için kontrol fonksiyonları
                public class Kontroller
                {
                    public static void KullaniciAdiKontrol(string EPosta, string Sifre)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (KullaniciAdi(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta)))
                            {
                                OnayKontrol(EPosta, Sifre);
                            }
                            else
                            {
                                Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(94));
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    public static void OnayKontrol(string EPosta, string Sifre)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (Onay(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta)))
                            {
                                SifreKontrol(EPosta, Sifre);
                            }
                            else
                            {
                                Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(95));
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    public static void SifreKontrol(string EPosta, string Sifre)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (SHOPClass.Fonksiyonlar.Kullanici.Kontroller.Sifre(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta), Genel.SifreOlustur(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Sifre))))
                            {
                                GirisOlustur(EPosta, 1);
                            }
                            else
                            {
                                Class.Fonksiyonlar.JavaScript.MesajKutusu(Class.Fonksiyonlar.Uygulama.SabitlerText(96));
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    /// <summary>
                    /// Üye giriş metodu farketmezsiniz üye için application oluşturuyor
                    /// </summary>
                    /*
                     * Edit HY 14.08.2012 15:15 Eğer sosyal ağlardan mail gelmediyse member-info.aspx sayfasına yönlendiriyoruz
                     * Create HY 00.00.00 00:00
                    */
                    public static void GirisOlustur(string EPosta, int MetodID)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (!SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
                            {
                                using (SHOPObjeler.Tanimlar.Kullanici D = new SHOPObjeler.Tanimlar.Kullanici())
                                {
                                    D.ID = SHOPClass.Fonksiyonlar.Kullanici.Cagir.ID(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta));
                                    D.SessionID = HttpContext.Current.Session.SessionID;
                                    D.Tarih = DateTime.Now;
                                    D.IP = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                                    SHOPObjeler.Listeler.Kullanici.Add(D);
                                }
                            }

                            //HY 02.11.2012 kullanıcı için obje oluşturuyoruz
                            //Edit FÜ - 05.11.2012 00:06 Odeme objesi eklendi.
                            //Edit FÜ - 23.12.2012 22:12 Odeme içine kredi kartı objesi eklendi.
                            #region bunu kullanıcı sisteme girince yapacaksın. boş obje ile id sini ekliyoruz.
                            int KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Cagir.ID(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta));

                            if (!SHOPObjeler.Listeler.Sistem.Keys.Contains(KullaniciID))
                            {
                                using (SHOPObjeler.Tanimlar.Sistem S = new SHOPObjeler.Tanimlar.Sistem())
                                {
                                    // HY 12.01.2013 20:18 Kullanici objesi sisteme setleniyor
                                    /*using (SHOPObjeler.Tanimlar.Kullanici K = new SHOPObjeler.Tanimlar.Kullanici())
                                    {
                                        K.AdSoyad = Cagir.Bilgi(KullaniciID).Select(p => p.ad_soyad).FirstOrDefault();
                                        K.ID = KullaniciID;
                                        K.Mail = Cagir.Bilgi(KullaniciID).Select(p => p.mail).FirstOrDefault();
                                        S.Kullanici = K;
                                    }*/

                                    using (SHOPObjeler.Tanimlar.Odeme O = new SHOPObjeler.Tanimlar.Odeme())
                                    {
                                        S.Odeme = O;

                                        using (SHOPObjeler.Tanimlar.OdemeSekilleri OS = new SHOPObjeler.Tanimlar.OdemeSekilleri())
                                        {
                                            S.Odeme.OdemeSekilleri = OS;

                                            using (SHOPObjeler.Tanimlar.KrediKarti KK = new SHOPObjeler.Tanimlar.KrediKarti())
                                            {
                                                OS.KrediKarti = KK;
                                            }
                                        }

                                        SHOPObjeler.Listeler.Sistem.Add(KullaniciID, S);
                                    }
                                }
                            }
                            #endregion

                            if (Class.Fonksiyonlar.Firma.Ayar().Select(p => p.mode).FirstOrDefault() == false)
                            {
                                //HY 14.08.2012 15:15 BEGIN
                                if (MetodID == 3)
                                {
                                    Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(328).Replace("{{MusteriAdi}}", HttpUtility.HtmlDecode(SHOPClass.Fonksiyonlar.Kullanici.Cagir.Bilgi(SHOPClass.Fonksiyonlar.Kullanici.Cagir.ID(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta))).Select(p => p.ad_soyad).FirstOrDefault())), "/member-info.aspx?error=mail");
                                    //HttpContext.Current.Response.Redirect("/member-info.aspx?error=mail");
                                }
                                //HY 14.08.2012 15:15 END

                                if (HttpContext.Current.Request.QueryString["ReturnUrl"] == null)
                                {
                                    Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(328).Replace("{{MusteriAdi}}", HttpUtility.HtmlDecode(SHOPClass.Fonksiyonlar.Kullanici.Cagir.Bilgi(SHOPClass.Fonksiyonlar.Kullanici.Cagir.ID(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta))).Select(p => p.ad_soyad).FirstOrDefault())), "/");
                                    //HttpContext.Current.Response.Redirect("/");
                                }
                                else
                                {
                                    if (HttpContext.Current.Request.QueryString["ReturnUrl"].ToString() != "")
                                    {
                                        Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(328).Replace("{{MusteriAdi}}", HttpUtility.HtmlDecode(SHOPClass.Fonksiyonlar.Kullanici.Cagir.Bilgi(SHOPClass.Fonksiyonlar.Kullanici.Cagir.ID(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta))).Select(p => p.ad_soyad).FirstOrDefault())), HttpContext.Current.Request.QueryString["ReturnUrl"].ToString().Replace("basket-confirmation", "basket").Replace("basket-payment", "basket").Replace("basket-cargo", "basket").Replace("basket-address", "basket"));
                                        //HttpContext.Current.Response.Redirect(HttpContext.Current.Request.QueryString["ReturnUrl"].ToString().Replace("basket-confirmation", "basket").Replace("basket-payment", "basket").Replace("basket-cargo", "basket").Replace("basket-address", "basket"));
                                    }
                                    else
                                    {
                                        Class.Fonksiyonlar.JavaScript.MesajKutusuVeYonlendir(Class.Fonksiyonlar.Uygulama.SabitlerText(328).Replace("{{MusteriAdi}}", HttpUtility.HtmlDecode(SHOPClass.Fonksiyonlar.Kullanici.Cagir.Bilgi(SHOPClass.Fonksiyonlar.Kullanici.Cagir.ID(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, EPosta))).Select(p => p.ad_soyad).FirstOrDefault())), Class.Fonksiyonlar.Genel.MevcutSayfa());
                                        //HttpContext.Current.Response.Redirect(Class.Fonksiyonlar.Genel.MevcutSayfa());
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

                    public static bool KullaniciAdi(string KullaniciAdi)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from p in db.tbl_kullanicilar
                                           where p.mail == KullaniciAdi.Trim()
                                           select p.id).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }

                    public static bool Onay(string KullaniciAdi)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from p in db.tbl_kullanicilar
                                           where p.mail == KullaniciAdi.Trim() && p.onay == true
                                           select p.id).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }

                    public static bool Sifre(string KullaniciAdi, string Sifre)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from p in db.tbl_kullanicilar
                                           where p.mail == KullaniciAdi.Trim() && p.sifre == Sifre.Trim()
                                           select p.id).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }
                }
                #endregion

                #region üye bilgilerini çağırmak için
                public class Cagir
                {
                    public static int ID(string KullaniciAdi)
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
#if DEBUG
                            try
                            {
#endif
                                var SQL = (from p in db.tbl_kullanicilar
                                           where p.mail == KullaniciAdi.Trim()
                                           select p.id).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return SQL.FirstOrDefault();
                                }
                                else
                                {
                                    return -1;
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return -1;
                            }
#endif
                        }
                    }

                    // HY 12.01.2013 20:25 Kullanıcı bilgileri çağırma
                    #region Kullanıcı bilgileri çağırma
                    public static List<tbl_kullanicilar> Bilgi(int KullaniciID)
                    {
                        List<tbl_kullanicilar> SQL = new List<tbl_kullanicilar>();

#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                SQL = (from p in db.tbl_kullanicilar
                                       where p.id == KullaniciID
                                       select p).AsEnumerable().Take(1).Cast<tbl_kullanicilar>().ToList();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif

                        return SQL;
                    }
                    #endregion

                    // HY 12.01.2013 20:25 Kullanıcı bilgileri çağırma
                    #region Kullanıcı adres bilgileri çağırma
                    public static List<tbl_kullanicilar_adresler> AdresBilgi(int KullaniciID)
                    {
                        List<tbl_kullanicilar_adresler> SQL = new List<tbl_kullanicilar_adresler>();

#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                SQL = (from p in db.tbl_kullanicilar_adresler
                                       where p.id == KullaniciID
                                       select p).AsEnumerable().Take(1).Cast<tbl_kullanicilar_adresler>().ToList();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif

                        return SQL;
                    }
                    #endregion

                    /*public static string AdSoyad(int ID)
                    {
                        try
                        {
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from p in db.tbl_kullanicilar
                                           where p.id == ID
                                           select p.ad_soyad).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return SQL.FirstOrDefault();
                                }
                                else
                                {
                                    return "null";
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
                    }

                    public static string KullaniciAdi(int ID)
                    {
                        try
                        {
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from p in db.tbl_kullanicilar
                                           where p.id == ID
                                           select p.mail).AsEnumerable().Take(1);

                                if (SQL.Any())
                                {
                                    return SQL.FirstOrDefault();
                                }
                                else
                                {
                                    return null;
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
                    }*/
                }
                #endregion
            }
        }

        public class Finans
        {
            public static int DilID = Class.Fonksiyonlar.Dil.ID();
            public static int KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

            public class Cevirme
            {
                /// <summary>
                /// Gönderilen kuruş cinsinden tutarı TL ye çevirir. (kısaca 100 ile çarpar)
                /// </summary>
                /*
                 * Create FÜ - 12.08.2012 - 23:38
                 */
                /// <param name="KurusTutar">Kuruş</param>
                /// <returns>
                /// string olarak döndürür.
                /// </returns>
                public static string TLCevir(string KurusTutar)
                {
                    string sonuc = "0";

#if DEBUG
                    try
                    {
#endif
                        if (!string.IsNullOrEmpty(KurusTutar))
                        {
                            double Kurus = double.Parse(KurusTutar);
                            sonuc = (Kurus / 100).ToString();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return sonuc;
                }

                /// <summary>
                /// Gönderilen TL cinsinden tutarı kuruşa çevirir. (kısaca 100 e böler)
                /// </summary>
                /*
                 * Create FÜ - 12.08.2012 - 23:36
                 */
                /// <param name="TLTutar">Tutar</param>
                /// <returns>
                /// string olarak döndürür.
                /// </returns>
                public static string KurusCevir(string TLTutar)
                {
                    string sonuc = "0";

#if DEBUG
                    try
                    {
#endif
                        if (!string.IsNullOrEmpty(TLTutar))
                        {
                            double TL = double.Parse(TLTutar);
                            sonuc = (TL * 100).ToString();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return sonuc;
                }

                /// <summary>
                /// seçilen doviz kurunun virgülden sonraki uzunluğuna göre 12.051,54 gibi formata çevirme
                /// </summary>

                /*
                 * Create HY
                */
                public static string ParaFormat(string s)
                {
                    string sayim = string.Empty;

#if DEBUG
                    try
                    {
#endif
                        decimal ss = Convert.ToDecimal(s);

                        switch (SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizUzunlugu())
                        {
                            case 1:
                                sayim = String.Format("{0:#,###.#}", ss);
                                break;

                            case 2:
                                sayim = String.Format("{0:#,###.##}", ss);
                                break;

                            case 3:
                                sayim = String.Format("{0:#,###.###}", ss);
                                break;

                            case 4:
                                sayim = String.Format("{0:#,###.####}", ss);
                                break;

                            case 5:
                                sayim = String.Format("{0:#,###.#####}", ss);
                                break;

                            case 6:
                                sayim = String.Format("{0:#,###.######}", ss);
                                break;

                            case 7:
                                sayim = String.Format("{0:#,###.#######}", ss);
                                break;

                            case 8:
                                sayim = String.Format("{0:#,###.########}", ss);
                                break;

                            default:
                                sayim = String.Format("{0:#,###.##}", ss);
                                break;
                        }

                        //FÜ ekledi. 15.10.2012 - 02:38
                        if (!string.IsNullOrEmpty(sayim))
                        {
                            string sm = sayim.Substring(0, 1);

                            if (sm == ",")
                            {
                                sayim = 0 + sayim;
                            }
                            else
                            {
                                sayim = sayim.ToString();
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        sayim = s;
                    }
#endif

                    return sayim;
                }
            }

            public class Hesaplama
            {
                /// <summary>
                /// ürünün tutarını çağırıyoruz
                /// </summary>

                /*
                 * Create HY
                */
                public static string UrunTutar(int UrunID)
                {
#if DEBUG
                    try
                    {
#endif
                        double tutar = 0;
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_urunler
                                       where a.id == UrunID
                                       select new
                                       {
                                           a.fiyat,
                                           a.kdv,
                                           a.kdv_id,
                                           a.indirim_id,
                                           a.para_birimi_id,
                                           indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde).FirstOrDefault(),
                                           kdv_yuzde = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.yuzde).FirstOrDefault()
                                       }).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                foreach (var i in SQL)
                                {
                                    tutar = double.Parse(DovizCevir(i.fiyat.ToString(), i.para_birimi_id));

                                    if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                    {
                                        tutar = double.Parse(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(tutar.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0)));
                                    }

                                    if (i.kdv)
                                    {
                                        tutar = double.Parse(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(tutar.ToString(), i.kdv_yuzde.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat, 0)));
                                    }
                                }
                            }
                        }
                        return tutar.ToString();
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return "0";
                    }
#endif
                }

                /// <summary>
                /// gelen para birimine göre döviz çevirisi yapılıyor
                /// </summary>

                /*
                 * Create HY
                */
                public static string DovizCevir(string fiyat, int para_birim)
                {
#if DEBUG
                    try
                    {
#endif
                        if (SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz() == para_birim)
                        {
                            #region sistem döviz tipi ile gelen döviz tipi aynı ise fiyat aynen geri gidiyor
                            return fiyat;
                            #endregion
                        }
                        else
                        {
                            return ((double.Parse(fiyat) * Fonksiyonlar.Genel.Doviz.KurGetir(para_birim, null, SHOPObjeler.Tanimlar.DovizKuruTipleri.Alis)) / Fonksiyonlar.Genel.Doviz.KurGetir(SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz(), null, SHOPObjeler.Tanimlar.DovizKuruTipleri.Alis)).ToString();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                /// <summary>
                /// geçmiş tarihli döviz çevirisi yapıyor
                /// </summary>

                /*
                 * Create HY
                */
                public static string GecmisDovizCevir(string fiyat, int para_birim, DateTime kur_tarih)
                {
#if DEBUG
                    try
                    {
#endif
                        if (SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz() == para_birim)
                        {
                            return fiyat;
                        }
                        else
                        {
                            return ((double.Parse(fiyat) * Fonksiyonlar.Genel.Doviz.KurGetir(para_birim, kur_tarih, SHOPObjeler.Tanimlar.DovizKuruTipleri.Alis)) / Fonksiyonlar.Genel.Doviz.KurGetir(SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz(), kur_tarih, SHOPObjeler.Tanimlar.DovizKuruTipleri.Alis)).ToString();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                /// <summary>
                /// kredi kartı taksit hesaplama
                /// </summary>

                /*
                 * Create HY
                 * Edit HY 22.09.2012 12:10 Hesaplamalara KKDF oranı eklendi
                */
                public static string KrediKartiTaksit(double taksitsayi, double fiyat, double oran)
                {
#if DEBUG
                    try
                    {
#endif
                        //oran = (oran / 100) + 1;

                        #region web.config ten bsmv oranını alıyor
                        double bsmv = Class.Fonksiyonlar.Firma.Ayar().Select(p => p.bsmv).FirstOrDefault();
                        // Edit HY 22.09.2012 12:10
                        double kkdf = Class.Fonksiyonlar.Firma.Ayar().Select(p => p.kkdf).FirstOrDefault();
                        #endregion

                        #region Toplam tutara kk komisyon ekleme

                        // Edit HY 22.09.2012 12:10
                        //double BSMV = bsmv
                        double BSMV = bsmv + kkdf;
                        double Komisyon = oran;
                        double Oranlar = Komisyon * BSMV;
                        double OranlarSonuc = (Oranlar / (100 - Oranlar)) + 1;
                        double sonuc = (fiyat * OranlarSonuc);

                        if (taksitsayi > 1)
                        {
                            sonuc = (sonuc / taksitsayi);
                        }

                        #endregion

                        return sonuc.ToString();
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                /// <summary>
                /// KDV tutar hesaplama
                /// </summary>

                /*
                 * Create FÜ
                */
                public static string KDVTutari(string Fiyat, string KDVID, bool Dahil)
                {
                    if (!string.IsNullOrEmpty(Fiyat) || !string.IsNullOrEmpty(KDVID))
                    {
#if DEBUG
                        try
                        {
#endif
                            int PBI = int.Parse(KDVID);
                            double DFiyat = double.Parse(Fiyat);
                            double DKdvYuzde = 0;

                            var SQL = (from p in SHOPObjeler.Listeler.KDV
                                       where p.ID == PBI
                                       select p.Yuzde).AsEnumerable().Take(1);

                            if (SQL.Any())
                            {
                                DKdvYuzde = double.Parse(SQL.FirstOrDefault().ToString());

                                double ToplamFiyat = DFiyat * ((DKdvYuzde / 100) + 1);
                                double KDVTutari = ToplamFiyat - DFiyat;

                                if (Dahil)
                                {
                                    return ToplamFiyat.ToString();
                                }
                                else
                                {
                                    return KDVTutari.ToString();
                                }
                            }
                            else
                            {
                                return null;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }
                    else
                    {
                        return null;
                    }
                }

                /// <summary>
                /// toplam fiyat hesaplama
                /// </summary>

                /*
                 * Create FÜ
                */
                public static string ToplamFiyat(string Fiyat, string IndirimTutari, string KDVTutari, int Adet)
                {
                    if (!string.IsNullOrEmpty(Fiyat))
                    {
#if DEBUG
                        try
                        {
#endif
                            //((BirimFiyat - İndirim) + KDV) * Adet
                            double DFiyat = double.Parse(Fiyat);

                            #region İndirim
                            double DIndirimTutari = 0;

                            if (!string.IsNullOrEmpty(IndirimTutari))
                            {
                                DIndirimTutari = double.Parse(IndirimTutari);
                            }
                            #endregion
                            #region KDV
                            double DKDVTutari = 0;

                            if (!string.IsNullOrEmpty(KDVTutari))
                            {
                                DKDVTutari = double.Parse(KDVTutari);
                            }
                            #endregion

                            if (Adet > 1)
                            {
                                return (((DFiyat - DIndirimTutari) + DKDVTutari) * Adet).ToString();
                            }
                            else
                            {
                                return ((DFiyat - DIndirimTutari) + DKDVTutari).ToString();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }
                    else
                    {
                        return null;
                    }
                }

                public static string IndirimKomisyonHesapla(string Fiyat, string Yuzde, SHOPObjeler.Tanimlar.IndirimKomisyonTipleri Tip, double Carpim)
                {
                    if (!string.IsNullOrEmpty(Fiyat) || !string.IsNullOrEmpty(Yuzde))
                    {
#if DEBUG
                        try
                        {
#endif
                            double DFiyat = double.Parse(Fiyat);
                            double DYuzde = double.Parse(Yuzde);

                            double YuzdeMiktar = DYuzde * (DFiyat / 100);

                            double Sonuc = 0;

                            switch (Tip)
                            {
                                case SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat:
                                    // Fiyat içinden yüzde miktarını çıkarır
                                    Sonuc = DFiyat - YuzdeMiktar;
                                    break;
                                case SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonluFiyat:
                                    // Fiyat üzerine yüzde miktarını ekler
                                    Sonuc = DFiyat + YuzdeMiktar;
                                    break;
                                case SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.YuzdeMiktari:
                                    // Fiyatın yüzde miktarını verir
                                    Sonuc = YuzdeMiktar;
                                    break;
                                case SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonAyir:
                                    // Komisyonlu (kdv) fiyatın içinden yüzde miktarını çıkararak fiyatı verir
                                    Sonuc = DFiyat / ((DYuzde / 100) + 1);
                                    break;
                                case SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimAyir:
                                    // İndirimli fiyatın, indirimden önceki fiyatı verir
                                    Sonuc = DFiyat / (1 - (DYuzde / 100));
                                    break;
                                case SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat:
                                    // Sadece çarpım yaptırmak için fiyat yansıtılıyor
                                    Sonuc = DFiyat;
                                    break;
                            }

                            if (Carpim != 0)
                            {
                                // Çıkan sonucu çarpmak içn, örneğin sepette 5 ürün var ve birim fiyatına çarptırmak için
                                Sonuc = Sonuc * Carpim;
                            }

                            return Sonuc.ToString();
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }
                    else
                    {
                        return null;
                    }
                }
            }
        }
    }
}