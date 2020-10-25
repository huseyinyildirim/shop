using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using MySQLDataModel;

namespace SHOP.asmx
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.None)]
    [ScriptService]
    [Serializable]
    public class GetProduct : System.Web.Services.WebService
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullanilacakDoviz = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();

        [WebMethod]
        public SHOPObjeler.Sonuclar.UrunDetay UrunDetaylar(int UrunID)
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.UrunDetay Sonuc = new SHOPObjeler.Sonuclar.UrunDetay();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.UrunDetaylar> L = new List<SHOPObjeler.Tanimlar.UrunDetaylar>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from a in db.tbl_urunler
                               where a.id == UrunID
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
                                   indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde==null?0:p.yuzde).FirstOrDefault()
                               }).AsEnumerable();
                    #endregion

                    if (SQL.Any())
                    {
                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.OK;
                        #endregion

                        #region Döngü
                        foreach (var i in SQL)
                        {
                            #region ÜrünDetay Objesi
                            using (SHOPObjeler.Tanimlar.UrunDetaylar UrunDetay = new SHOPObjeler.Tanimlar.UrunDetaylar())
                            {
                                UrunDetay.ID = i.id;
                                UrunDetay.UrunAd = i.ad;
                                UrunDetay.UrunKod = i.urunkod;
                                UrunDetay.ResimID = i.resim_id.ToString();
                                UrunDetay.Fiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());

                                #region Üründe indirim var mı?
                                if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                {
                                    UrunDetay.Indirim = "%" + i.indirim;
                                }
                                else
                                {
                                    UrunDetay.Indirim = null;
                                }
                                #endregion

                                #region Üründe kdv var mı?
                                if (i.kdv)
                                {
                                    UrunDetay.KDV = true;
                                }
                                else
                                {
                                    UrunDetay.KDV = false;
                                }
                                #endregion

                                #region Kargo ücretsiz ise
                                if (i.kargo_hesaplama_id == 1)
                                {
                                    UrunDetay.UcretizKargo = true;
                                }
                                else
                                {
                                    UrunDetay.UcretizKargo = false;
                                }
                                #endregion

                                #region Kullanılacak dövize göre karar veriyor ve döviz fiyatı varsa indirimine göre hesaplıyor
                                if (KullanilacakDoviz == i.para_birimi_id)
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + KullanilacakDovizAd;

                                    if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                    {
                                        string IndirimliFiyat = SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0);
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                    }
                                    else
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + KullanilacakDovizAd;
                                    }
                                }
                                else
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                    if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                    {
                                        string IndirimliFiyat = SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0);
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(IndirimliFiyat, i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                    }
                                    else
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id).ToString()) + " " + KullanilacakDovizAd;
                                    }
                                }
                                #endregion

                                L.Add(UrunDetay);
                            }
                            #endregion
                        }
                        #endregion
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
            }
            catch (Exception Ex)
            {
                #region Mesaj Döndür
                M.Type = Class.Sabitler.MessageTypes.ERROR;
                M.Header = "Bir iç hata Oluştu";
                M.Text = Ex.Message;
                #endregion
            }

            #region Return Parametleri İçin Obje Setle
            Sonuc.UrunDetaylar = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }

        [WebMethod]
        public SHOPObjeler.Sonuclar.UrunDetay YeniUrunler()
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.UrunDetay Sonuc = new SHOPObjeler.Sonuclar.UrunDetay();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.UrunDetaylar> L = new List<SHOPObjeler.Tanimlar.UrunDetaylar>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from a in db.tbl_urunler
                               where a.onay == true && a.yeni == true && a.dil_id == DilID
                               orderby a.tarih_ek descending
                               select new
                               {
                                   a.id,
                                   a.resim_id,
                                   a.ad,
                                   a.fiyat,
                                   a.kdv_id,
                                   a.para_birimi_id,
                                   a.indirim_id,
                                   a.kargo_hesaplama_id,
                                   a.stok,
                                   a.yeni,
                                   urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                   indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde).FirstOrDefault()
                               }).AsEnumerable().Take(15);
                    #endregion

                    if (SQL.Any())
                    {
                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.OK;
                        #endregion

                        #region Döngü
                        foreach (var i in SQL)
                        {
                            #region Üründetay Objesi
                            using (SHOPObjeler.Tanimlar.UrunDetaylar UrunDetay = new SHOPObjeler.Tanimlar.UrunDetaylar())
                            {
                                UrunDetay.ID = i.id;
                                UrunDetay.UrunAd = i.ad;
                                UrunDetay.UrunKod = i.urunkod;
                                UrunDetay.ResimID = i.resim_id.ToString();
                                UrunDetay.Fiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());

                                #region Üründe indirim var mı?
                                if (i.indirim_id != null)
                                {
                                    UrunDetay.Indirim = "%" + i.indirim;
                                }
                                else
                                {
                                    UrunDetay.Indirim = null;
                                }
                                #endregion

                                #region Üründe kdv var mı?
                                if (i.kdv_id == 0)
                                {
                                    UrunDetay.KDV = false;
                                }
                                else
                                {
                                    UrunDetay.KDV = true;
                                }
                                #endregion

                                #region Kargo ücretsiz ise
                                if (i.kargo_hesaplama_id == 1)
                                {
                                    UrunDetay.UcretizKargo = true;
                                }
                                else
                                {
                                    UrunDetay.UcretizKargo = false;
                                }
                                #endregion

                                #region Kullanılacak dövize göre karar veriyor ve döviz fiyatı varsa indirimine göre hesaplıyor
                                if (KullanilacakDoviz == i.para_birimi_id)
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + KullanilacakDovizAd;

                                    if (i.indirim_id > 0)
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                    }
                                    else
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + KullanilacakDovizAd;
                                    }
                                }
                                else
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                    if (i.indirim_id > 0)
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                    }
                                    else
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id).ToString()) + " " + KullanilacakDovizAd;
                                    }
                                }
                                #endregion

                                L.Add(UrunDetay);
                            }
                            #endregion
                        }
                        #endregion
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
            }
            catch (Exception Ex)
            {
                #region Mesaj Döndür
                M.Type = Class.Sabitler.MessageTypes.ERROR;
                M.Header = "Bir iç hata Oluştu";
                M.Text = Ex.Message;
                #endregion
            }

            #region Return Parametleri İçin Obje Setle
            Sonuc.UrunDetaylar = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }

        [WebMethod]
        public SHOPObjeler.Sonuclar.UrunDetay EnCokSatilanUrunler()
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.UrunDetay Sonuc = new SHOPObjeler.Sonuclar.UrunDetay();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.UrunDetaylar> L = new List<SHOPObjeler.Tanimlar.UrunDetaylar>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from a in db.tbl_urunler
                               let SatisSayi = db.tbl_cpy_siparisler_urunler.Where(p => p.urunler_id == a.id).Count()
                               where a.onay == true && a.dil_id == DilID && SatisSayi > 0
                               orderby SatisSayi descending
                               select new
                               {
                                   a.id,
                                   a.resim_id,
                                   a.ad,
                                   fiyat = a.fiyat == null ? 0 : a.fiyat,
                                   a.kdv_id,
                                   a.para_birimi_id,
                                   a.indirim_id,
                                   a.kargo_hesaplama_id,
                                   a.stok,
                                   a.yeni,
                                   urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                   indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde).FirstOrDefault()
                               }).AsEnumerable().Take(15);
                    #endregion

                    if (SQL.Any())
                    {
                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.OK;
                        #endregion

                        #region Döngü
                        foreach (var i in SQL)
                        {
                            #region Üründetay Objesi
                            using (SHOPObjeler.Tanimlar.UrunDetaylar UrunDetay = new SHOPObjeler.Tanimlar.UrunDetaylar())
                            {
                                UrunDetay.ID = i.id;
                                UrunDetay.UrunAd = i.ad;
                                UrunDetay.UrunKod = i.urunkod;
                                UrunDetay.ResimID = i.resim_id.ToString();
                                UrunDetay.Fiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());

                                #region Üründe indirim var mı?
                                if (i.indirim_id != null)
                                {
                                    UrunDetay.Indirim = "%" + i.indirim;
                                }
                                else
                                {
                                    UrunDetay.Indirim = null;
                                }
                                #endregion

                                #region Üründe kdv var mı?
                                if (i.kdv_id == 0)
                                {
                                    UrunDetay.KDV = false;
                                }
                                else
                                {
                                    UrunDetay.KDV = true;
                                }
                                #endregion

                                #region Kargo ücretsiz ise
                                if (i.kargo_hesaplama_id == 1)
                                {
                                    UrunDetay.UcretizKargo = true;
                                }
                                else
                                {
                                    UrunDetay.UcretizKargo = false;
                                }
                                #endregion

                                #region Kullanılacak dövize göre karar veriyor ve döviz fiyatı varsa indirimine göre hesaplıyor
                                if (KullanilacakDoviz == i.para_birimi_id)
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + KullanilacakDovizAd;

                                    if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                    }
                                    else
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + KullanilacakDovizAd;
                                    }
                                }
                                else
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd;

                                    if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                    }
                                    else
                                    {
                                        UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id).ToString()) + " " + KullanilacakDovizAd;
                                    }
                                }
                                #endregion

                                L.Add(UrunDetay);
                            }
                            #endregion
                        }
                        #endregion
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
            }
            catch (Exception Ex)
            {
                #region Mesaj Döndür
                M.Type = Class.Sabitler.MessageTypes.ERROR;
                M.Header = "Bir iç hata Oluştu";
                M.Text = Ex.Message;
                #endregion
            }

            #region Return Parametleri İçin Obje Setle
            Sonuc.UrunDetaylar = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }

        [WebMethod]
        public SHOPObjeler.Sonuclar.UrunDetay IndirimliUrunler()
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.UrunDetay Sonuc = new SHOPObjeler.Sonuclar.UrunDetay();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.UrunDetaylar> L = new List<SHOPObjeler.Tanimlar.UrunDetaylar>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from a in db.tbl_urunler
                               where a.onay == true && a.indirim_id != null && a.dil_id == DilID
                               select new
                               {
                                   a.id,
                                   a.resim_id,
                                   a.ad,
                                   fiyat = a.fiyat == null ? 0 : a.fiyat,
                                   a.kdv_id,
                                   a.para_birimi_id,
                                   a.indirim_id,
                                   a.kargo_hesaplama_id,
                                   a.stok,
                                   a.yeni,
                                   urunkod = db.tbl_kodlar.Where(p => p.id == a.kod_id).Select(p => p.kod).FirstOrDefault(),
                                   indirim = db.tbl_indirimler.Where(p => p.id == a.indirim_id).Select(p => p.yuzde).FirstOrDefault()
                               }).AsEnumerable().Take(15);
                    #endregion

                    if (SQL.Any())
                    {
                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.OK;
                        #endregion

                        #region Döngü
                        foreach (var i in SQL)
                        {
                            #region Üründetay Objesi
                            using (SHOPObjeler.Tanimlar.UrunDetaylar UrunDetay = new SHOPObjeler.Tanimlar.UrunDetaylar())
                            {
                                UrunDetay.ID = i.id;
                                UrunDetay.UrunAd = i.ad;
                                UrunDetay.UrunKod = i.urunkod;
                                UrunDetay.ResimID = i.resim_id.ToString();
                                UrunDetay.Fiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());
                                UrunDetay.Indirim = "%" + i.indirim;

                                #region Üründe kdv var mı?
                                if (i.kdv_id == 0)
                                {
                                    UrunDetay.KDV = false;
                                }
                                else
                                {
                                    UrunDetay.KDV = true;
                                }
                                #endregion

                                #region Kargo ücretsiz ise
                                if (i.kargo_hesaplama_id == 1)
                                {
                                    UrunDetay.UcretizKargo = true;
                                }
                                else
                                {
                                    UrunDetay.UcretizKargo = false;
                                }
                                #endregion

                                #region Kullanılacak dövize göre karar veriyor ve döviz fiyatı varsa indirimine göre hesaplıyor
                                if (KullanilacakDoviz == i.para_birimi_id)
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + KullanilacakDovizAd;
                                    UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                }
                                else
                                {
                                    UrunDetay.DovizFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                    UrunDetay.DovizIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.DovizCevir(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(SHOPClass.Finans.Hesaplama.DovizCevir(i.fiyat.ToString(), i.para_birimi_id), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0), i.para_birimi_id)) + " " + KullanilacakDovizAd;
                                }
                                #endregion

                                L.Add(UrunDetay);
                            }
                            #endregion
                        }
                        #endregion
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
            }
            catch (Exception Ex)
            {
                #region Mesaj Döndür
                M.Type = Class.Sabitler.MessageTypes.ERROR;
                M.Header = "Bir iç hata Oluştu";
                M.Text = Ex.Message;
                #endregion
            }

            #region Return Parametleri İçin Obje Setle
            Sonuc.UrunDetaylar = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }
    }
}
