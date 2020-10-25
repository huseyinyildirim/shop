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
    public class GetMemberAddress : System.Web.Services.WebService
    {
        [WebMethod]
        public SHOPObjeler.Sonuclar.Adres Adresler(int AdresID, int KullaniciID)
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.Adres Sonuc = new SHOPObjeler.Sonuclar.Adres();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.Adresler> L = new List<SHOPObjeler.Tanimlar.Adresler>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from p in db.tbl_kullanicilar_adresler
                               where p.id == AdresID && p.kullanici_id == KullaniciID
                               select new
                               {
                                   p.id,
                                   p.kullanici_id,
                                   p.tip,
                                   p.baslik,
                                   p.ulke_id,
                                   p.eyalet,
                                   p.il_id,
                                   p.il,
                                   p.ilce_id,
                                   p.ilce,
                                   p.posta_kodu,
                                   p.adres,
                                   p.acik_adres,
                                   vergi_id = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.id).FirstOrDefault(),
                                   vergi_adres_id = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.adres_id).FirstOrDefault(),
                                   vergi_tip = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.tip).FirstOrDefault(),
                                   vergi_firma = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.firma).FirstOrDefault(),
                                   vergi_dairesi = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.vergi_dairesi).FirstOrDefault(),
                                   vergi_no = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.vergi_no).FirstOrDefault(),
                                   vergi_tc_no = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.tc_kimlik_no).FirstOrDefault()
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
                            /*#region Kullanıcı Objesi
                            SHOPObjeler.Tanimlar.Kullanici Kullanici = new SHOPObjeler.Tanimlar.Kullanici();
                            Kullanici.ID = i.kullanici_id;
                            #endregion;

                            #region Ülke objesi
                            SHOPObjeler.Tanimlar.Ulke Ulke = new SHOPObjeler.Tanimlar.Ulke();
                            Ulke.ID = i.ulke_id;
                            #endregion

                            #region Ülke il objesi
                            SHOPObjeler.Tanimlar.UlkeIl UlkeIl = new SHOPObjeler.Tanimlar.UlkeIl();
                            UlkeIl.ID = i.il_id;
                            #endregion

                            #region Ülke ilçe objesi
                            SHOPObjeler.Tanimlar.UlkeIlce UlkeIlce = new SHOPObjeler.Tanimlar.UlkeIlce();
                            UlkeIlce.ID = i.ilce_id;
                            #endregion

                            #region Vergi bilgileri objesi
                            SHOPObjeler.Tanimlar.VergiBilgiler VergiBilgi = new SHOPObjeler.Tanimlar.VergiBilgiler();
                            VergiBilgi.ID = i.vergi_id;
                            VergiBilgi.AdresID = i.vergi_adres_id;
                            VergiBilgi.Tip = i.vergi_tip;
                            VergiBilgi.Firma = i.vergi_firma;
                            VergiBilgi.VergiDairesi = i.vergi_dairesi;
                            VergiBilgi.VergiNo = i.vergi_no;
                            VergiBilgi.TcKimlikNo = i.vergi_tc_no;
                            #endregion

                            #region Ülke Objesi
                            SHOPObjeler.Tanimlar.Adresler Adres = new SHOPObjeler.Tanimlar.Adresler();
                            Adres.ID = i.id;
                            Adres.Kullanici = Kullanici;
                            Adres.Tip = i.tip;
                            Adres.Baslik = i.baslik;
                            Adres.UlkeID = Ulke;
                            Adres.Eyalet = i.eyalet;
                            Adres.IlID = UlkeIl;
                            Adres.Il = i.il;
                            Adres.IlceID = UlkeIlce;
                            Adres.Ilce = i.ilce;
                            Adres.PostaKodu = i.posta_kodu;
                            Adres.Adres = i.adres;
                            Adres.AcikAdres = i.acik_adres;
                            Adres.VergiBilgi = VergiBilgi;
                            #endregion

                            L.Add(Adres);*/

                            #region Kullanıcı Objesi
                            using (SHOPObjeler.Tanimlar.Kullanici Kullanici = new SHOPObjeler.Tanimlar.Kullanici())
                            {
                                Kullanici.ID = i.kullanici_id;

                                #region Ülke objesi
                                using (SHOPObjeler.Tanimlar.Ulke Ulke = new SHOPObjeler.Tanimlar.Ulke())
                                {
                                    Ulke.ID = i.ulke_id;

                                    #region Ülke il objesi
                                    using (SHOPObjeler.Tanimlar.UlkeIl UlkeIl = new SHOPObjeler.Tanimlar.UlkeIl())
                                    {
                                        UlkeIl.ID = i.il_id;

                                        #region Ülke ilçe objesi
                                        using (SHOPObjeler.Tanimlar.UlkeIlce UlkeIlce = new SHOPObjeler.Tanimlar.UlkeIlce())
                                        {
                                            UlkeIlce.ID = i.ilce_id;

                                            #region Vergi bilgileri objesi
                                            using (SHOPObjeler.Tanimlar.VergiBilgiler VergiBilgi = new SHOPObjeler.Tanimlar.VergiBilgiler())
                                            {
                                                VergiBilgi.ID = i.vergi_id;
                                                VergiBilgi.AdresID = i.vergi_adres_id;
                                                VergiBilgi.Tip = i.vergi_tip;
                                                VergiBilgi.Firma = i.vergi_firma;
                                                VergiBilgi.VergiDairesi = i.vergi_dairesi;
                                                VergiBilgi.VergiNo = i.vergi_no;
                                                VergiBilgi.TcKimlikNo = i.vergi_tc_no;

                                                #region Ülke Objesi
                                                using (SHOPObjeler.Tanimlar.Adresler Adres = new SHOPObjeler.Tanimlar.Adresler())
                                                {
                                                    Adres.ID = i.id;
                                                    Adres.Kullanici = Kullanici;
                                                    Adres.Tip = i.tip;
                                                    Adres.Baslik = i.baslik;
                                                    Adres.UlkeID = Ulke;
                                                    Adres.Eyalet = i.eyalet;
                                                    Adres.IlID = UlkeIl;
                                                    Adres.Il = i.il;
                                                    Adres.IlceID = UlkeIlce;
                                                    Adres.Ilce = i.ilce;
                                                    Adres.PostaKodu = i.posta_kodu;
                                                    Adres.Adres = i.adres;
                                                    Adres.AcikAdres = i.acik_adres;
                                                    Adres.VergiBilgi = VergiBilgi;

                                                    L.Add(Adres);
                                                }
                                                #endregion
                                            }
                                            #endregion
                                        }
                                        #endregion
                                    }
                                    #endregion
                                }
                                #endregion
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
            Sonuc.Adresler = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }

        [WebMethod]
        public SHOPObjeler.Sonuclar.Adres ButunAdresler(int KullaniciID, bool Tip)
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.Adres Sonuc = new SHOPObjeler.Sonuclar.Adres();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.Adresler> L = new List<SHOPObjeler.Tanimlar.Adresler>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from p in db.tbl_kullanicilar_adresler
                               where p.kullanici_id == KullaniciID && p.tip == Tip
                               select new
                               {
                                   p.id,
                                   p.kullanici_id,
                                   p.tip,
                                   p.baslik,
                                   vergi_id = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.id).FirstOrDefault(),
                                   vergi_tip = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.tip).FirstOrDefault(),
                                   vergi_adres_id = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.adres_id).FirstOrDefault(),
                                   vergi_firma = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.firma).FirstOrDefault()
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
                            /*#region Kullanıcı Objesi
                            SHOPObjeler.Tanimlar.Kullanici Kullanici = new SHOPObjeler.Tanimlar.Kullanici();
                            Kullanici.ID = i.kullanici_id;
                            #endregion;

                            #region Vergi bilgileri objesi
                            SHOPObjeler.Tanimlar.VergiBilgiler VergiBilgi = new SHOPObjeler.Tanimlar.VergiBilgiler();
                            VergiBilgi.ID = i.vergi_id;
                            VergiBilgi.AdresID = i.vergi_adres_id;
                            VergiBilgi.Tip = i.vergi_tip;
                            VergiBilgi.Firma = i.vergi_firma;
                            #endregion

                            #region Ülke Objesi
                            SHOPObjeler.Tanimlar.Adresler Adres = new SHOPObjeler.Tanimlar.Adresler();
                            Adres.ID = i.id;
                            Adres.Kullanici = Kullanici;
                            Adres.Tip = i.tip;
                            Adres.Baslik = i.baslik;
                            Adres.VergiBilgi = VergiBilgi;
                            #endregion

                            L.Add(Adres);*/

                            #region Kullanıcı Objesi
                            using (SHOPObjeler.Tanimlar.Kullanici Kullanici = new SHOPObjeler.Tanimlar.Kullanici())
                            {
                                Kullanici.ID = i.kullanici_id;

                                #region Vergi bilgileri objesi
                                using (SHOPObjeler.Tanimlar.VergiBilgiler VergiBilgi = new SHOPObjeler.Tanimlar.VergiBilgiler())
                                {
                                    VergiBilgi.ID = i.vergi_id;
                                    VergiBilgi.AdresID = i.vergi_adres_id;
                                    VergiBilgi.Tip = i.vergi_tip;
                                    VergiBilgi.Firma = i.vergi_firma;

                                    #region Ülke Objesi
                                    using (SHOPObjeler.Tanimlar.Adresler Adres = new SHOPObjeler.Tanimlar.Adresler())
                                    {

                                        Adres.ID = i.id;
                                        Adres.Kullanici = Kullanici;
                                        Adres.Tip = i.tip;
                                        Adres.Baslik = i.baslik;
                                        Adres.VergiBilgi = VergiBilgi;

                                        L.Add(Adres);
                                    }
                                    #endregion
                                }
                                #endregion
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
            Sonuc.Adresler = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }
    }
}