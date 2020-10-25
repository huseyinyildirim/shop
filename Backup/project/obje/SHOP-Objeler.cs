using System;
using System.Collections.Generic;

namespace SHOP
{
    [Serializable]
    public class SHOPObjeler
    {

        [Serializable]
        public class Tanimlar
        {
            #region Obje Test [TAGGED]
            /*
            public class SingletonPattern
            {
                public Obje1 ObjeA { get; set; }
            }

            public class Obje2 : IDisposable
            {
                #region Instances
                public string Text { get; set; }
                public string SessionID { get; set; }

                private static Obje2 SD;
                private Obje2() { }
                private Obje2(string _Text, string _SessionID)
                {
                    _Text = Text;
                    _SessionID = SessionID;
                }
                #endregion

                #region Create Object
                public static Obje2 Nesne()
                {
                    if (SD == null)
                    {
                        SD = new Obje2();
                    }

                    return SD;
                }
                #endregion

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Obje2()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Obje1 : IDisposable
            {
                #region Instances
                public string Text { get; set; }
                public string SessionID { get; set; }

                private static Obje1 SD { get; set; }
                private Obje1() { }
                private Obje1(string _Text, string _SessionID)
                {
                    _Text = Text;
                    _SessionID = SessionID;
                }
                #endregion

                #region Create Object
                public static Obje1 Nesne()
                {
                    if (SD == null)
                    {
                        SD = new Obje1();
                    }

                    return SD;
                }
                #endregion

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Obje1()
                {
                    Dispose(false);
                }
                #endregion
            }
            */
            #endregion

            #region Sistem Objesi
            [Serializable]
            public class Sistem : IDisposable
            {
                public Kullanici Kullanici { get; set; }
                public Sepet Sepet { get; set; }
                public Kargo Kargo { get; set; }
                public Adresler Adresler { get; set; }
                public VergiBilgiler VergiBilgiler { get; set; }
                public Siparisler Siparisler { get; set; }
                public Tanimlar.Odeme Odeme { get; set; }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Sistem()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class Odeme : IDisposable
            {
                public SHOPClass.Sabitler.OdemeTipi OdemeTipi;
                public Tanimlar.OdemeSekilleri OdemeSekilleri { get; set; }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Odeme()
                {
                    Dispose(false);
                }
                #endregion
            }

            /*
             * Create FÜ - 04.11.2012 17:35
             */
            [Serializable]
            public class OdemeSekilleri : IDisposable
            {
                public Tanimlar.KrediKarti KrediKarti { get; set; }
                public Tanimlar.BankaHavalesi BankaHavalesi { get; set; }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~OdemeSekilleri()
                {
                    Dispose(false);
                }
                #endregion
            }

            /*
            * Create FÜ - 03.12.2012 03:15
            */
            [Serializable]
            public class KrediKarti : IDisposable
            {
                public Tanimlar.KrediKart KartBilgileri { get; set; }
                public Tanimlar.KKOdemeBilgileri OdemeBilgileri { get; set; }
                public SHOPObjeler.Tanimlar.POSIslem PosIslem { get; set; }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~KrediKarti()
                {
                    Dispose(false);
                }
                #endregion
            }
            #endregion

            [Serializable]
            public class KdvOran
            {
                public double Fiyat { get; set; }
                public double Yuzde { get; set; }
                public KdvOran() { }
                public KdvOran(double _Fiyat, double _Yuzde)
                {
                    _Fiyat = Fiyat;
                    _Yuzde = Yuzde;
                }
            }

            /// <summary>
            /// ID ve AD parametresi döndürecek tüm işlemler için yapılmış genel bir obje
            /// </summary>
            /*
             * Create FÜ 18.08.2012 01:06
             */
            [Serializable]
            public class Genel : IDisposable
            {
                public int? ID { get; set; }
                public string AD { get; set; }
                public Genel() { }
                public Genel(int? _ID, string _AD)
                {
                    _ID = ID;
                    _AD = AD;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Genel()
                {
                    Dispose(false);
                }
                #endregion
            }

            //Bu ne işe yarıyor anlamadım. Ben yazdım ben anlamıyorum :) Fazlalık gibi.
            /// <summary>
            /// Session ve ID parametresi döndürecek tüm işlemler için yapılmış genel bir obje
            /// </summary>
            /*
             * Create FÜ 18.08.2012 02:10
             */
            [Serializable]
            public class SessionGenelID : IDisposable
            {
                public SHOPClass.Sabitler.OdemeTipi OdemeTipi { get; set; }
                public string SessionID { get; set; }
                public int KullaniciID { get; set; }
                public int ID { get; set; }
                public SessionGenelID() { }
                public SessionGenelID(SHOPClass.Sabitler.OdemeTipi _OdemeTipi, string _SessionID, int _KullaniciID, int _ID)
                {
                    _OdemeTipi = OdemeTipi;
                    _SessionID = SessionID;
                    _KullaniciID = KullaniciID;
                    _ID = ID;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~SessionGenelID()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class Kullanici : IDisposable
            {
                public string SessionID { get; set; }
                public int ID { get; set; }
                public SHOPObjeler.Tanimlar.Genel UyelikMetotID { get; set; }
                public string UyelikMetotUyeID { get; set; }
                public string UyelikMetotInfo { get; set; }
                public string AdSoyad { get; set; }
                public string Sifre { get; set; }
                public string Mail { get; set; }
                public int? AlanKoduID { get; set; }
                public string Gsm { get; set; }
                public bool Onay { get; set; }
                public string IP { get; set; }
                public DateTime Tarih { get; set; }
                public Kullanici() { }
                public Kullanici(string _SessionID, int _ID, SHOPObjeler.Tanimlar.Genel _UyelikMetotID, string _UyelikMetotUyeID, string _UyelikMetotInfo, string _AdSoyad, string _Sifre, string _Mail, int? _AlanKoduID, string _Gsm, bool _Onay, DateTime _Tarih, string _IP)
                {
                    _SessionID = SessionID;
                    _ID = ID;
                    _UyelikMetotID = UyelikMetotID;
                    _UyelikMetotUyeID = UyelikMetotUyeID;
                    _UyelikMetotInfo = UyelikMetotInfo;
                    _AdSoyad = AdSoyad;
                    _Sifre = Sifre;
                    _Mail = Mail;
                    _AlanKoduID = AlanKoduID;
                    _Gsm = Gsm;
                    _Onay = Onay;
                    _Tarih = Tarih;
                    _IP = IP;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Kullanici()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class Sepet : IDisposable
            {
                public int KullaniciID { get; set; }
                public int SiparisDurumID { get; set; }
                public int SepetID { get; set; }
                public int KargoAdresID { get; set; }
                public int FaturaAdresID { get; set; }
                public int VergiBilgiID { get; set; }
                public int IndirimID { get; set; }
                public double Tutar { get; set; }
                public double IndirimTutar { get; set; }
                public double ToplamTutar { get; set; }
                public double ToplamKdv { get; set; }
                public double GenelToplam { get; set; }
                public double KomisyonTutar { get; set; }
                public double KargoPayi { get; set; }
                public double Toplam { get; set; }
                public int KargoFirmaID { get; set; }
                public int IndirimKomisyonID { get; set; }
                public string IndirimKomisyonAdi { get; set; }
                public int ParaBirimID { get; set; }
                public int OdemeSekliID { get; set; }
                public Sepet() { }
                public Sepet(int _KullaniciID, int _SiparisDurumID, int _SepetID, int _KargoAdresID, int _FaturaAdresID, int _VergiBilgiID, int _IndirimID, double _Tutar, double _IndirimTutar, double _ToplamTutar, double _ToplamKdv, double _GenelToplam, double _KomisyonTutar, double _KargoPayi, double _Toplam, int _IndirimKomisyonID, string _IndirimKomisyonAdi, int _KargoFirmaID, int _ParaBirimID, int _OdemeSekliID)
                {
                    _KullaniciID = KullaniciID;
                    _SiparisDurumID = SiparisDurumID; //bu ne?
                    _SepetID = SepetID;
                    _KargoAdresID = KargoAdresID;
                    _FaturaAdresID = FaturaAdresID;
                    _VergiBilgiID = VergiBilgiID;
                    _IndirimID = IndirimID;
                    _Tutar = Tutar;
                    _IndirimTutar = IndirimTutar;
                    _ToplamTutar = ToplamTutar;
                    _ToplamKdv = ToplamKdv;
                    _GenelToplam = GenelToplam;
                    _KomisyonTutar = KomisyonTutar;
                    _KargoPayi = KargoPayi;
                    _Toplam = Toplam;
                    _KargoFirmaID = KargoFirmaID;
                    _IndirimKomisyonID = IndirimKomisyonID;
                    _IndirimKomisyonAdi = IndirimKomisyonAdi;
                    _ParaBirimID = ParaBirimID;
                    _OdemeSekliID = OdemeSekliID;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Sepet()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class Kargo : IDisposable
            {
                public int KullaniciID { get; set; }
                public int En { get; set; }
                public int Boy { get; set; }
                public int Yukseklik { get; set; }
                public double Desi { get; set; }
                public double Kg { get; set; }
                public int HesaplamaID { get; set; }
                public Kargo() { }
                public Kargo(int _KullaniciID, int _En, int _Boy, int _Yukseklik, double _Desi, double _Kg, int _HesaplamaID)
                {
                    _KullaniciID = KullaniciID;
                    _En = En;
                    _Boy = Boy;
                    _Yukseklik = Yukseklik;
                    _Desi = Desi;
                    _Kg = Kg;
                    _HesaplamaID = HesaplamaID;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Kargo()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Kredi kartı bilgileri içeren obje
            /// </summary>
            /*
             * Create FÜ - 10.08.2012
             * Edit FÜ - 12.08.2012 18:20 Banka ID alanı için summary kısmı eklendi.
             */
            [Serializable]
            public class KrediKart : IDisposable
            {
                /// <summary>
                /// Listeden seçilen Banka ID (kullanıcının seçtiği banka ID)
                /// </summary>
                /*
                 * Create FÜ - 00.00.0000 - 00.00
                 * Edit FÜ - 14.08.2012 - 03:05 - Kart 3D Secure destekliyorsa olayı için TDSecure alanı eklendi.
                 * Edit FÜ - 03.12.2012 - 03:40 OdemeBilgileri kaldırıldı.
                 */
                public int BankaID { get; set; }
                public string AdSoyad { get; set; }
                public string KartNo { get; set; }
                public string SonKullanim { get; set; }
                public string CVC { get; set; }
                public SHOPClass.Sabitler.KartTipi KartTipi { get; set; }
                public bool TDSecure { get; set; }
                public KrediKart() { }
                public KrediKart(int _BankaID, string _AdSoyad, string _KartNo, string _SonKullanim, string _CVC, SHOPClass.Sabitler.KartTipi _KartTipi, bool _TDSecure)
                {
                    _BankaID = BankaID;
                    _AdSoyad = AdSoyad;
                    _KartNo = KartNo;
                    _SonKullanim = SonKullanim;
                    _CVC = CVC;
                    _KartTipi = KartTipi;
                    _TDSecure = TDSecure;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~KrediKart()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class BankaHavalesi : IDisposable
            {
                public int HesapNoID { get; set; }
                public BankaHavalesi() { }
                public BankaHavalesi(int _HesapNoID)
                {
                    _HesapNoID = HesapNoID;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~BankaHavalesi()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Kredi kartı ile ödeme yapmak için kredi kartı ve ödeme bilgilerini tutan obje
            /// </summary>
            /*
             * Create FÜ - 09.09.2012 20:52 
             * Edit FÜ - 16.09.2012 15:13 POSID eklendi.
             */
            /*[Serializable]
            public class KrediKartiIleOdeme : IDisposable
            {
                public int POSID { get; set; }
                public int KullaniciID { get; set; }
                public KrediKart KK { get; set; }
                public OdemeBilgileri OB { get; set; }
                public KrediKartiIleOdeme() { }
                public KrediKartiIleOdeme(int _POSID, int _KullaniciID, SHOPObjeler.Tanimlar.KrediKart _KK, SHOPObjeler.Tanimlar.OdemeBilgileri _OB)
                {
                    _POSID = POSID;
                    _KullaniciID = KullaniciID;
                    _KK = KK;
                    _OB = OB;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~KrediKartiIleOdeme()
                {
                    Dispose(false);
                }
                #endregion
            }*/

            /// <summary>
            /// Veritabanından gelen POS bilgileri atmak için kullanılan obje
            /// </summary>
            /*
             * Create FÜ - 10.08.2012
             * Edit FÜ - 12.08.2012 01:34 KampanyaKodu eklendi.
             * Edit FÜ - 12.08.2012 17:24 Para birimleri eklendi.
             * Edit FÜ - 14.08.2012 03:07 XmlURL ve TDSecureHataURL eklendi.
             * Edit FÜ - 16.09.2012 04:07 Pesin alanı, POSBankalar ve POSParaBirimleri Class ı eklendi.
             * Edit FÜ - 30.09.2012 17:20 VadeKontrol eklendi.
             * Edit FÜ - 30.09.2012 23:43 Kod ID eklendi.
             */
            [Serializable]
            public class POS : IDisposable
            {
                public int ID { get; set; }
                public int KodID { get; set; }
                public List<POSBankalar> Bankalar { get; set; }
                public List<POSParaBirimleri> ParaBirimleri { get; set; }
                public string MID { get; set; }
                public string TID { get; set; }
                public string PosNo { get; set; }
                public string URL { get; set; }
                public string XmlURL { get; set; }
                public bool TDSecure { get; set; }
                public string TDSecureKey { get; set; }
                public string TDSecureURL { get; set; }
                public string TDSecureGeriDonusURL { get; set; }
                public string TDSecureHataURL { get; set; }
                public bool OnOtorizasyon { get; set; }
                public bool Test { get; set; }
                public string TestURL { get; set; }
                public bool Pesin { get; set; }
                public bool SifirKomisyon { get; set; }
                public bool PuanKullanim { get; set; }
                public bool VadeKontrol { get; set; }
                public string KampanyaKodu { get; set; }
                public POS() { }
                public POS(int _ID, int _KodID, List<POSBankalar> _Bankalar, List<POSParaBirimleri> _ParaBirimleri, string _MID, string _TID, string _PosNo, string _URL, string _XmlURL, bool _TDSecure, string _TDSecureKey, string _TDSecureURL, string _TDSecureGeriDonusURL, string _TDSecureHataURL, bool _OnOtorizasyon, bool _Test, string _TestURL, bool _Pesin, bool _SifirKomisyon, bool _PuanKullanim, bool _VadeKontrol, string _KampanyaKodu)
                {
                    _ID = ID;
                    _KodID = KodID;
                    _Bankalar = Bankalar;
                    _ParaBirimleri = ParaBirimleri;
                    _MID = MID;
                    _TID = TID;
                    _PosNo = PosNo;
                    _URL = URL;
                    _XmlURL = XmlURL;
                    _TDSecure = TDSecure;
                    _TDSecureKey = TDSecureKey;
                    _TDSecureURL = TDSecureURL;
                    _TDSecureGeriDonusURL = TDSecureGeriDonusURL;
                    _TDSecureHataURL = TDSecureHataURL;
                    _OnOtorizasyon = OnOtorizasyon;
                    _Test = Test;
                    _TestURL = TestURL;
                    _Pesin = Pesin;
                    _SifirKomisyon = SifirKomisyon;
                    _PuanKullanim = PuanKullanim;
                    _VadeKontrol = VadeKontrol;
                    _KampanyaKodu = KampanyaKodu;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~POS()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Sanal POS 'a Ait Banka ve Bin Kontrol Bilgilerini Tutuyor
            /// </summary>
            /*
             * Create FÜ - 16.09.2012 02:53
             */
            [Serializable]
            public class POSBankalar : IDisposable
            {
                public int SanalPOSID { get; set; }
                public int BankaID { get; set; }
                public bool AnaBanka { get; set; }
                public bool BinKontrol { get; set; }
                public POSBankalar() { }
                public POSBankalar(int _SanalPOSID, int _BankaID, bool _AnaBanka, bool _BinKontrol)
                {
                    _SanalPOSID = SanalPOSID;
                    _BankaID = BankaID;
                    _AnaBanka = AnaBanka;
                    _BinKontrol = BinKontrol;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~POSBankalar()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Sanal POS 'a Ait Para Birimi Bilgilerini Tutuyor
            /// </summary>
            /*
             * Create FÜ - 16.09.2012 04:02
             */
            [Serializable]
            public class POSParaBirimleri : IDisposable
            {
                public int SanalPOSID { get; set; }
                public int ParaBirimID { get; set; }
                public string Kisaltma { get; set; }
                public POSParaBirimleri() { }
                public POSParaBirimleri(int _SanalPOSID, int _ParaBirimID, string _Kisaltma)
                {
                    _SanalPOSID = SanalPOSID;
                    _ParaBirimID = ParaBirimID;
                    _Kisaltma = Kisaltma;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~POSParaBirimleri()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// 3D POS Bilgilerini Tutuyor
            /// </summary>
            /*
             * Create FÜ - 14.08.2012 - 02:50
             */
            [Serializable]
            public class POS3D : IDisposable
            {
                POS POSClass { get; set; }
                public string Data1 { get; set; }
                public string Data2 { get; set; }
                public string Digest { get; set; }
                public string NewWindow { get; set; }
                public POS3D() { }
                public POS3D(POS _POSClass, string _Data1, string _Data2, string _Digest, string _NewWindow)
                {
                    _POSClass = POSClass;
                    _Data1 = Data1;
                    _Data2 = Data2;
                    _Digest = Digest;
                    _NewWindow = NewWindow;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~POS3D()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// POS işlemi sonucunda dönen bilgileri içeren obje
            /// -   (Created By Fatih ÜNAL - 10.08.2012)
            /// </summary>
            [Serializable]
            public class POSIslem : IDisposable
            {
                public string DurumKodu { get; set; }
                public string OnayKodu { get; set; }
                public string ReferansNumarasi { get; set; }
                public string KullanilabilirToplamPuan { get; set; }
                public string KullanilabilirToplamPuanTutari { get; set; }
                public string KazanilanToplamPuan { get; set; }
                public string KazanilanToplamPuanTutari { get; set; }
                public string TaksitSayisi { get; set; }
                public string TaksitTutari { get; set; }
                public string VadeTutari { get; set; }
                public string VadeOrani { get; set; }
                public string VadeGunSayisi { get; set; }
                public string HataMesajiKodu { get; set; }
                public string HataMesaji { get; set; }
                public POSIslem() { }
                public POSIslem(string _DurumKodu, string _OnayKodu, string _ReferansNumarasi, string _KullanilabilirToplamPuan, string _KullanilabilirToplamPuanTutari, string _KazanilanToplamPuan, string _KazanilanToplamPuanTutari, string _TaksitSayisi, string _TaksitTutari, string _VadeTutari, string _VadeOrani, string _VadeGunSayisi, string _HataMesajiKodu, string _HataMesaji)
                {
                    _DurumKodu = DurumKodu;
                    _OnayKodu = OnayKodu;
                    _ReferansNumarasi = ReferansNumarasi;
                    _KullanilabilirToplamPuan = KullanilabilirToplamPuan;
                    _KullanilabilirToplamPuanTutari = KullanilabilirToplamPuanTutari;
                    _KazanilanToplamPuan = KazanilanToplamPuan;
                    _KazanilanToplamPuanTutari = KazanilanToplamPuanTutari;
                    _TaksitSayisi = TaksitSayisi;
                    _TaksitTutari = TaksitTutari;
                    _VadeTutari = VadeTutari;
                    _VadeOrani = VadeOrani;
                    _VadeGunSayisi = VadeGunSayisi;
                    _HataMesajiKodu = HataMesajiKodu;
                    _HataMesaji = HataMesaji;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~POSIslem()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Karttan geçilecek ödeme bilgilerini tutan obje
            /// </summary>
            /*
             * Create FÜ - 12.08.2012 03:42
             * Edit FÜ - 06.10.2012 12:52 Puan Tutarı Eklendi.
             * Edit FÜ - 03.12.2012 03:08 OranID eklendi.
             */
            [Serializable]
            public class KKOdemeBilgileri : IDisposable
            {
                public int POSID { get; set; }
                public int OranID { get; set; }
                public double Tutar { get; set; }
                public double Puan { get; set; }
                public bool PuanKullan { get; set; }
                public int ParaBirimiID { get; set; }
                public int Taksit { get; set; }
                public KKOdemeBilgileri() { }
                public KKOdemeBilgileri(int _POSID, int _OranID, double _Tutar, double _Puan, bool _PuanKullan, int _ParaBirimiID, int _Taksit)
                {
                    _POSID = POSID;
                    _OranID = OranID;
                    _Tutar = Tutar;
                    _Puan = Puan;
                    _PuanKullan = PuanKullan;
                    _ParaBirimiID = ParaBirimiID;
                    _Taksit = Taksit;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~KKOdemeBilgileri()
                {
                    Dispose(false);
                }
                #endregion
            }

            #region Genel olarak kullanılabilecek statik değişken, mesela kredi kartı adımınlarındaki gibi
            public class Secim : IDisposable
            {
                public string Tanim { get; set; }
                public int KullaniciID { get; set; }
                public bool Deger;
                public Secim() { }
                public Secim(string _Tanim, int _KullaniciID, bool _Deger)
                {
                    _Tanim = Tanim;
                    _KullaniciID = KullaniciID;
                    _Deger = Deger;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Secim()
                {
                    Dispose(false);
                }
                #endregion
            }
            #endregion

            /// <summary>
            /// Para birim bilgilerini tutan obje
            /// </summary>
            /*
             * Create HY 23.08.2012 13:20
            */
            [Serializable]
            public class ParaBirim : IDisposable
            {
                public int ID { get; set; }
                public string Ad { get; set; }
                public string Kisaltma { get; set; }
                public string Simge { get; set; }
                public int Uzunluk { get; set; }
                public bool SabitKur { get; set; }
                public bool HesaplamaTip { get; set; }
                public int HesaplamaBirim { get; set; }
                public double? Kur { get; set; }
                public ParaBirim() { }
                public ParaBirim(int _ID, string _Ad, string _Kisaltma, string _Simge, int _Uzunluk, bool _SabitKur, bool _HesaplamaTip, int _HesaplamaBirim, double? _Kur)
                {
                    _ID = ID;
                    _Ad = Ad;
                    _Kisaltma = Kisaltma;
                    _Simge = Simge;
                    _Uzunluk = Uzunluk;
                    _SabitKur = SabitKur;
                    _HesaplamaTip = HesaplamaTip;
                    _HesaplamaBirim = HesaplamaBirim;
                    _Kur = Kur;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~ParaBirim()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// KDV bilgilerini tutan obje
            /// </summary>
            /*
             * Create HY 24.08.2012 17:01
             */
            [Serializable]
            public class KDV : IDisposable
            {
                public int ID { get; set; }
                public string Ad { get; set; }
                public float? Yuzde { get; set; }
                public int Sira { get; set; }
                public KDV() { }
                public KDV(int _ID, string _Ad, float? _Yuzde, int _Sira)
                {
                    _ID = ID;
                    _Ad = Ad;
                    _Yuzde = Yuzde;
                    _Sira = Sira;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~KDV()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Banka bilgilerini tutan obje
            /// </summary>
            /*
             * Create HY 25.08.2012 13:06
             */
            [Serializable]
            public class Banka : IDisposable
            {
                public int ID { get; set; }
                public string Ad { get; set; }
                public string Marka { get; set; }
                public string Ikon { get; set; }
                public string Renk { get; set; }
                public Banka() { }
                public Banka(int _ID, string _Ad, string _Marka, string _Ikon, string _Renk)
                {
                    _ID = ID;
                    _Ad = Ad;
                    _Marka = Marka;
                    _Ikon = Ikon;
                    _Renk = Renk;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Banka()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Kargo firma bilgilerini tutan obje
            /// </summary>
            /*
             * Create HY 27.08.2012 13:25
             */
            [Serializable]
            public class KargoFirma : IDisposable
            {
                public int ID { get; set; }
                public bool Tip { get; set; }
                public string Ad { get; set; }
                public string Ikon { get; set; }
                public string Url { get; set; }
                public double? KmBirimFiyat { get; set; }
                public double? DesiBirimFiyat { get; set; }
                public double? SabitFiyat { get; set; }
                public double? UcretsizFiyat { get; set; }
                public float? UcretsizDesi { get; set; }
                public KargoFirma() { }
                public KargoFirma(int _ID, bool _Tip, string _Ad, string _Ikon, string _Url, double? _KmBirimFiyat, double? _DesiBirimFiyat, double? _SabitFiyat, double? _UcretsizFiyat, float? _UcretsizDesi)
                {
                    _ID = ID;
                    _Tip = Tip;
                    _Ad = Ad;
                    _Ikon = Ikon;
                    _Url = Url;
                    _KmBirimFiyat = KmBirimFiyat;
                    _DesiBirimFiyat = DesiBirimFiyat;
                    _SabitFiyat = SabitFiyat;
                    _UcretsizFiyat = UcretsizFiyat;
                    _UcretsizDesi = UcretsizDesi;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~KargoFirma()
                {
                    Dispose(false);
                }
                #endregion
            }

            public enum IndirimKomisyonTipleri
            {
                IndirimliFiyat,
                KomisyonluFiyat,
                YuzdeMiktari,
                KomisyonAyir,
                IndirimAyir,
                Fiyat
            }

            public enum DovizKuruTipleri
            {
                Alis,
                Satis,
                EfektifAlis,
                EfektifSatis
            }

            [Serializable]
            public class Urun : IDisposable
            {
                public int ID { get; set; }
                public string BirimFiyat { get; set; }
                public int ParaBirimiID { get; set; }
                public string IndirimTutari { get; set; }
                public string KDVTutari { get; set; }
                public int Adet { get; set; }
                public string ToplamFiyat { get; set; }
                public Urun() { }
                public Urun(int _ID, string _BirimFiyat, int _ParaBirimiID, string _IndirimTutari, string _KDVTutari, int _Adet, string _ToplamFiyat)
                {
                    _ID = ID;
                    _BirimFiyat = BirimFiyat;
                    _ParaBirimiID = ParaBirimiID;
                    _IndirimTutari = IndirimTutari;
                    _KDVTutari = KDVTutari;
                    _Adet = Adet;
                    _ToplamFiyat = ToplamFiyat;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Urun()
                {
                    Dispose(false);
                }
                #endregion
            }

            public enum AdresTipleri
            {
                Fatura,
                Kargo
            }

            [Serializable]
            public class Fatura
            {
                public FaturaTipleri FaturaTipi { get; set; }
                public FaturaBireysel BireyselFaturaBilgileri { get; set; }
                public FaturaKurumsal KurumsalFaturaBilgileri { get; set; }
            }

            public enum FaturaTipleri
            {
                Bireysel,
                Kurumsal,
                Diger //Yabancılar İçin Kullanılabilir
            }

            [Serializable]
            public class FaturaKurumsal : IDisposable
            {
                public string FirmaUnvani { get; set; }
                public string VergiDaire { get; set; }
                public string VergiNo { get; set; }
                public FaturaKurumsal() { }
                public FaturaKurumsal(string _FirmaUnvani, string _VergiDaire, string _VergiNo)
                {
                    _FirmaUnvani = FirmaUnvani;
                    _VergiDaire = VergiDaire;
                    _VergiNo = VergiNo;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~FaturaKurumsal()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class FaturaBireysel : IDisposable
            {
                public string VergiDaire { get; set; }
                public string TcKimlikNo { get; set; }
                public FaturaBireysel() { }
                public FaturaBireysel(string _VergiDaire, string _TcKimlikNo)
                {
                    _VergiDaire = VergiDaire;
                    _TcKimlikNo = TcKimlikNo;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~FaturaBireysel()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class AdresBilgileri : IDisposable
            {
                public int UlkeID { get; set; }
                public string Ulke { get; set; }
                public string Eyalet { get; set; }
                public int IlID { get; set; }
                public string Il { get; set; }
                public int IlceID { get; set; }
                public string Ilce { get; set; }
                public string PostaKodu { get; set; }
                public string Adres { get; set; }
                public string AcikAdres { get; set; }
                public AdresBilgileri() { }
                public AdresBilgileri(int _UlkeID, string _Ulke, string _Eyalet, int _IlID, string _Il, int _IlceID, string _Ilce, string _PostaKodu, string _Adres, string _AcikAdres)
                {
                    _UlkeID = UlkeID;
                    _Ulke = Ulke;
                    _Eyalet = Eyalet;
                    _IlID = IlID;
                    _Il = Il;
                    _IlceID = IlceID;
                    _Ilce = Ilce;
                    _PostaKodu = PostaKodu;
                    _Adres = Adres;
                    _AcikAdres = AcikAdres;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~AdresBilgileri()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class Adres
            {
                public AdresTipleri AdresTipi { get; set; }
                public AdresBilgileri AdresBilgisi { get; set; }
                public Fatura FaturaBilgisi { get; set; }
            }

            public class Diller : IDisposable
            {
                public int ID { get; set; }
                public string Dil { get; set; }
                public Ulke UlkeID { get; set; }
                public string Kodlama { get; set; }
                public string Ikon { get; set; }
                public ParaBirim ParaBirimID { get; set; }
                public int Sira { get; set; }
                public bool AnaDil { get; set; }
                public bool Onay { get; set; }
                public Diller() { }
                public Diller(int _ID, string _Dil, Ulke _UlkeID, string _Kodlama, string _Ikon, ParaBirim _ParaBirimID, int _Sira, bool _AnaDil, bool _Onay)
                {
                    _ID = ID;
                    _Dil = Dil;
                    _UlkeID = UlkeID;
                    _Kodlama = Kodlama;
                    _Ikon = Ikon;
                    _ParaBirimID = ParaBirimID;
                    _Sira = Sira;
                    _AnaDil = AnaDil;
                    _Onay = Onay;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Diller()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Indirim : IDisposable
            {
                public int? ID { get; set; }
                public string Ad { get; set; }
                public float? Yuzde { get; set; }
                public bool? Onay { get; set; }
                public Indirim() { }
                public Indirim(int? _ID, string _Ad, float? _Yuzde, bool? _Onay)
                {
                    _ID = ID;
                    _Ad = Ad;
                    _Yuzde = Yuzde;
                    _Onay = Onay;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Indirim()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class IndirimKomisyon : IDisposable
            {
                public int ID { get; set; }
                public SHOPObjeler.Tanimlar.Genel OdemeSekliID { get; set; }
                public string Ad { get; set; }
                public float? Yuzde { get; set; }
                public bool? Tip { get; set; }
                public IndirimKomisyon() { }
                public IndirimKomisyon(int _ID, SHOPObjeler.Tanimlar.Genel _OdemeSekliID, string _Ad, float? _Yuzde, bool? _Tip)
                {
                    _ID = ID;
                    _OdemeSekliID = OdemeSekliID;
                    _Ad = Ad;
                    _Yuzde = Yuzde;
                    _Tip = Tip;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~IndirimKomisyon()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class UyelikMetotAyar : IDisposable
            {
                public int ID { get; set; }
                public SHOPObjeler.Tanimlar.Genel UyelikMetotID { get; set; }
                public string AppID { get; set; }
                public string AppKey { get; set; }
                public string EkAlan1 { get; set; }
                public string EkAlan2 { get; set; }
                public UyelikMetotAyar() { }
                public UyelikMetotAyar(int _ID, SHOPObjeler.Tanimlar.Genel _UyelikMetotID, string _AppID, string _AppKey, string _EkAlan1, string _EkAlan2)
                {
                    _ID = ID;
                    _UyelikMetotID = UyelikMetotID;
                    _AppID = AppID;
                    _AppKey = AppKey;
                    _EkAlan1 = EkAlan1;
                    _EkAlan2 = EkAlan2;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~UyelikMetotAyar()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Adresler : IDisposable
            {
                public int? ID { get; set; }
                public Kullanici Kullanici { get; set; } //KullanıcıID
                public bool Tip { get; set; }
                public string Baslik { get; set; }
                public Ulke UlkeID { get; set; } //UlkeID
                public string Eyalet { get; set; }
                public string Il { get; set; }
                public UlkeIl IlID { get; set; } //IlID
                public string Ilce { get; set; }
                public UlkeIlce IlceID { get; set; } //IlceID
                public string PostaKodu { get; set; }
                public string Adres { get; set; }
                public string AcikAdres { get; set; }
                public VergiBilgiler VergiBilgi { get; set; }
                public Adresler() { }
                public Adresler(int? _ID, Kullanici _Kullanici, bool _Tip, string _Baslik, Ulke _UlkeID, string _Eyalet, string _Il, UlkeIl _IlID, string _Ilce, UlkeIlce _IlceID, string _PostaKodu, string _Adres, string _AcikAdres, VergiBilgiler _VergiBilgi)
                {
                    _ID = ID;
                    _Kullanici = Kullanici;
                    _Tip = Tip;
                    _Baslik = Baslik;
                    _UlkeID = UlkeID;
                    _Eyalet = Eyalet;
                    _Il = Il;
                    _IlID = IlID;
                    _Ilce = Ilce;
                    _IlceID = IlceID;
                    _PostaKodu = PostaKodu;
                    _Adres = Adres;
                    _AcikAdres = AcikAdres;
                    _VergiBilgi = VergiBilgi;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Adresler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class VergiBilgiler : IDisposable
            {
                public int ID { get; set; }
                public Kullanici Kullanici { get; set; } //KullanıcıID
                public int? AdresID { get; set; } //AdresID
                public bool Tip { get; set; }
                public string Firma { get; set; }
                public string VergiDairesi { get; set; }
                public string VergiNo { get; set; }
                public string TcKimlikNo { get; set; }
                public VergiBilgiler() { }
                public VergiBilgiler(int _ID, Kullanici _Kullanici, int? _AdresID, bool _Tip, string _Firma, string _VergiDairesi, string _VergiNo, string _TcKimlikNo)
                {
                    _ID = ID;
                    _Kullanici = Kullanici;
                    _AdresID = AdresID;
                    _Tip = Tip;
                    _Firma = Firma;
                    _VergiDairesi = VergiDairesi;
                    _VergiNo = VergiNo;
                    _TcKimlikNo = TcKimlikNo;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~VergiBilgiler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Sepetler : IDisposable
            {
                public int ID { get; set; }
                public string SessionID { get; set; }
                public Kullanici Kullanici { get; set; } //KullanıcıID
                public int UrunID { get; set; } //Ürün classına birleştirilecek
                public int Adet { get; set; }
                public bool Durum { get; set; }
                public Sepetler() { }
                public Sepetler(int _ID, string _SessionID, Kullanici _Kullanici, int _UrunID, int _Adet, bool _Durum)
                {
                    _ID = ID;
                    _SessionID = SessionID;
                    _Kullanici = Kullanici;
                    _UrunID = UrunID;
                    _Adet = Adet;
                    _Durum = Durum;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Sepetler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Siparisler : IDisposable
            {
                public int ID { get; set; }
                public Kullanici Kullanici { get; set; }
                public string No { get; set; }
                public CpySiparislerKullanicilarAdresler KargoAdresID { get; set; } //Cpy kargo adres ID
                public CpySiparislerKullanicilarAdresler FaturaAdresID { get; set; } //Cpy fatura adres ID
                public CpySiparislerKullanicilarVergiBilgiler VergiBilgilerID { get; set; } //Cpy vergi bilgileri ID
                public double? Tutar { get; set; }
                public double? IndirimTutari { get; set; }
                public double? ToplamTutar { get; set; }
                public double? ToplamKdv { get; set; }
                public double? GenelToplam { get; set; }
                public CpyIndirimlerKomisyonlar IndirimKomisyonID { get; set; } //Cpy indirim komisyon ID
                public double? KomisyonTutari { get; set; }
                public double? KargoPayi { get; set; }
                public double? PuanTutari { get; set; }
                public double? Toplam { get; set; }
                public ParaBirim ParaBirimID { get; set; } //ParaBirimID
                public int OdemeSekliID { get; set; } //Odeme sekli classına birleşecek
                public DateTime? KurTarih { get; set; }
                public Siparisler() { }
                public Siparisler(int _ID, Kullanici _Kullanici, string _No, CpySiparislerKullanicilarAdresler _KargoAdresID, CpySiparislerKullanicilarAdresler _FaturaAdresID, CpySiparislerKullanicilarVergiBilgiler _VergiBilgilerID, double? _Tutar, double? _IndirimTutari, double? _ToplamTutar, double? _ToplamKdv, double? _GenelToplam, CpyIndirimlerKomisyonlar _IndirimKomisyonID, double? _KomisyonTutari, double? _KargoPayi, double? _PuanTutari, double? _Toplam, ParaBirim _ParaBirimID, int _OdemeSekliID, DateTime? _KurTarih)
                {
                    _ID = ID;
                    _Kullanici = Kullanici;
                    _No = No;
                    _KargoAdresID = KargoAdresID;
                    _FaturaAdresID = FaturaAdresID;
                    _VergiBilgilerID = VergiBilgilerID;
                    _Tutar = Tutar;
                    _IndirimTutari = IndirimTutari;
                    _ToplamTutar = ToplamTutar;
                    _ToplamKdv = ToplamKdv;
                    _GenelToplam = GenelToplam;
                    _IndirimKomisyonID = IndirimKomisyonID;
                    _KomisyonTutari = KomisyonTutari;
                    _KargoPayi = KargoPayi;
                    _PuanTutari = PuanTutari;
                    _Toplam = Toplam;
                    _ParaBirimID = ParaBirimID;
                    _OdemeSekliID = OdemeSekliID;
                    _KurTarih = KurTarih;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Siparisler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class OdemeBildirimler : IDisposable
            {
                public int ID { get; set; }
                public Kullanici Kullanici { get; set; }
                public Siparisler Siparisler { get; set; } //SiparisID
                public int OdemeBildirimlerHesapNoID { get; set; } //Cpy ödeme bilgileri classı ile birleşecek
                public int Tip { get; set; }
                public string IslemNo { get; set; }
                public DateTime OdemeTarih { get; set; }
                public double Tutar { get; set; }
                public ParaBirim ParaBirimID { get; set; } //Para birim classı birleşecek
                public DateTime Tarih { get; set; }
                public OdemeBildirimler() { }
                public OdemeBildirimler(int _ID, Kullanici _Kullanici, Siparisler _Siparisler, int _OdemeBildirimlerHesapNoID, int _Tip, string _IslemNo, DateTime _OdemeTarih, double _Tutar, ParaBirim _ParaBirimID, DateTime _Tarih)
                {
                    _ID = ID;
                    _Kullanici = Kullanici;
                    _Siparisler = Siparisler;
                    _OdemeBildirimlerHesapNoID = OdemeBildirimlerHesapNoID;
                    _Tip = Tip;
                    _IslemNo = IslemNo;
                    _OdemeTarih = OdemeTarih;
                    _Tutar = Tutar;
                    _ParaBirimID = ParaBirimID;
                    _Tarih = Tarih;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~OdemeBildirimler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class SiparislerOdemelerKK : IDisposable
            {
                public int ID { get; set; }
                public Kullanici Kullanici { get; set; } //KullaniciID
                public Siparisler Siparisler { get; set; } //SiparisID
                public int BankaID { get; set; } //Banka classı ile birleşecek
                public int SanalPosID { get; set; } //Sanal pos classı ile birleşecek
                public int SanalPosOranlarID { get; set; } // Cpy pos oranlar class ile birleşecel
                public string AdSoyad { get; set; }
                public string KartNo { get; set; }
                public string IslemID { get; set; }
                public string OnayKodu { get; set; }
                public string ReferansKodu { get; set; }
                public DateTime Tarih { get; set; }
                public SiparislerOdemelerKK() { }
                public SiparislerOdemelerKK(int _ID, Kullanici _Kullanici, Siparisler _Siparisler, int _BankaID, int _SanalPosID, int _SanalPosOranlarID, string _AdSoyad, string _KartNo, string _IslemID, string _OnayKodu, string _ReferansKodu, DateTime _Tarih)
                {
                    _ID = ID;
                    _Kullanici = Kullanici;
                    _Siparisler = Siparisler;
                    _BankaID = BankaID;
                    _SanalPosID = SanalPosID;
                    _SanalPosOranlarID = SanalPosOranlarID;
                    _AdSoyad = AdSoyad;
                    _KartNo = KartNo;
                    _IslemID = IslemID;
                    _OnayKodu = OnayKodu;
                    _ReferansKodu = ReferansKodu;
                    _Tarih = Tarih;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~SiparislerOdemelerKK()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class SiparislerDurumlar : IDisposable
            {
                public int ID { get; set; }
                public Kullanici Kullanici { get; set; } //KullaniciID
                public Siparisler Siparisler { get; set; } //SiparisID
                public int SiparisDurumID { get; set; } //Siparis durum classı ile birleşecek
                public DateTime Tarih { get; set; }
                public SiparislerDurumlar() { }
                public SiparislerDurumlar(int _ID, Kullanici _Kullanici, Siparisler _Siparisler, int _SiparisDurumID, DateTime _Tarih)
                {
                    _ID = ID;
                    _Kullanici = Kullanici;
                    _Siparisler = Siparisler;
                    _SiparisDurumID = SiparisDurumID;
                    _Tarih = Tarih;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~SiparislerDurumlar()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class CpyIndirimlerKomisyonlar : IDisposable
            {
                public int? ID { get; set; }
                public IndirimKomisyon IndirimKomisyonID { get; set; }
                public int OdemeSekliID { get; set; }
                public string Ad { get; set; }
                public float Yuzde { get; set; }
                public bool Tip { get; set; }
                public CpyIndirimlerKomisyonlar() { }
                public CpyIndirimlerKomisyonlar(int? _ID, IndirimKomisyon _IndirimKomisyonID, int _OdemeSekliID, string _Ad, float _Yuzde, bool _Tip)
                {
                    _ID = ID;
                    _IndirimKomisyonID = IndirimKomisyonID;
                    _OdemeSekliID = OdemeSekliID;
                    _Ad = Ad;
                    _Yuzde = Yuzde;
                    _Tip = Tip;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~CpyIndirimlerKomisyonlar()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class CpySiparislerKullanicilarAdresler : IDisposable
            {
                public int ID { get; set; }
                public Adresler Adresler { get; set; } //AdresID
                public Kullanici Kullanici { get; set; } //KullanıcıID
                public bool Tip { get; set; }
                public string Baslik { get; set; }
                public Ulke UlkeID { get; set; } //UlkeID
                public string Eyalet { get; set; }
                public string Il { get; set; }
                public UlkeIl IlID { get; set; } //IlID
                public string Ilce { get; set; }
                public UlkeIlce IlceID { get; set; } //IlceID
                public string PostaKodu { get; set; }
                public string Adres { get; set; }
                public string AcikAdres { get; set; }
                public CpySiparislerKullanicilarAdresler() { }
                public CpySiparislerKullanicilarAdresler(int _ID, Adresler _Adresler, Kullanici _Kullanici, bool _Tip, string _Baslik, Ulke _UlkeID, string _Eyalet, string _Il, UlkeIl _IlID, string _Ilce, UlkeIlce _IlceID, string _PostaKodu, string _Adres, string _AcikAdres)
                {
                    _ID = ID;
                    _Adresler = Adresler;
                    _Kullanici = Kullanici;
                    _Tip = Tip;
                    _Baslik = Baslik;
                    _UlkeID = UlkeID;
                    _Eyalet = Eyalet;
                    _Il = Il;
                    _IlID = IlID;
                    _Ilce = Ilce;
                    _IlceID = IlceID;
                    _PostaKodu = PostaKodu;
                    _Adres = Adres;
                    _AcikAdres = AcikAdres;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~CpySiparislerKullanicilarAdresler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class CpySiparislerKullanicilarVergiBilgiler : IDisposable
            {
                public int? ID { get; set; }
                public VergiBilgiler VergiBilgiler { get; set; } //Vergi Bilgi ID
                public Kullanici Kullanici { get; set; } //KullanıcıID
                public Adresler Adresler { get; set; } //AdresID
                public bool Tip { get; set; }
                public string VergiDairesi { get; set; }
                public string VergiNo { get; set; }
                public string TcKimlikNo { get; set; }
                public CpySiparislerKullanicilarVergiBilgiler() { }
                public CpySiparislerKullanicilarVergiBilgiler(int? _ID, VergiBilgiler _VergiBilgiler, Kullanici _Kullanici, Adresler _Adresler, bool _Tip, string _VergiDairesi, string _VergiNo, string _TcKimlikNo)
                {
                    _ID = ID;
                    _VergiBilgiler = VergiBilgiler;
                    _Kullanici = Kullanici;
                    _Adresler = Adresler;
                    _Tip = Tip;
                    _VergiDairesi = VergiDairesi;
                    _VergiNo = VergiNo;
                    _TcKimlikNo = TcKimlikNo;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~CpySiparislerKullanicilarVergiBilgiler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Bolge : IDisposable
            {
                public int ID { get; set; }
                public string Ad { get; set; }
                public Bolge() { }
                public Bolge(int _ID, string _Ad)
                {
                    _ID = ID;
                    _Ad = Ad;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Bolge()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Ulke : IDisposable
            {
                public int? ID { get; set; }
                public Bolge Bolge { get; set; }
                public string Ad { get; set; }
                public string DilKisaltma { get; set; }
                public string Kisaltma { get; set; }
                public int? AlanKodu { get; set; }
                public Ulke() { }
                public Ulke(int? _ID, Bolge _Bolge, string _Ad, string _DilKisaltma, string _Kisaltma, int? _AlanKodu)
                {
                    _ID = ID;
                    _Bolge = Bolge;
                    _Ad = Ad;
                    _DilKisaltma = DilKisaltma;
                    _Kisaltma = Kisaltma;
                    _AlanKodu = AlanKodu;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Ulke()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class UlkeIlBolge : IDisposable
            {
                public int ID { get; set; }
                public Ulke Ulke { get; set; } //UlkeID
                public string Ad { get; set; }
                public UlkeIlBolge() { }
                public UlkeIlBolge(int _ID, Ulke _Ulke, string _Ad)
                {
                    _ID = ID;
                    _Ulke = Ulke;
                    _Ad = Ad;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~UlkeIlBolge()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class UlkeIl : IDisposable
            {
                public int? ID { get; set; }
                public Ulke Ulke { get; set; } //UlkeID
                public UlkeIlBolge UlkeIlBolge { get; set; } //IlBolgeID
                public string Ad { get; set; }
                public int? AlanKodu { get; set; }
                public string Plaka { get; set; }
                public UlkeIl() { }
                public UlkeIl(int? _ID, Ulke _Ulke, UlkeIlBolge _UlkeIlBolge, string _Ad, int? _AlanKodu, string _Plaka)
                {
                    _ID = ID;
                    _Ulke = Ulke;
                    _UlkeIlBolge = UlkeIlBolge;
                    _Ad = Ad;
                    _AlanKodu = AlanKodu;
                    _Plaka = Plaka;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~UlkeIl()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class UlkeIlce : IDisposable
            {
                public int? ID { get; set; }
                public UlkeIl UlkeIl { get; set; } //IlID
                public string Ad { get; set; }
                public bool Merkez { get; set; }
                public UlkeIlce() { }
                public UlkeIlce(int? _ID, UlkeIl _UlkeIl, string _Ad, bool _Merkez)
                {
                    _ID = ID;
                    _UlkeIl = UlkeIl;
                    _Ad = Ad;
                    _Merkez = Merkez;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~UlkeIlce()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Markalar : IDisposable
            {
                public int ID { get; set; }
                public string Ad { get; set; }
                public string Ikon { get; set; }
                public bool Onay { get; set; }
                public Markalar() { }
                public Markalar(int _ID, string _Ad, string _Ikon, bool _Onay)
                {
                    _ID = ID;
                    _Ad = Ad;
                    _Ikon = Ikon;
                    _Onay = Onay;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Markalar()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Sol ve sağ bloklardaki indirimli ürünler, en çok satılan ürünler kısımlar gibi yerlerde kullanılan json için obje
            /// </summary>
            /*
             * Create HY 12.10.2012 16:04
             */
            [Serializable]
            public class UrunDetaylar : IDisposable
            {
                public int ID { get; set; }
                public string UrunAd { get; set; }
                public string UrunKod { get; set; }
                public string ResimID { get; set; }
                public string Indirim { get; set; }
                public string Fiyat { get; set; }
                public string DovizFiyat { get; set; }
                public string DovizIndirimliFiyat { get; set; }
                public bool KDV { get; set; }
                public bool UcretizKargo { get; set; }
                public UrunDetaylar() { }
                public UrunDetaylar(int _ID, string _UrunAd, string _UrunKod, string _ResimID, string _Indirim, string _Fiyat, string _DovizFiyat, string _DovizIndirimliFiyat, bool _KDV, bool _UcretsizKargo)
                {
                    _ID = ID;
                    _UrunAd = UrunAd;
                    _UrunKod = UrunKod;
                    _ResimID = ResimID;
                    _Indirim = Indirim;
                    _Fiyat = Fiyat;
                    _DovizFiyat = DovizFiyat;
                    _DovizIndirimliFiyat = DovizIndirimliFiyat;
                    _KDV = KDV;
                    _UcretsizKargo = UcretizKargo;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~UrunDetaylar()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class Urunler : IDisposable
            {
                public int ID { get; set; }
                public Diller DilID { get; set; }
                public SHOPObjeler.Tanimlar.Genel KodID { get; set; }
                public int? ResimID { get; set; }
                public int? ResimKategoriID { get; set; }
                public int? VideoKategoriID { get; set; }
                public string Ad { get; set; }
                public string OnAciklama { get; set; }
                public string Aciklama { get; set; }
                public int? En { get; set; }
                public int? Boy { get; set; }
                public int? Yukseklik { get; set; }
                public float? Desi { get; set; }
                public float? Kg { get; set; }
                public double? Fiyat { get; set; }
                public ParaBirim ParaBirimID { get; set; }
                public SbtKdv KdvID { get; set; }
                public int KargoHesaplamaID { get; set; }
                public Indirim IndirimID { get; set; }
                public bool Stok { get; set; }
                public bool? Yeni { get; set; }
                public bool AnaSayfa { get; set; }
                public bool Onay { get; set; }
                public Urunler() { }
                public Urunler(int _ID, Diller _DilID, SHOPObjeler.Tanimlar.Genel _KodID, int? _ResimID, int? _ResimKategoriID, int? _VideoKategoriID, string _Ad, string _OnAciklama, string _Aciklama, int? _En, int? _Boy, int? _Yukseklik, float? _Desi, float? _Kg, double? _Fiyat, ParaBirim _ParaBirimID, SbtKdv _KdvID, int _KargoHesaplamaID, Indirim _IndirimID, bool _Stok, bool? _Yeni, bool _AnaSayfa, bool _Onay)
                {
                    _ID = ID;
                    _DilID = DilID;
                    _KodID = KodID;
                    _ResimID = ResimID;
                    _ResimKategoriID = ResimKategoriID;
                    _VideoKategoriID = VideoKategoriID;
                    _Ad = Ad;
                    _OnAciklama = OnAciklama;
                    _Aciklama = Aciklama;
                    _En = En;
                    _Boy = Boy;
                    _Yukseklik = Yukseklik;
                    _Desi = Desi;
                    _Kg = Kg;
                    _Fiyat = Fiyat;
                    _ParaBirimID = ParaBirimID;
                    _KdvID = KdvID;
                    _KargoHesaplamaID = KargoHesaplamaID;
                    _IndirimID = IndirimID;
                    _Stok = Stok;
                    _Yeni = Yeni;
                    _AnaSayfa = AnaSayfa;
                    _Onay = Onay;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~Urunler()
                {
                    Dispose(false);
                }
                #endregion
            }

            public class SbtKdv : IDisposable
            {
                public int? ID { get; set; }
                public string Ad { get; set; }
                public float Yuzde { get; set; }
                public SbtKdv() { }
                public SbtKdv(int? _ID, string _Ad, float _Yuzde)
                {
                    _ID = ID;
                    _Ad = Ad;
                    _Yuzde = Yuzde;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~SbtKdv()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// View pos bankalar taksit objesi
            /// </summary>
            /*
             * Create HY 24.09.2012 00:11
             * Edit FÜ 30.09.2012 23:02 Vade Kontrol ve Banka Onay eklendi.
            */
            public class ViewPosBankalarTaksit : IDisposable
            {
                public int SanalPosID { get; set; }
                public bool Test { get; set; }
                public bool Pesin { get; set; }
                public bool PuanKullanim { get; set; }
                public bool? Onay { get; set; }
                public int BankaID { get; set; }
                public bool AnaBanka { get; set; }
                public bool? BankaOnay { get; set; }
                public string Banka { get; set; }
                public bool BinKontrol { get; set; }
                public bool VadeKontrol { get; set; }
                public int Ay { get; set; }
                public float Oran { get; set; }
                public bool? OranOnay { get; set; }
                public ViewPosBankalarTaksit() { }
                public ViewPosBankalarTaksit(int _SanalPosID, bool _Test, bool _Pesin, bool _PuanKullanim, bool _VadeKontrol, bool? _Onay, int _BankaID, bool _AnaBanka, bool? _BankaOnay, string _Banka, bool _BinKontrol, int _Ay, float _Oran, bool? _OranOnay)
                {
                    _SanalPosID = SanalPosID;
                    _Test = Test;
                    _Pesin = Pesin;
                    _PuanKullanim = PuanKullanim;
                    _Onay = Onay;
                    _BankaID = BankaID;
                    _AnaBanka = AnaBanka;
                    _BankaOnay = BankaOnay;
                    _Banka = Banka;
                    _BinKontrol = BinKontrol;
                    _VadeKontrol = VadeKontrol;
                    _Ay = Ay;
                    _Oran = Oran;
                    _OranOnay = OranOnay;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~ViewPosBankalarTaksit()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Site ayarları objesi
            /// </summary>
            /*
             * Create HY 01.10.2012 16:10
            */
            public class SiteAyarlar : IDisposable
            {
                public int ID { get; set; }
                public bool Type { get; set; }
                public bool Mode { get; set; }
                public bool Www { get; set; }
                public bool RootYonlendir { get; set; }
                public string Url { get; set; }
                public float Bsmv { get; set; }
                public float Kkdf { get; set; }
                public bool Buton { get; set; }
                public bool Fiyat { get; set; }
                public bool Kdv { get; set; }
                public bool KdvFiyat { get; set; }
                public bool UyeKayit { get; set; }
                public bool Stok { get; set; }
                public bool Onay { get; set; }
                public SiteAyarlar() { }
                public SiteAyarlar(int _ID, bool _Type, bool _Mode, bool _Www, bool _RootYonlendir, string _Url, float _Bsmv, float _Kkdf, bool _Buton, bool _Fiyat, bool _Kdv, bool _KdvFiyat, bool _UyeKayit, bool _Stok, bool _Onay)
                {
                    _ID = ID;
                    _Type = Type;
                    _Mode = Mode;
                    _Www = Www;
                    _RootYonlendir = RootYonlendir;
                    _Url = Url;
                    _Bsmv = Bsmv;
                    _Kkdf = Kkdf;
                    _Buton = Buton;
                    _Fiyat = Fiyat;
                    _KdvFiyat = KdvFiyat;
                    _UyeKayit = UyeKayit;
                    _Stok = Stok;
                    _Onay = Onay;
                }

                #region DISPOSE
                protected virtual void Dispose(bool disposing)
                {
                    if (disposing)
                    {
                    }
                }

                public void Dispose()
                {
                    Dispose(true);
                    GC.SuppressFinalize(this);
                }

                ~SiteAyarlar()
                {
                    Dispose(false);
                }
                #endregion
            }
        }

        public class Sonuclar
        {
            public class Adres
            {
                public List<Tanimlar.Adresler> Adresler { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Adres() { }
                public Adres(List<Tanimlar.Adresler> _Adresler, Objeler.Tanimlar.Messages _Message)
                {
                    _Adresler = Adresler;
                    _Message = Message;
                }
            }

            public class VergiBilgi
            {
                public List<Tanimlar.VergiBilgiler> VergiBilgiler { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public VergiBilgi() { }
                public VergiBilgi(List<Tanimlar.VergiBilgiler> _VergiBilgiler, Objeler.Tanimlar.Messages _Message)
                {
                    _VergiBilgiler = VergiBilgiler;
                    _Message = Message;
                }
            }

            public class Kullanici
            {
                public List<Tanimlar.Kullanici> Kullanicilar { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Kullanici() { }
                public Kullanici(List<Tanimlar.Kullanici> _Kullanicilar, Objeler.Tanimlar.Messages _Message)
                {
                    _Kullanicilar = Kullanicilar;
                    _Message = Message;
                }
            }

            // Created HY 12.10.2012 16:04
            public class UrunDetay
            {
                public List<Tanimlar.UrunDetaylar> UrunDetaylar { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public UrunDetay() { }
                public UrunDetay(List<Tanimlar.UrunDetaylar> _UrunDetaylar, Objeler.Tanimlar.Messages _Message)
                {
                    _UrunDetaylar = UrunDetaylar;
                    _Message = Message;
                }
            }

            public class Urun
            {
                public List<Tanimlar.Urunler> Urunler { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Urun() { }
                public Urun(List<Tanimlar.Urunler> _Urunler, Objeler.Tanimlar.Messages _Message)
                {
                    _Urunler = Urunler;
                    _Message = Message;
                }
            }

            public class Indirim
            {
                public List<Tanimlar.Indirim> Indirimler { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Indirim() { }
                public Indirim(List<Tanimlar.Indirim> _Indirimler, Objeler.Tanimlar.Messages _Message)
                {
                    _Indirimler = Indirimler;
                    _Message = Message;
                }
            }

            public class IndirimKomisyon
            {
                public List<Tanimlar.IndirimKomisyon> IndirimKomisyonlar { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public IndirimKomisyon() { }
                public IndirimKomisyon(List<Tanimlar.IndirimKomisyon> _IndirimKomisyonlar, Objeler.Tanimlar.Messages _Message)
                {
                    _IndirimKomisyonlar = IndirimKomisyonlar;
                    _Message = Message;
                }
            }

            public class Kodlar
            {
                public List<Tanimlar.Genel> Kod { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Kodlar() { }
                public Kodlar(List<Tanimlar.Genel> _Kod, Objeler.Tanimlar.Messages _Message)
                {
                    _Kod = Kod;
                    _Message = Message;
                }
            }

            public class Dil
            {
                public List<Tanimlar.Diller> Diller { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Dil() { }
                public Dil(List<Tanimlar.Diller> _Diller, Objeler.Tanimlar.Messages _Message)
                {
                    _Diller = Diller;
                    _Message = Message;
                }
            }

            public class Marka
            {
                public List<Tanimlar.Markalar> Markalar { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Marka() { }
                public Marka(List<Tanimlar.Markalar> _Markalar, Objeler.Tanimlar.Messages _Message)
                {
                    _Markalar = Markalar;
                    _Message = Message;
                }
            }

            public class Siparis
            {
                public List<Tanimlar.Siparisler> Siparisler { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Siparis() { }
                public Siparis(List<Tanimlar.Siparisler> _Siparisler, Objeler.Tanimlar.Messages _Message)
                {
                    _Siparisler = Siparisler;
                    _Message = Message;
                }
            }

            [Serializable]
            public class Ulkeler
            {
                public List<Tanimlar.Ulke> Ulke { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public Ulkeler() { }
                public Ulkeler(List<Tanimlar.Ulke> _Ulke, Objeler.Tanimlar.Messages _Message)
                {
                    _Ulke = Ulke;
                    _Message = Message;
                }
            }

            [Serializable]
            public class UlkeIller
            {
                public List<Tanimlar.UlkeIl> Sehirler { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public UlkeIller() { }
                public UlkeIller(List<Tanimlar.UlkeIl> _Sehirler, Objeler.Tanimlar.Messages _Message)
                {
                    _Sehirler = Sehirler;
                    _Message = Message;
                }
            }

            // Create HY 22.09.2012 12:53
            [Serializable]
            public class UlkeIlceler
            {
                public List<Tanimlar.UlkeIlce> Ilceler { get; set; }
                public Objeler.Tanimlar.Messages Message { get; set; }
                public UlkeIlceler() { }
                public UlkeIlceler(List<Tanimlar.UlkeIlce> _Ilceler, Objeler.Tanimlar.Messages _Message)
                {
                    _Ilceler = Ilceler;
                    _Message = Message;
                }
            }
        }

        [Serializable]
        public class Listeler
        {
            public static List<Tanimlar.Kullanici> Kullanici = new List<Tanimlar.Kullanici>();
            public static List<Tanimlar.Sepet> Sepet = new List<Tanimlar.Sepet>();
            public static List<Tanimlar.Kargo> Kargo = new List<Tanimlar.Kargo>();
            public static List<Tanimlar.Secim> Secim = new List<Tanimlar.Secim>();
            /// <summary>
            /// Ödeme tiplerini tutan genel bir obje
            /// </summary>
            /*
            * Create FÜ 18.08.2012 01:08
            */
            public static List<Tanimlar.Genel> OdemeTipleri = new List<Tanimlar.Genel>();
            /// <summary>
            /// Session ve ID parametresi döndürecek tüm işlemler için yapılmış genel bir obje listesi
            /// </summary>
            /*
             * Create FÜ 18.08.2012 02:12
             */
            public static List<Tanimlar.SessionGenelID> SessionGenelID = new List<Tanimlar.SessionGenelID>();
            // Create HY 23.08.2012 13:20
            public static List<Tanimlar.ParaBirim> ParaBirim = new List<Tanimlar.ParaBirim>();
            // Create HY 24.08.2012 17:01
            public static List<Tanimlar.KDV> KDV = new List<Tanimlar.KDV>();
            // Create HY 25.08.2012 13:06
            public static List<Tanimlar.Banka> Banka = new List<Tanimlar.Banka>();
            // Create HY 27.08.2012 13:25
            public static List<Tanimlar.KargoFirma> KargoFirma = new List<Tanimlar.KargoFirma>();
            // Create FÜ 09.09.2012 20:55
            //public static Dictionary<string, Tanimlar.KrediKartiIleOdeme> KrediKartiIleOdeme = new Dictionary<string, Tanimlar.KrediKartiIleOdeme>();
            // Create FÜ 10.09.2012 00:05
            public static List<SHOPObjeler.Tanimlar.POS> POS = new List<Tanimlar.POS>();
            // Create HY 24.09.2012 00:25
            public static List<Tanimlar.ViewPosBankalarTaksit> ViewPosBankalarTaksit = new List<Tanimlar.ViewPosBankalarTaksit>();
            // Create HY 01.10.2012 16:16
            public static List<Tanimlar.SiteAyarlar> SiteAyar = new List<Tanimlar.SiteAyarlar>();

            /// <summary>
            /// Kullanıcı ID ve Sistemdeki Tanımlar, Bilgiler, Sepet vs.
            /// </summary>
            public static Dictionary<int, Tanimlar.Sistem> Sistem = new Dictionary<int, Tanimlar.Sistem>();
        }
    }
}