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
    public class GetCountries : System.Web.Services.WebService
    {
        #region Ülkeler İçin
        [WebMethod]
        public SHOPObjeler.Sonuclar.Ulkeler ButunUlkeler()
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.Ulkeler Sonuc = new SHOPObjeler.Sonuclar.Ulkeler();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.Ulke> L = new List<SHOPObjeler.Tanimlar.Ulke>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from p in db.tbl_sbt_ulke
                               orderby p.ad ascending
                               select new
                               {
                                   p.id,
                                   p.bolge_id,
                                   bolge = db.tbl_sbt_ulke_bolge.Where(x => x.id == p.bolge_id).Select(x => x.ad).FirstOrDefault(),
                                   p.ad,
                                   p.dil_kisaltma,
                                   p.kisaltma,
                                   p.alan_kodu
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
                            /*#region Bölge Objesi
                            SHOPObjeler.Tanimlar.Bolge G = new SHOPObjeler.Tanimlar.Bolge();
                            G.ID = i.bolge_id;
                            G.Ad = i.bolge;
                            #endregion
                            
                            #region Ülke Objesi
                            SHOPObjeler.Tanimlar.Ulke U = new SHOPObjeler.Tanimlar.Ulke();
                            U.ID = i.id;
                            U.Bolge = G;
                            U.Ad = i.ad;
                            U.DilKisaltma = i.dil_kisaltma;
                            U.Kisaltma = i.kisaltma;
                            U.AlanKodu = i.alan_kodu;
                            #endregion
                             
                            L.Add(U);*/

                            #region Bölge Objesi
                            using (SHOPObjeler.Tanimlar.Bolge G = new SHOPObjeler.Tanimlar.Bolge())
                            {
                                G.ID = i.bolge_id;
                                G.Ad = i.bolge;

                                #region Ülke Objesi
                                using (SHOPObjeler.Tanimlar.Ulke U = new SHOPObjeler.Tanimlar.Ulke())
                                {
                                    U.ID = i.id;
                                    U.Bolge = G;
                                    U.Ad = i.ad;
                                    U.DilKisaltma = i.dil_kisaltma;
                                    U.Kisaltma = i.kisaltma;
                                    U.AlanKodu = i.alan_kodu;

                                    L.Add(U);
                                }
                                #endregion
                            }
                            #endregion;
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
            Sonuc.Ulke = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }

        [WebMethod]
        public SHOPObjeler.Sonuclar.Ulkeler UlkeGetir(int ID)
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.Ulkeler Sonuc = new SHOPObjeler.Sonuclar.Ulkeler();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.Ulke> L = new List<SHOPObjeler.Tanimlar.Ulke>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from p in db.tbl_sbt_ulke
                               where p.id == ID
                               select new
                               {
                                   p.id,
                                   p.bolge_id,
                                   bolge = db.tbl_sbt_ulke_bolge.Where(x => x.id == p.bolge_id).Select(x => x.ad).FirstOrDefault(),
                                   p.ad,
                                   p.dil_kisaltma,
                                   p.kisaltma,
                                   p.alan_kodu
                               }).AsEnumerable().Take(1).FirstOrDefault();
                    #endregion

                    if (!string.IsNullOrEmpty(SQL.id.ToString()))
                    {
                        #region Mesaj Döndür
                        M.Type = Class.Sabitler.MessageTypes.OK;
                        #endregion

                        /*#region Bölge Objesi
                        SHOPObjeler.Tanimlar.Bolge G = new SHOPObjeler.Tanimlar.Bolge();
                        G.ID = SQL.bolge_id;
                        G.Ad = SQL.bolge;
                        #endregion;

                        #region Ülke Objesi
                        SHOPObjeler.Tanimlar.Ulke U = new SHOPObjeler.Tanimlar.Ulke();
                        U.ID = SQL.id;
                        U.Bolge = G;
                        U.Ad = SQL.ad;
                        U.DilKisaltma = SQL.dil_kisaltma;
                        U.Kisaltma = SQL.kisaltma;
                        U.AlanKodu = SQL.alan_kodu;
                        #endregion

                        L.Add(U);*/

                        #region Bölge Objesi
                        using (SHOPObjeler.Tanimlar.Bolge G = new SHOPObjeler.Tanimlar.Bolge())
                        {
                            G.ID = SQL.bolge_id;
                            G.Ad = SQL.bolge;

                            #region Ülke Objesi
                            using (SHOPObjeler.Tanimlar.Ulke U = new SHOPObjeler.Tanimlar.Ulke())
                            {
                                U.ID = SQL.id;
                                U.Bolge = G;
                                U.Ad = SQL.ad;
                                U.DilKisaltma = SQL.dil_kisaltma;
                                U.Kisaltma = SQL.kisaltma;
                                U.AlanKodu = SQL.alan_kodu;

                                L.Add(U);
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
            Sonuc.Ulke = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }
        #endregion

        #region İller İçin
        [WebMethod]
        public SHOPObjeler.Sonuclar.UlkeIller IlGetir(int UlkeID)
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.UlkeIller Sonuc = new SHOPObjeler.Sonuclar.UlkeIller();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.UlkeIl> L = new List<SHOPObjeler.Tanimlar.UlkeIl>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from p in db.tbl_sbt_ulke_il
                               where p.ulke_id == UlkeID
                               orderby p.ad ascending
                               select new
                               {
                                   p.id,
                                   p.ulke_id,
                                   p.bolge_id,
                                   bolge = db.tbl_sbt_ulke_il_bolge.Where(x => x.id == p.bolge_id).Select(x => x.ad).FirstOrDefault(),
                                   p.ad,
                                   p.alan_kodu,
                                   p.plaka
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
                            /*#region Bölge Objesi
                            SHOPObjeler.Tanimlar.UlkeIlBolge G = new SHOPObjeler.Tanimlar.UlkeIlBolge();
                            G.ID = i.bolge_id;
                            G.Ad = i.bolge;
                            #endregion;

                            #region Ülke Objesi
                            SHOPObjeler.Tanimlar.Ulke U = new SHOPObjeler.Tanimlar.Ulke();
                            U = UlkeGetir(i.ulke_id).Ulke[0];
                            #endregion

                            #region Şehir Objesi
                            SHOPObjeler.Tanimlar.UlkeIl S = new SHOPObjeler.Tanimlar.UlkeIl();
                            S.ID = i.id;
                            S.Ulke = U;
                            S.UlkeIlBolge = G;
                            S.Ad = i.ad;
                            S.AlanKodu = i.alan_kodu;
                            S.Plaka = i.plaka;
                            #endregion

                            L.Add(S);*/

                            #region Bölge Objesi
                            using (SHOPObjeler.Tanimlar.UlkeIlBolge G = new SHOPObjeler.Tanimlar.UlkeIlBolge())
                            {
                                G.ID = i.bolge_id;
                                G.Ad = i.bolge;

                                #region Ülke Objesi
                                SHOPObjeler.Tanimlar.Ulke U = new SHOPObjeler.Tanimlar.Ulke();
                                U = UlkeGetir(i.ulke_id).Ulke[0];
                                #endregion

                                #region Şehir Objesi
                                using (SHOPObjeler.Tanimlar.UlkeIl S = new SHOPObjeler.Tanimlar.UlkeIl())
                                {
                                    S.ID = i.id;
                                    S.Ulke = U;
                                    S.UlkeIlBolge = G;
                                    S.Ad = i.ad;
                                    S.AlanKodu = i.alan_kodu;
                                    S.Plaka = i.plaka;

                                    L.Add(S);
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
            Sonuc.Sehirler = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }
        #endregion

        #region İlçeler İçin
        [WebMethod]
        public SHOPObjeler.Sonuclar.UlkeIlceler IlceGetir(int IlID)
        {
            #region Boş Instancelar
            SHOPObjeler.Sonuclar.UlkeIlceler Sonuc = new SHOPObjeler.Sonuclar.UlkeIlceler();
            Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
            List<SHOPObjeler.Tanimlar.UlkeIlce> L = new List<SHOPObjeler.Tanimlar.UlkeIlce>();
            #endregion

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    #region SQL
                    var SQL = (from p in db.tbl_sbt_ulke_ilce
                               where p.il_id == IlID
                               orderby p.ad ascending
                               select new
                               {
                                   p.id,
                                   p.il_id,
                                   p.ad,
                                   p.merkez
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
                            /*#region Ülke Objesi
                            SHOPObjeler.Tanimlar.UlkeIl U = new SHOPObjeler.Tanimlar.UlkeIl();
                            U.ID = i.il_id;
                            #endregion

                            #region Şehir Objesi
                            SHOPObjeler.Tanimlar.UlkeIlce S = new SHOPObjeler.Tanimlar.UlkeIlce();
                            S.ID = i.id;
                            S.UlkeIl = U;
                            S.Ad = i.ad;
                            S.Merkez = i.merkez;
                            #endregion

                            L.Add(S);*/

                            #region Ülke Objesi
                            using (SHOPObjeler.Tanimlar.UlkeIl U = new SHOPObjeler.Tanimlar.UlkeIl())
                            {
                                U.ID = i.il_id;

                                #region Şehir Objesi
                                using (SHOPObjeler.Tanimlar.UlkeIlce S = new SHOPObjeler.Tanimlar.UlkeIlce())
                                {
                                    S.ID = i.id;
                                    S.UlkeIl = U;
                                    S.Ad = i.ad;
                                    S.Merkez = i.merkez;

                                    L.Add(S);
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
            Sonuc.Ilceler = L;
            Sonuc.Message = M;
            #endregion

            return Sonuc;
        }
        #endregion
    }
}