﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Linq.Dynamic;
using Ext.Net;
using LinqToCache;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class site_ziyaretleri : System.Web.UI.Page
    {
        RowSelectionModel RSM;
        string SayfaAdi { get; set; }
        bool CacheOlayi { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            #region JS İçin Admin Root mu Değil mi?
            Class.Fonksiyonlar.JavaScript.Ekle("var AdminRoot = function(){return " + Class.Fonksiyonlar.Admin.Kullanici.Kontroller.Root(Class.Fonksiyonlar.Admin.Genel.AdminID()).ToString().ToLower() + ";};");
            #endregion

            #region Oturum Kontrol
            if (!Class.Fonksiyonlar.Admin.Genel.SessionKontrol())
            {
                #region Oturum Yoksa Postala
                Response.Redirect("default.aspx?rnd=" + (DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond) + "&s=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), false);
                Context.ApplicationInstance.CompleteRequest();
                return;
                #endregion
            }
            else
            {
                #region Sayfa Adını Al
                SayfaAdi = Request.Url.LocalPath.Split('/')[Request.Url.LocalPath.Split('/').Count() - 1].Replace(Request.CurrentExecutionFilePathExtension, "");
                #endregion

                #region Row Selection Modeli
                RSM = GridPanel1.SelectionModel.Primary as RowSelectionModel;
                #endregion

                #region Icon Register Olayı
                if (!IsPostBack)
                {
                    ResourceManager1.RegisterIcon(Icon.Cancel);
                    ResourceManager1.RegisterIcon(Icon.UserMagnify);
                }
                #endregion

                #region Veri Cacheden Mi Gelecek?
                if (Request.QueryString["cache"] != null)
                {
                    if (Request.QueryString["cache"].ToString().Trim() == "ok")
                    {
                        CacheOlayi = true;
                    }
                }
                #endregion
            }
            #endregion
        }

        #region Boş VIEWSTATE
        protected override void SavePageStateToPersistenceMedium(object viewState)
        {
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null;
        }
        #endregion

        #region Genel Fonksiyonlar

        protected void Veriler(int Baslangic, int Bitis, string s, string Kolon, string AscDesc, out IList Sonuc1, out IList Sonuc2)
        {
            #region İşlem Dictionary
            Dictionary<int, string> D = new Dictionary<int, string>();
            D.Add(0, "ÜRÜN");
            D.Add(1, "KATEGORİ");
            D.Add(2, "ETİKET");
            D.Add(3, "MARKA");
            #endregion

            #region Çalışan Hali
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                try
                {
                    #region Kolon Sorting Ayarı
                    string KolonAdi = null;
                    switch (Kolon)
                    {
                        #region İşlem
                        case "tips":
                            Kolon = "tip";
                            KolonAdi = Kolon;
                            break;
                        #endregion
                    }
                    #endregion

                    #region İlk SQL - SONUÇ 1

                    #region İlk (Ham) SQL
                    var SQL1 = (from p in db.tbl_ziyaretler
                                where p.urun_id != null || p.kategori_id != null || p.etiket_id != null || p.marka_id != null
                                select p);
                    #endregion

                    #region SQL i Cache 'e Atma
                    //CachedQueryOptions CQO = new CachedQueryOptions();
                    var SQL2 = (CacheOlayi ? SQL1.AsCached(SayfaAdi).AsQueryable().OrderBy(Kolon + " " + AscDesc).ToList() : SQL1.AsQueryable().OrderBy(Kolon + " " + AscDesc).ToList());
                    #endregion

                    #region Sonuç 1
                    Sonuc1 = SQL2;
                    #endregion

                    #endregion

                    #region İlk SQL in Ccount ı Sıfırdan Büyükse Filtreleme Yap
                    if (SQL2.Any())
                    {
                        #region Filtreleme
                        if (!string.IsNullOrEmpty(s))
                        {
                            FilterConditions FC = new FilterConditions(s);

                            foreach (FilterCondition FCO in FC.Conditions)
                            {
                                Comparison C = FCO.Comparison;
                                FilterType FT = FCO.FilterType;

                                #region Kolon Adı Boşsa Değer Ver
                                if (string.IsNullOrEmpty(KolonAdi))
                                {
                                    KolonAdi = FCO.Name;
                                }
                                #endregion

                                #region Gelen Değerler
                                object value;
                                #endregion

                                switch (FCO.FilterType)
                                {
                                    #region Filtre Tipi Bool İse
                                    case FilterType.Boolean:
                                        value = FCO.ValueAsBoolean;
                                        break;
                                    #endregion

                                    #region Filtre Tipi Date İse
                                    case FilterType.Date:
                                        value = FCO.ValueAsDate;
                                        break;
                                    #endregion

                                    #region Filtre Tipi Liste İse
                                    case FilterType.List:
                                        value = FCO.ValuesList;
                                        break;
                                    #endregion

                                    #region Filtre Tipi Nümerik İse
                                    case FilterType.Numeric:
                                        if (SQL2.Any() && (SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(int) || SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(Int16) || SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(Int32) || SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(Int64) || SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(Nullable<int>) || SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(Nullable<Int16>) || SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(Nullable<Int32>) || SQL2[0].GetType().GetProperty(KolonAdi).PropertyType == typeof(Nullable<Int64>)))
                                        {
                                            value = FCO.ValueAsInt;
                                        }
                                        else
                                        {
                                            value = FCO.ValueAsDouble;
                                        }
                                        break;
                                    #endregion

                                    #region Filtre Tipi String İse
                                    case FilterType.String:
                                        value = FCO.Value;
                                        break;
                                    #endregion

                                    #region Switch Default
                                    default:
                                        throw new ArgumentOutOfRangeException();
                                    #endregion
                                }

                                SQL2.RemoveAll(i =>
                                {
                                    object o = i.GetType().GetProperty(KolonAdi).GetValue(i, null);
                                    IComparable IC = o as IComparable;

                                    switch (C)
                                    {
                                        case Comparison.Eq:

                                            switch (FT)
                                            {
                                                #region Filtre Tipi Liste İse
                                                case FilterType.List:
                                                    return !(value as ReadOnlyCollection<string>).Contains(o.ToString());
                                                #endregion

                                                #region Filtre Tipi String İse
                                                case FilterType.String:
                                                    return !o.ToString().StartsWith(value.ToString());
                                                #endregion

                                                #region Switch Default
                                                default:
                                                    return !IC.Equals(value);
                                                #endregion
                                            }

                                        case Comparison.Gt:
                                            return IC.CompareTo(value) < 1;

                                        case Comparison.Lt:
                                            return IC.CompareTo(value) > -1;

                                        #region Switch Default
                                        default:
                                            throw new ArgumentOutOfRangeException();
                                        #endregion
                                    }
                                });
                            }
                        }
                        #endregion
                    }
                    #endregion

                    #region SQL İçeriğini Değiştirme
                    var SQL3 = SQL2.Skip(Baslangic).Take(Bitis).Select(p => new
                    {
                        p.id,
                        p.urun_id,
                        p.kategori_id,
                        p.etiket_id,
                        p.tarih,
                        p.marka_id,
                        p.tip,
                        #region İşlem Tipi
                        tips = D.Where(x => x.Key == p.tip).Select(x => x.Value).FirstOrDefault(),
                        #endregion
                        urun_dil = (p.urun_id != null ? db.tbl_urunler.Where(k => k.id == p.urun_id).AsEnumerable().Select(x => AdminClass.Dil(x.dil_id)).FirstOrDefault() : "------"),
                        urun = (p.urun_id != null ? db.tbl_urunler.Where(k => k.id == p.urun_id).Select(x => (x.kod_id != null ? db.tbl_kodlar.Where(t => t.id == x.kod_id).Select(y => y.kod).FirstOrDefault() + " - " : "") + x.ad).FirstOrDefault() : "------"),
                        kategori_dil = (p.kategori_id != null ? db.tbl_kategoriler.Where(k => k.id == p.kategori_id).AsEnumerable().Select(x => AdminClass.Dil(x.dil_id)).FirstOrDefault() : "------"),
                        kategori = (p.kategori_id != null ? db.tbl_kategoriler.Where(k => k.id == p.kategori_id).Select(x => x.ad).FirstOrDefault() : "------"),
                        etiket_dil = (p.etiket_id != null ? db.tbl_etiketler.Where(k => k.id == p.etiket_id).AsEnumerable().Select(x => AdminClass.Dil(x.dil_id)).FirstOrDefault() : "------"),
                        etiket = (p.etiket_id != null ? db.tbl_etiketler.Where(k => k.id == p.etiket_id).Select(x => x.ad).FirstOrDefault() : "------"),
                        marka = (p.marka_id != null ? db.tbl_markalar.Where(k => k.id == p.marka_id).Select(x => x.ad).FirstOrDefault() : "------"),
                    }).AsEnumerable().Cast<object>().ToList();
                    #endregion

                    #region Sonuç 2
                    Sonuc2 = SQL3;
                    #endregion
                }
                catch
                {
                    #region Boş Değer Döndür
                    Sonuc1 = null;
                    Sonuc2 = null;
                    #endregion
                }
            }

            #endregion
        }

        protected void KayitlariYenile(object sender, StoreRefreshDataEventArgs e)
        {
            #region Filtre Değişkeni
            string s = e.Parameters[GridFilters1.ParamPrefix];
            #endregion

            #region Kolon Sorting
            string Kolon = null;

            if (e.Sort != "Default")
            {
                Kolon = e.Sort;
            }
            #endregion

            #region Kolon Short Direction
            string AscDesc = null;

            if (!string.IsNullOrEmpty(e.Dir.ToString()))
            {
                AscDesc = e.Dir.ToString();
            }
            #endregion

            #region Sayfalama Başlangıcı
            int PS = e.Start;
            #endregion

            #region Sayfalama Limiti
            int PL = e.Limit;
            #endregion

            #region Toplam ve Liste Değişkenleri
            IList L1; //İlk Sonuç
            IList L2; //İkinci Sonuç
            #endregion

            #region Verileri Çek
            Veriler(PS, PL, s, Kolon, AscDesc, out L1, out L2);
            #endregion

            #region Toplam Kayıt Sayısı
            if (L1 != null)
            {
                e.Total = L1.Count;
            }
            #endregion

            #region Store Yükle
            if (L1 != null || L2 != null)
            {
                Store1.DataSource = L2;
                Store1.DataBind();
            }
            #endregion
        }

        public void YoneticiAdiYaz(Observable sender)
        {
            YoneticiAdi.Html = AdminClass.YoneticiAdi();
        }

        public void GridPanelYuklenmedenOnce(Observable sender)
        {
            GridPanel1.Icon = Icon.Layers;
            GridPanel1.Title = Window1.Title + " 'a ait kayıtlar listeleniyor...";
        }

        protected void ExportEt(object sender, DirectEventArgs e)
        {
            try
            {
                #region Gelen Veriyi Al ve JSON Yap
                object o = JSON.Deserialize<object>(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, e.ExtraParams["data"].ToString()));
                #endregion

                #region Tipi Al
                string tip = e.ExtraParams["format"].ToString();
                #endregion

                Class.Fonksiyonlar.Genel.Export(o, tip, SayfaAdi);
            }
            catch
            {
            }
        }

        #endregion
    }
}