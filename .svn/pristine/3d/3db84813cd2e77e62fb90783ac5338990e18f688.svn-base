using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Ext.Net;
using MySQLDataModel;

namespace SHOP.admin
{
    //02.09.2012
    //++ Bu class içindekilerin tamamı uygun bir yere taşınmalı.

    public class AdminClass
    {
        [Serializable]
        public class Resim
        {
            public int ID { get; set; }
            public string ResimAdi { get; set; }
            public string Yol { get; set; }
            public long Boyut { get; set; }
            public string Ad { get; set; }
            public string URL { get; set; }
            public Resim() { }
            public Resim(int _ID, string _ResimAdi, string _Yol, long _Boyut, string _Ad, string _URL)
            {
                _ID = ID;
                _ResimAdi = ResimAdi;
                _Yol = Yol;
                _Boyut = Boyut;
                _Ad = Ad;
                _URL = URL;
            }
        }

        public static void StoreDoldurDil(Store StoreAdi, bool TumDiller)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                IList SQL1 = (from p in db.tbl_diller
                              where p.onay == true
                              select
                              new
                              {
                                  p.id,
                                  p.dil
                              }).ToList();

                if (TumDiller)
                {
                    SQL1.Add(new { id = -1, dil = "TÜM DİLLER" });
                }

                StoreAdi.DataSource = SQL1;
                StoreAdi.DataBind();
            }
        }

        public static string AnaDilID()
        {
#if DEBUG
            try
            {
#endif
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_diller
                               where p.ana_dil == true
                               select new
                               {
                                   p.id
                               }).AsEnumerable().Take(1);

                    if (SQL.Any())
                    {
                        return SQL.Select(x => x.id).FirstOrDefault().ToString();
                    }
                    else
                    {
                        return null;
                    }
                }
#if DEBUG
            }
            catch
            {
                return null;
            }
#endif
        }

        public static string YoneticiAdi()
        {
            if (Class.Fonksiyonlar.Admin.Genel.AdminID() == -1)
            {
                return "<b>Local Mode = ON</b>";
            }
            else
            {
                return "(" + Class.Fonksiyonlar.Admin.Kullanici.Cagir.KullaniciAdi(Class.Fonksiyonlar.Admin.Genel.AdminID()) + ") " + "<b>" + Class.Fonksiyonlar.Admin.Kullanici.Cagir.AdSoyad(Class.Fonksiyonlar.Admin.Genel.AdminID()) + "</b>";
            }
        }

        public static void DilDegistir(RowSelectionModel RSM, Store StoreAdi)
        {
            RSM.ClearSelections();
            StoreAdi.DataBind();
        }

        public static Objeler.Tanimlar.Messages DosyaGonder(FileUploadField FUF, string P)
        {
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();

            HttpPostedFile GelenDosya = FUF.PostedFile;
            string GelenUzanti = GelenDosya.FileName.Split(new Char[] { '.' })[GelenDosya.FileName.Split(new Char[] { '.' }).Length - 1];
            //string dosya_adi = GelenDosya.FileName.Substring(0, GelenDosya.FileName.Length - GelenUzanti.Length - 1);
            //string mime_type = GelenDosya.ContentType;
            int GelenDosyaBoyutu = GelenDosya.ContentLength;
            string TamDosyaYolu = P + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.StringTemizle, GelenDosya.FileName);

            #region Resim Uzantıları
            List<string> Uzantilar = new List<string>();
            string[] T = Class.Degiskenler.Site.ResimUzantilari.Split(',');

            foreach (string i in T)
            {
                Uzantilar.Add(i.Replace("*.", ""));
            }
            #endregion

            if (GelenDosyaBoyutu > 1)
            {
                if (Uzantilar.Contains(GelenUzanti))
                {
                    if (GelenDosyaBoyutu < 2201600)
                    {
                        if (!File.Exists(TamDosyaYolu))
                        {
                            try
                            {
                                byte[] B = new byte[GelenDosyaBoyutu];
                                GelenDosya.InputStream.Read(B, 0, GelenDosyaBoyutu);
                                Class.Fonksiyonlar.Genel.DosyaKaydet(B, TamDosyaYolu);

                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.OK;
                                #endregion
                            }
                            catch (Exception ex)
                            {
                                #region Mesaj Döndür
                                M.Type = Class.Sabitler.MessageTypes.ERROR;
                                M.Header = "Bir iç hata Oluştu";
                                M.Text = ex.Message;
                                #endregion
                            }
                        }
                        else
                        {
                            #region Mesaj Döndür
                            M.Type = Class.Sabitler.MessageTypes.ERROR;
                            M.Header = "Hata Oluştu";
                            M.Text = "Bu isimde bir dosya zaten var!<br/>Lütfen ilgili dosyanın adını değiştirerek yeniden deneyiniz.";
                            #endregion
                        }
                    }
                    else
                    {
                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.ERROR;
                        M.Header = "Hata Oluştu";
                        M.Text = "Dosya GelenDosyaBoyutuu 2 MB den fazla olamaz.<br/>Lütfen yeniden deneyiniz.";
                        #endregion
                    }
                }
                else
                {
                    #region Mesaj Döndür
                    M.Type = Class.Sabitler.MessageTypes.ERROR;
                    M.Header = "Hata Oluştu";
                    M.Text = "Yalnızca " + Class.Degiskenler.Site.ResimUzantilari.ToString().Replace("*.", " ") + " gibi resim dosyalarını yükleyebilirsiniz.<br/>Lütfen yeniden deneyiniz.";
                    #endregion
                }
            }
            else
            {
                #region Mesaj Döndür
                M.Type = Class.Sabitler.MessageTypes.ERROR;
                M.Header = "Hata Oluştu";
                M.Text = "İlgili dosya yüklenemedi!<br/>Lütfen yeniden deneyiniz.";
                #endregion
            }

            return M;
        }

        public static string Admin(int? ID)
        {
            if (ID != null)
            {
#if DEBUG
                try
                {
#endif
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        var SQL = (from p in db.tbl_adminler
                                   where p.id == ID
                                   select new
                                   {
                                       p.kullanici_adi,
                                       p.ad_soyad
                                   }).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            return SQL.Select(x => "(" + x.kullanici_adi + ") " + x.ad_soyad).FirstOrDefault().ToString();
                        }
                        else
                        {
                            return null;
                        }
                    }
#if DEBUG
                }
                catch
                {
                    return null;
                }
#endif
            }
            else
            {
                return null;
            }
        }

        public static string Dil(int? ID)
        {
            if (ID != null)
            {
#if DEBUG
                try
                {
#endif
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        var SQL = (from p in db.tbl_diller
                                   where p.id == ID
                                   let UlkeBilgi = db.tbl_sbt_ulke.Where(k => k.id == p.ulke_id).Select(x => new { x.dil_kisaltma, x.kisaltma })
                                   select new
                                   {
                                       p.dil,
                                       kisaltma = UlkeBilgi.Select(x => x.kisaltma).FirstOrDefault(),
                                       dil_kisaltma = UlkeBilgi.Select(x => x.dil_kisaltma).FirstOrDefault()
                                   }).AsEnumerable().Take(1);

                        if (SQL.Any())
                        {
                            return SQL.Select(x => "(" + (x.dil_kisaltma == null ? x.kisaltma : x.dil_kisaltma) + ") " + x.dil).FirstOrDefault().ToString();
                        }
                        else
                        {
                            return null;
                        }
                    }
#if DEBUG
                }
                catch
                {
                    return null;
                }
#endif
            }
            else
            {
                return null;
            }
        }

        public static string EvetHayir(bool? b)
        {
            if (b != null)
            {
                if (b.Value)
                {
                    return "EVET";
                }
                else
                {
                    return "HAYIR";
                }
            }
            else
            {
                return null;
            }
        }

        public static List<Resim> ResimleriGetir(string Resimyolu, string ASHXUrl)
        {
            List<Resim> Resimler = new List<Resim>();

#if DEBUG
            try
            {
#endif
                var SQL = Class.Fonksiyonlar.Genel.ResimleriListele(Resimyolu)
                .Select(s => new
                {
                    resim = s.Replace(Resimyolu, ""),
                    yol = s
                }).Select((p, k) => new
                {
                    id = k + 1,
                    size = new FileInfo(p.yol).Length,
                    name = p.resim.Replace(".jpg", "").Replace(".gif", "").Replace(".png", "").Replace(".bmp", "").Replace("_", " "),
                    url = "ashx/image.ashx?n=" + ASHXUrl + "&i=" + p.resim + "&w=80&h=80&k=t",
                    p.yol,
                    p.resim,
                });

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        #region Resim Objesi
                        Resim R = new Resim();
                        R.ID = i.id;
                        R.Boyut = i.size;
                        R.Ad = i.name;
                        R.URL = i.url;
                        R.Yol = i.yol;
                        R.ResimAdi = i.resim;
                        #endregion

                        Resimler.Add(R);
                    }
                }
#if DEBUG
            }
            catch
            {
            }
#endif

            return Resimler;
        }
    }
}