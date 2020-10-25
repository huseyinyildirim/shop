using System;

namespace SHOP
{
    [Serializable]
    public class Kullanici
    {
        public int ID { get; set; }
        public Sepet Sepet { get; set; } 
        //kullanıcı ile alakalı diğer objeler adres vs. de burada olmalı.
        public SHOPClass.Sabitler.OdemeTipi OdemeTipi { get; set; }

        [Serializable]
        public class OdemeSekilleri
        {
            public Odeme.BankaHavalesi BankaHavalesi { get; set; }
            public Odeme.KrediKarti KrediKarti { get; set; }
            public Odeme.KapidaOdeme KapidaOdeme { get; set; }
            public Odeme.KapidaOdeme Paypal { get; set; }
            public Odeme.PTT PTT { get; set; }

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
        public int ID { get; set; }
        public Sepet() { }
        public Sepet(int _ID)
        {
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

        ~Sepet()
        {
            Dispose(false);
        }
        #endregion
    }

     [Serializable]
    public class Odeme
    {
        [Serializable]
        public class BankaHavalesi : IDisposable
        {
            public int ID { get; set; }
            public BankaHavalesi() { }
            public BankaHavalesi(int _ID)
            {
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

            ~BankaHavalesi()
            {
                Dispose(false);
            }
            #endregion
        }

        [Serializable]
        public class KrediKarti : IDisposable
        {
            public int ID { get; set; }
            public KrediKarti() { }
            public KrediKarti(int _ID)
            {
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

            ~KrediKarti()
            {
                Dispose(false);
            }
            #endregion
        }

        [Serializable]
        public class KapidaOdeme : IDisposable
        {
            public int ID { get; set; }
            public KapidaOdeme() { }
            public KapidaOdeme(int _ID)
            {
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

            ~KapidaOdeme()
            {
                Dispose(false);
            }
            #endregion
        }

        [Serializable]
        public class KapidaOdeme : IDisposable
        {
            public int ID { get; set; }
            public KapidaOdeme() { }
            public KapidaOdeme(int _ID)
            {
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

            ~KapidaOdeme()
            {
                Dispose(false);
            }
            #endregion
        }

        [Serializable]
        public class PTT : IDisposable
        {
            public int ID { get; set; }
            public PTT() { }
            public PTT(int _ID)
            {
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

            ~PTT()
            {
                Dispose(false);
            }
            #endregion
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

        ~Odemes()
        {
            Dispose(false);
        }
        #endregion
    }
}