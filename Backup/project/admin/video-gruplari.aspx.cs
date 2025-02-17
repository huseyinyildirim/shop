﻿using System;
using System.Collections;
using System.Collections.ObjectModel;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Linq.Dynamic;
using Ext.Net;
using LinqToCache;
using MySQLDataModel;


namespace SHOP.admin
{
    public partial class video_gruplari : System.Web.UI.Page
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
                    ResourceManager1.RegisterIcon(Icon.Error);
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

        #region Benim Yazdıklarım

        #region Node İşlemleri

        [DirectMethod]
        public void DM_NodeSurukle(string NodeID, string YeniUstKategori)
        {
            try
            {
                int INodeID = int.Parse(NodeID);

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_dosyalar_kategori tbk = (from p in db.tbl_dosyalar_kategori where p.id == INodeID select p).FirstOrDefault();
                    tbk.kategori_id = int.Parse(YeniUstKategori);
                    tbk.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                    db.SaveChanges();

                    #region Admin İşlem Log
                    Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(tbk)).EntityKey.EntitySetName.ToString(), tbk.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                    #endregion
                }

                Store1.DataBind();
            }
            catch (Exception Ex)
            {
                Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, "İşlem başarısız", Ex.Message);
            }
        }

        protected void NodeSil(object sender, DirectEventArgs e)
        {
            try
            {
                if (TreePanel1.CheckedNodes != null)
                {
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        foreach (var i in TreePanel1.CheckedNodes)
                        {
                            int INodeID = int.Parse(i.NodeID);

                            tbl_dosyalar_kategori tbk = (from p in db.tbl_dosyalar_kategori where p.id == INodeID select p).FirstOrDefault();
                            db.DeleteObject(tbk);

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(tbk)).EntityKey.EntitySetName.ToString(), INodeID, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                            #endregion

                            db.SaveChanges();
                            TreePanel1.RemoveNode(i.NodeID);
                        }
                    }

                    Store1.DataBind();
                }
            }
            catch (Exception Ex)
            {
                Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, "İşlem başarısız", Ex.Message);
            }
        }

        protected void NodeDegistir(object sender, DirectEventArgs e)
        {
            try
            {
                int INodeID = int.Parse(e.ExtraParams["id"].ToString());

                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_dosyalar_kategori tbk = (from p in db.tbl_dosyalar_kategori where p.id == INodeID select p).FirstOrDefault();

                    if (tbk.ad != e.ExtraParams["value"].ToString())
                    {
                        tbk.ad = e.ExtraParams["value"].ToString();
                        tbk.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(tbk)).EntityKey.EntitySetName.ToString(), tbk.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                        #endregion

                        Store1.DataBind();
                    }
                }
            }
            catch (Exception Ex)
            {
                Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, "İşlem başarısız", Ex.Message);
            }
        }

        [DirectMethod]
        public string DM_NodeYukle(string NodeID)
        {
            int INodeID = int.Parse(NodeID);
            TreeNodeCollection TNC = new TreeNodeCollection();

            if (!string.IsNullOrEmpty(NodeID))
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_dosyalar_kategori
                               where p.kategori_id == INodeID && p.tip == (int)Class.Sabitler.Dosya.Video
                               select
                                new
                                {
                                    p.ad,
                                    p.kategori_id,
                                    p.id,
                                    alt_kategori_sayisi = db.tbl_dosyalar_kategori.Where(k => k.kategori_id == p.id).Any()
                                });

                    foreach (var i in SQL)
                    {
                        if (i.alt_kategori_sayisi)
                        {
                            AsyncTreeNode ATN = new AsyncTreeNode();
                            ATN.Text = i.ad;
                            ATN.NodeID = i.id.ToString();
                            ATN.Expanded = true;
                            ATN.Checked = ThreeStateBool.False;
                            TNC.Add(ATN);
                        }
                        else
                        {
                            TreeNode TN = new TreeNode();
                            TN.Text = i.ad;
                            TN.NodeID = i.id.ToString();
                            TN.Expanded = true;
                            TN.Leaf = true;
                            TN.Checked = ThreeStateBool.False;
                            TNC.Add(TN);
                        }
                    }
                }
            }

            return TNC.ToJson();
        }

        #endregion

        #endregion

        #region Genel Fonksiyonlar

        protected void Veriler(int Baslangic, int Bitis, string s, string Kolon, string AscDesc, out IList Sonuc1, out IList Sonuc2)
        {
            #region Çalışan Hali
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                try
                {
                    #region Kolon Sorting Ayarı
                    string KolonAdi = null;
                    switch (Kolon)
                    {
                        #region Admin
                        case "ekleyen":
                            Kolon = "admin_id_ek";
                            KolonAdi = Kolon;
                            break;
                        #endregion

                        #region İşlem
                        case "guncelleyen":
                            Kolon = "admin_id_gun";
                            KolonAdi = Kolon;
                            break;
                        #endregion
                    }
                    #endregion

                    #region İlk SQL - SONUÇ 1

                    #region İlk (Ham) SQL
                    var SQL1 = (from p in db.tbl_dosyalar_kategori
                                where p.tip == (int)Class.Sabitler.Dosya.Video
                                select new
                                {
                                    p.aciklama,
                                    p.id,
                                    p.kategori_tip,
                                    p.ad,
                                    p.kategori_id,
                                    p.tarih_ek,
                                    p.tarih_gun,
                                    p.admin_id_ek,
                                    p.admin_id_gun
                                });
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
                        p.aciklama,
                        p.id,
                        kategori_tip = AdminClass.EvetHayir(p.kategori_tip),
                        p.ad,
                        p.kategori_id,
                        p.tarih_ek,
                        p.tarih_gun,
                        p.admin_id_ek,
                        p.admin_id_gun,
                        ekleyen = AdminClass.Admin(p.admin_id_ek),
                        guncelleyen = AdminClass.Admin(p.admin_id_gun),
                        ust_kategori = db.tbl_dosyalar_kategori.Where(k => k.id == p.kategori_id).Select(x => x.ad).FirstOrDefault()
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
                TreePanel1.ReloadAsyncNode("0", null);
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

        #region Yeni Kayıt İşlemleri

        protected void YeniKayitEkraniGetir(object sender, EventArgs e)
        {
            WindowEkle.Show();
        }

        protected void YeniKayitYap(object sender, DirectEventArgs e)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                if (TreePanel1.CheckedNodes != null)
                {
                    foreach (var i in TreePanel1.CheckedNodes)
                    {
                        tbl_dosyalar_kategori ta = new tbl_dosyalar_kategori();
                        ta.tip = (int)Class.Sabitler.Dosya.Video;
                        ta.kategori_id = int.Parse(i.NodeID);
                        ta.ad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldKategori.Text.Trim());

                        if (Ekle_TextAreaAciklama.Text != null)
                        {
                            if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextAreaAciklama.Text.Trim())))
                            {
                                ta.aciklama = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextAreaAciklama.Text.Trim());
                            }
                            else
                            {
                                ta.aciklama = null;
                            }
                        }

                        ta.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        db.AddTotbl_dosyalar_kategori(ta);
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                        #endregion
                    }
                }
                else
                {
                    tbl_dosyalar_kategori ta = new tbl_dosyalar_kategori();
                    ta.kategori_id = 0;
                    ta.tip = (int)Class.Sabitler.Dosya.Video;
                    ta.ad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldKategori.Text.Trim());

                    if (Ekle_TextAreaAciklama.Text != null)
                    {
                        if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextAreaAciklama.Text.Trim())))
                        {
                            ta.aciklama = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextAreaAciklama.Text.Trim());
                        }
                        else
                        {
                            ta.aciklama = null;
                        }
                    }

                    ta.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                    db.AddTotbl_dosyalar_kategori(ta);
                    db.SaveChanges();

                    #region Admin İşlem Log
                    Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                    #endregion
                }
            }

            RSM.ClearSelections();
            Store1.DataBind();
            TreePanel1.ReloadAsyncNode("0", null);

            WindowEkle.Hide();
        }

        #endregion

        #region Güncelleme İşlemleri

        [DirectMethod]
        public void DM_GuncellemeEkraniGetir(int ID)
        {
            Duzenle_ID.Text = ID.ToString();

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL2 = (from p in db.tbl_dosyalar_kategori
                            where p.id == ID
                            select new
                            {
                                p.ad,
                                p.aciklama
                            });

                if (SQL2.Any())
                {
                    Duzenle_TextFieldKategori.Text = SQL2.Select(x => x.ad).FirstOrDefault();
                    Duzenle_TextAreaAciklama.Text = SQL2.Select(x => x.aciklama).FirstOrDefault();
                    WindowDuzenle.Title = ID + " numaralı kaydı güncelle...";
                }
            }

            WindowDuzenle.Show();
        }

        protected void GuncellemeYap(object sender, DirectEventArgs e)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                int PID = int.Parse(Duzenle_ID.Text.Trim());
                tbl_dosyalar_kategori ta = (from p in db.tbl_dosyalar_kategori where p.id == PID select p).FirstOrDefault();
                ta.ad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldKategori.Text.Trim());

                if (Duzenle_TextAreaAciklama.Text != null)
                {
                    if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextAreaAciklama.Text.Trim())))
                    {
                        ta.aciklama = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextAreaAciklama.Text.Trim());
                    }
                    else
                    {
                        ta.aciklama = null;
                    }
                }

                ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                db.SaveChanges();

                #region Admin İşlem Log
                Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                #endregion
            }

            RSM.ClearSelections();
            Store1.DataBind();
            TreePanel1.ReloadAsyncNode("0", null);

            WindowDuzenle.Hide();
        }

        #endregion

        #region Silme İşlemleri

        [DirectMethod]
        public void DM_SecilenleriSil()
        {
            SecilenleriSil(null, null);
        }

        #region Alt Bardaki Butondan Gelenler

        protected void SecilenleriSil(object sender, EventArgs e)
        {
            if (RSM.SelectedRows.Count > 0)
            {
                for (int i = 0; i < RSM.SelectedRows.Count; i++)
                {
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        int PID = int.Parse(RSM.SelectedRows[i].RecordID);
                        tbl_dosyalar_kategori ta = (from p in db.tbl_dosyalar_kategori where p.id == PID select p).FirstOrDefault();
                        db.DeleteObject(ta);

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), PID, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                        #endregion

                        db.SaveChanges();
                        TreePanel1.RemoveNode(PID.ToString());
                    }
                }
            }

            RSM.ClearSelections();
            Store1.DataBind();
        }

        #endregion

        protected void KayitSil(object sender, EventArgs e)
        {
            if (((Ext.Net.AfterRecordDeletedEventArgs)(e)).Keys["id"].ToString() != null)
            {
                if (((Ext.Net.AfterRecordDeletedEventArgs)(e)).Keys["id"].ToString().Trim() != "")
                {
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        int PID = int.Parse(((Ext.Net.AfterRecordDeletedEventArgs)(e)).Keys["id"].ToString().Trim());
                        tbl_dosyalar_kategori ta = (from p in db.tbl_dosyalar_kategori where p.id == PID select p).FirstOrDefault();
                        db.DeleteObject(ta);

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), PID, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                        #endregion

                        db.SaveChanges();

                        TreePanel1.RemoveNode(PID.ToString());
                    }
                }

                Store1.DataBind();
            }
        }

        #endregion
    }
}