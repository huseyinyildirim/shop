using System;
using System.Collections.Generic;

namespace SHOP
{
    [Serializable]
    public class Objeler
    {
        [Serializable]
        public class Tanimlar
        {
            [Serializable]
            public class Diller : IDisposable
            {
                public string Dil { get; set; }
                public int ID { get; set; }
                public string Kisaltma { get; set; }
                public string Kodlama { get; set; }
                public string Ikon { get; set; }
                public int Sira { get; set; }
                public bool Onay { get; set; }
                public bool AnaDil { get; set; }
                public Diller() { }
                public Diller(string _Dil, int _ID, string _Kisaltma, string _Kodlama, string _Ikon, int _Sira, bool _Onay, bool _AnaDil)
                {
                    _Dil = Dil;
                    _ID = ID;
                    _Kisaltma = Kisaltma;
                    _Kodlama = Kodlama;
                    _Ikon = Ikon;
                    _Sira = Sira;
                    _Onay = Onay;
                    _AnaDil = AnaDil;
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

            [Serializable]
            public class Dil : IDisposable
            {
                public string SessionID { get; set; }
                public int DilID { get; set; }
                public string IP { get; set; }
                public DateTime Tarih { get; set; }
                public Dil() { }
                public Dil(string _SessionID, int _ID, DateTime _Tarih, string _IP)
                {
                    _SessionID = SessionID;
                    _ID = DilID;
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

                ~Dil()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class Admin : IDisposable
            {
                public string SessionID { get; set; }
                public int ID { get; set; }
                public bool Root { get; set; }
                public string IP { get; set; }
                public DateTime Tarih { get; set; }
                public Admin() { }
                public Admin(string _SessionID, int _ID, DateTime _Tarih, string _IP, bool _Root)
                {
                    _SessionID = SessionID;
                    _ID = ID;
                    _Tarih = Tarih;
                    _IP = IP;
                    _Root = Root;
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

                ~Admin()
                {
                    Dispose(false);
                }
                #endregion
            }

            [Serializable]
            public class Urun : IDisposable
            {
                public int kategori_id { get; set; }
                public int marka_id { get; set; }
                public string kod { get; set; }
                public string ad { get; set; }
                public string on_aciklama { get; set; }
                public Urun() { }
                public Urun(int _kategori_id, int _marka_id, string _kod, string _ad, string _on_aciklama)
                {
                    _kategori_id = kategori_id;
                    _marka_id = marka_id;
                    _kod = kod;
                    _ad = ad;
                    _on_aciklama = on_aciklama;
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

            /// <summary>
            /// Mesaj objesi
            /// -   (Created By Fatih ÜNAL - 10.08.2012)
            /// </summary>
            [Serializable]
            public class Messages
            {
                public Class.Sabitler.MessageTypes Type { get; set; }
                public string Header { get; set; }
                public string Text { get; set; }
            }

            /// <summary>
            /// Veritabanından gelen sabit textleri almak için kullanılan obje
            /// </summary>
            /*
             * Create HY 22.08.12 09:51
             */
            [Serializable]
            public class Sabit : IDisposable
            {
                public int ID { get; set; }
                public string Aciklama { get; set; }
                public string Sayfa { get; set; }
                public bool Shop { get; set; }
                public bool Xml { get; set; }
                public Sabit() { }
                public Sabit(int _ID, string _Aciklama, string _Sayfa, bool _Shop, bool _Xml)
                {
                    _ID = ID;
                    _Aciklama = Aciklama;
                    _Sayfa = Sayfa;
                    _Shop = Shop;
                    _Xml = Xml;
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

                ~Sabit()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Veritabanından gelen sabit textleri dil karşılıklarını almak için kullanılan obje
            /// </summary>
            /*
             * Create HY 22.08.12 10:00
             */
            [Serializable]
            public class Textler : IDisposable
            {
                Sabit SabitClass { get; set; }
                public int ID { get; set; }
                public int SabitID { get; set; }
                public string Text { get; set; }
                public Textler() { }
                public Textler(Sabit _SabitClass, int _ID, int _SabitID, string _Text)
                {
                    _SabitClass = SabitClass;
                    _ID = ID;
                    _SabitID = SabitID;
                    _Text = Text;
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

                ~Textler()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Firma bilgilerini almak için kullanılan obje
            /// </summary>
            /*
             * Create HY 23.08.12 11:29
            */
            [Serializable]
            public class Firma : IDisposable
            {
                public int ID { get; set; }
                public int UlkeID { get; set; }
                public string Ad { get; set; }
                public string Unvan { get; set; }
                public string Marka { get; set; }
                public string Domain { get; set; }
                public string Mail { get; set; }
                public string Description { get; set; }
                public string Title { get; set; }
                public string GoogleAnalytics { get; set; }
                public string GoogleDogrulamaKodu { get; set; }
                public string Flickr { get; set; }
                public string Youtube { get; set; }
                public string Vimeo { get; set; }
                public string Facebook { get; set; }
                public string GooglePlus { get; set; }
                public string Twitter { get; set; }
                public string Paypal { get; set; }
                public Firma() { }
                public Firma(int _ID, int _UlkeID, string _Ad, string _Unvan, string _Marka, string _Domain, string _Mail, string _Description, string _Title, string _GoogleAnalytics, string _GoogleDogrulamaKodu, string _Flickr, string _Youtube, string _Vimeo, string _Facebook, string _GooglePlus, string _Twitter, string _Paypal)
                {
                    _ID = ID;
                    _UlkeID = UlkeID;
                    _Ad = Ad;
                    _Unvan = Unvan;
                    _Marka = Marka;
                    _Domain = Domain;
                    _Mail = Mail;
                    _Description = Description;
                    _Title = Title;
                    _GoogleAnalytics = GoogleAnalytics;
                    _GoogleDogrulamaKodu = GoogleDogrulamaKodu;
                    _Flickr = Flickr;
                    _Youtube = Youtube;
                    _Vimeo = Vimeo;
                    _Facebook = Facebook;
                    _GooglePlus = GooglePlus;
                    _Twitter = Twitter;
                    _Paypal = Paypal;
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

                ~Firma()
                {
                    Dispose(false);
                }
                #endregion
            }

            /// <summary>
            /// Mail ayarlarını almak için kullanılan obje
            /// </summary>
            /*
             * Create HY 23.08.12 14:56
            */
            [Serializable]
            public class MailAyar : IDisposable
            {
                public int ID { get; set; }
                public string KullaniciAdi { get; set; }
                public string Sifre { get; set; }
                public string Host { get; set; }
                public string Port { get; set; }
                public MailAyar() { }
                public MailAyar(int _ID, string _KullaniciAdi, string _Sifre, string _Host, string _Port)
                {
                    _ID = ID;
                    _KullaniciAdi = KullaniciAdi;
                    _Sifre = Sifre;
                    _Host = Host;
                    _Port = Port;
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

                ~MailAyar()
                {
                    Dispose(false);
                }
                #endregion
            }
        }

        [Serializable]
        public class Listeler
        {
            public static List<Tanimlar.Diller> Diller = new List<Tanimlar.Diller>();
            public static List<Tanimlar.Dil> Dil = new List<Tanimlar.Dil>();
            public static List<Tanimlar.Admin> Admin = new List<Tanimlar.Admin>();
            // Create HY 22.08.12 09:51
            public static List<Tanimlar.Textler> Textler = new List<Tanimlar.Textler>();
            // Create HY 23.08.12 11:29
            public static List<Tanimlar.Firma> Firma = new List<Tanimlar.Firma>();
            // Create HY 23.08.12 14:56
            public static List<Tanimlar.MailAyar> MailAyar = new List<Tanimlar.MailAyar>();
        }
    }
}