using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Linq.Dynamic;
using System.Text;
using System.Web;
using Ext.Net;
using LinqToCache;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class urunler : System.Web.UI.Page
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
                #region JS İçin İkon Yolu
                Class.Fonksiyonlar.JavaScript.Ekle("var IkonYolu = \"" + Class.Degiskenler.Site.Yollar.Bayrak.Replace(@"\", "\\\\") + "\";");
                #endregion

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

                #region Dil Seç
                if (!IsPostBack)
                {
                    AdminClass.StoreDoldurDil(StoreDil, true);
                }
                if (string.IsNullOrEmpty(ComboBoxDil.SelectedItem.Value))
                {
                    ComboBoxDil.SelectedItem.Value = AdminClass.AnaDilID();
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

        protected void StoreDoldurMarka(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL1 = (from p in db.tbl_markalar
                            where p.onay == true
                            select
                            new
                            {
                                p.id,
                                p.ad
                            });

                StoreAdi.DataSource = SQL1;
                StoreAdi.DataBind();
            }
        }

        protected void StoreDoldurKod(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL1 = (from p in db.tbl_kodlar
                            select
                            new
                            {
                                p.id,
                                p.kod
                            });

                StoreAdi.DataSource = SQL1;
                StoreAdi.DataBind();
            }
        }

        protected void StoreDoldurResim(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL1 = (from p in db.tbl_dosyalar
                            where p.tip == (int)Class.Sabitler.Dosya.Resim
                            select
                            new
                            {
                                p.id,
                                p.ad
                            });

                StoreAdi.DataSource = SQL1;
                StoreAdi.DataBind();
            }
        }

        // Para birimi basma
        protected void StoreDoldurParaBirim(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_sbt_para_birim
                            select
                            new
                            {
                                p.id,
                                p.simge
                            });

                StoreAdi.DataSource = SQL;
                StoreAdi.DataBind();
            }
        }

        // Kdv basma
        protected void StoreDoldurKdv(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_sbt_kdv
                           where p.id != 100
                           orderby p.sira descending
                           select
                           new
                           {
                               p.id,
                               p.ad
                           });

                StoreAdi.DataSource = SQL;
                StoreAdi.DataBind();
            }
        }

        // İndirim basma
        protected void StoreDoldurIndirim(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_indirimler
                           select
                           new
                           {
                               p.id,
                               p.ad
                           });

                StoreAdi.DataSource = SQL;
                StoreAdi.DataBind();
            }
        }

        // Kargo hesaplama tip basma
        protected void StoreDoldurKargoHesaplama(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_sbt_kargo_hesaplama_tip
                           select
                           new
                           {
                               p.id,
                               p.ad
                           });

                StoreAdi.DataSource = SQL;
                StoreAdi.DataBind();
            }
        }

        protected int EtiketID(string Etiket, int DilID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                int EID = (from p in db.tbl_etiketler
                           where p.ad == Etiket
                           select p.id).FirstOrDefault();

                if (EID == 0)
                {

                    tbl_etiketler ta = new tbl_etiketler();
                    ta.dil_id = DilID;
                    ta.ad = Class.Fonksiyonlar.Genel.KarakterTemizle(Etiket.Trim(), false);
                    ta.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                    db.AddTotbl_etiketler(ta);
                    db.SaveChanges();

                    #region Admin İşlem Log
                    Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                    #endregion

                    return ta.id;
                }
                else
                {
                    return EID;
                }
            }
        }

        [DirectMethod]
        public void DM_DilDegistir()
        {
            AdminClass.DilDegistir(RSM, Store1);
        }

        #region Ekleme Ekranı TreePanelleri
        [DirectMethod]
        public string DM_Ekle_NodeYukleKategoriler(string NodeID)
        {
            int INodeID = int.Parse(NodeID);
            int DilID;

            #region Otomatik Dil Seçimi
            if (ComboBoxDil.SelectedItem.Value == "-1")
            {
                DilID = int.Parse(AdminClass.AnaDilID());
            }
            else
            {
                DilID = int.Parse(ComboBoxDil.SelectedItem.Value);
            }
            #endregion

            TreeNodeCollection TNC = new TreeNodeCollection();

            if (!string.IsNullOrEmpty(NodeID))
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_kategoriler
                               where p.kategori_id == INodeID && p.dil_id == DilID
                               select
                                new
                                {
                                    p.ad,
                                    p.kategori_id,
                                    p.id,
                                    alt_kategori_sayisi = db.tbl_kategoriler.Where(k => k.kategori_id == p.id).Any()
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

        [DirectMethod]
        public string DM_Ekle_NodeYukleKategorilerResim(string NodeID)
        {
            int INodeID = int.Parse(NodeID);
            TreeNodeCollection TNC = new TreeNodeCollection();

            if (!string.IsNullOrEmpty(NodeID))
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_dosyalar_kategori
                               where p.kategori_id == INodeID && p.tip == (int)Class.Sabitler.Dosya.Resim
                               select
                                new
                                {
                                    p.ad,
                                    p.kategori_id,
                                    p.id,
                                    alt_kategori_sayisi = db.tbl_dosyalar_kategori.Where(k => k.kategori_id == p.id && p.tip == (int)Class.Sabitler.Dosya.Resim).Any()
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

        [DirectMethod]
        public string DM_Ekle_NodeYukleKategorilerVideo(string NodeID)
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
                                    alt_kategori_sayisi = db.tbl_dosyalar_kategori.Where(k => k.kategori_id == p.id && p.tip == (int)Class.Sabitler.Dosya.Video).Any()
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

        #region Düzenleme Ekranı TreePanelleri
        [DirectMethod]
        public string DM_Duzenle_NodeYukleKategoriler(string NodeID)
        {
            int INodeID = int.Parse(NodeID);
            int DilID = int.Parse(Duzenle_ComboBoxDil.SelectedItem.Value);
            TreeNodeCollection TNC = new TreeNodeCollection();

            if (!string.IsNullOrEmpty(NodeID))
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    int DosyaID = int.Parse(Duzenle_ID.Text.Trim());

                    var SQL = (from p in db.tbl_kategoriler
                               where p.kategori_id == INodeID && p.dil_id == DilID
                               select
                                new
                                {
                                    p.ad,
                                    p.kategori_id,
                                    p.id,
                                    alt_kategori_sayisi = db.tbl_kategoriler.Where(k => k.kategori_id == p.id).Any()
                                });

                    foreach (var i in SQL)
                    {
                        if (i.alt_kategori_sayisi)
                        {
                            AsyncTreeNode ATN = new AsyncTreeNode();
                            ATN.Text = i.ad;
                            ATN.NodeID = i.id.ToString();
                            ATN.Expanded = true;

                            if (KategoriKontrol(DosyaID, i.id))
                            {
                                ATN.Checked = ThreeStateBool.True;
                            }
                            else
                            {
                                ATN.Checked = ThreeStateBool.False;
                            }

                            TNC.Add(ATN);
                        }
                        else
                        {
                            TreeNode TN = new TreeNode();
                            TN.Text = i.ad;
                            TN.NodeID = i.id.ToString();
                            TN.Expanded = true;
                            TN.Leaf = true;

                            if (KategoriKontrol(DosyaID, i.id))
                            {
                                TN.Checked = ThreeStateBool.True;
                            }
                            else
                            {
                                TN.Checked = ThreeStateBool.False;
                            }

                            TNC.Add(TN);
                        }
                    }
                }
            }

            return TNC.ToJson();
        }

        [DirectMethod]
        public string DM_Duzenle_NodeYukleKategorilerResim(string NodeID)
        {
            int INodeID = int.Parse(NodeID);
            TreeNodeCollection TNC = new TreeNodeCollection();

            if (!string.IsNullOrEmpty(NodeID))
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from p in db.tbl_dosyalar_kategori
                               where p.kategori_id == INodeID && p.tip == (int)Class.Sabitler.Dosya.Resim
                               select
                                new
                                {
                                    p.ad,
                                    p.kategori_id,
                                    p.id,
                                    alt_kategori_sayisi = db.tbl_dosyalar_kategori.Where(k => k.kategori_id == p.id && p.tip == (int)Class.Sabitler.Dosya.Resim).Any()
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

        [DirectMethod]
        public string DM_Duzenle_NodeYukleKategorilerVideo(string NodeID)
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
                                    alt_kategori_sayisi = db.tbl_dosyalar_kategori.Where(k => k.kategori_id == p.id && p.tip == (int)Class.Sabitler.Dosya.Video).Any()
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

        protected string Kategoriler(int UrunID)
        {
            StringBuilder SB = new StringBuilder();

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_urunler_kategoriler
                           where p.urun_id == UrunID
                           select new
                           {
                               kat = (p.kategori_id != null ? db.tbl_kategoriler.Where(k => k.id == p.kategori_id).Select(k => k.ad).FirstOrDefault() : null)
                           });

                foreach (var i in SQL)
                {
                    SB.Append(i.kat);
                    SB.Append("<br/>");
                }
            }

            if (SB.Length > 1)
            {
                return SB.ToString().Substring(0, SB.ToString().Length - 5);
            }
            else
            {
                return null;
            }
        }

        protected string Etiketler(int UrunID)
        {
            StringBuilder SB = new StringBuilder();

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_urunler_etiketler
                           where p.urun_id == UrunID
                           select new
                           {
                               etk = (p.etiket_id != null ? db.tbl_etiketler.Where(k => k.id == p.etiket_id).Select(k => k.ad).FirstOrDefault() : null)
                           });

                foreach (var i in SQL)
                {
                    SB.Append(i.etk);
                    SB.Append("<br/>");
                }
            }

            if (SB.Length > 1)
            {
                return SB.ToString().Substring(0, SB.ToString().Length - 5);
            }
            else
            {
                return null;
            }
        }

        protected string Markalar(int UrunID)
        {
            StringBuilder SB = new StringBuilder();

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_urunler_markalar
                           where p.urun_id == UrunID
                           select new
                           {
                               mar = (p.marka_id != null ? db.tbl_markalar.Where(k => k.id == p.marka_id).Select(k => k.ad).FirstOrDefault() : null)
                           });

                foreach (var i in SQL)
                {
                    SB.Append(i.mar);
                    SB.Append("<br/>");
                }
            }

            if (SB.Length > 1)
            {
                return SB.ToString().Substring(0, SB.ToString().Length - 5);
            }
            else
            {
                return null;
            }
        }

        protected List<int> KategorilerList(int UrunID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                return (from p in db.tbl_urunler_kategoriler
                        where p.urun_id == UrunID
                        select p.kategori_id).Cast<int>().ToList();
            }
        }

        protected List<int> EtiketlerList(int UrunID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                return (from p in db.tbl_urunler_etiketler
                        where p.urun_id == UrunID
                        select p.etiket_id).Cast<int>().ToList();
            }
        }

        protected List<int> MarkalarList(int UrunID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                return (from p in db.tbl_urunler_markalar
                        where p.urun_id == UrunID
                        select p.marka_id).Cast<int>().ToList();
            }
        }

        protected bool KategoriKontrol(int UrunID, int KategoriID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_urunler_kategoriler
                             where p.urun_id == UrunID && p.kategori_id == KategoriID
                             select p.id);

                if (SQL.Any())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        protected bool MarkaKontrol(int UrunID, int MarkaID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_urunler_markalar
                             where p.urun_id == UrunID && p.marka_id == MarkaID
                             select p.id);

                if (SQL.Any())
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        //protected bool ResimVideoKategoriKontrol(int ResimID, int KategoriID)
        //{
        //    using (BaglantiCumlesi db = new BaglantiCumlesi())
        //    {
        //        int VarMi = (from p in db.tbl_dosyalar_kategoriler
        //                     where p.dosya_id == ResimID && p.kategori_id == KategoriID
        //                     select p.id).Count();

        //        if (VarMi > 0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //}

        protected void Ekle_DileGoreKategoriYukle(object sender, EventArgs e)
        {
            Ekle_TreePanelKategoriler.ReloadAsyncNode("0", null);
        }

        protected void Duzenle_DileGoreKategoriYukle(object sender, EventArgs e)
        {
            Duzenle_TreePanelKategoriler.ReloadAsyncNode("0", null);
        }

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
                    var SQL0 = (db.tbl_urunler).AsEnumerable();

                    #region Dil ID Geldiyse
                    int DilID = int.Parse(ComboBoxDil.SelectedItem.Value);
                    if (DilID > -1)
                    {
                        SQL0 = SQL0.Where(p => p.dil_id == DilID);
                    }
                    #endregion

                    var SQL1 = (from p in SQL0
                                select new
                                {
                                    p.id,
                                    p.dil_id,
                                    p.kod_id,
                                    p.resim_id,
                                    p.resim_kategori_id,
                                    p.video_kategori_id,
                                    p.ad,
                                    p.on_aciklama,
                                    p.anasayfa,
                                    p.tarih_ek,
                                    p.tarih_gun,
                                    p.admin_id_ek,
                                    p.admin_id_gun,
                                    p.onay
                                }).AsQueryable();
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
                    //D = new Dictionary<int, ObjectQuery<int?>>(SQL4.Select(k => k.id)., SQL4.Select(k => k.ad));

                    var SQL3 = SQL2.Skip(Baslangic).Take(Bitis).Select(p => new
                    {
                        p.id,
                        p.dil_id,
                        p.kod_id,
                        kod = (p.kod_id != null ? db.tbl_kodlar.Where(k => k.id == p.kod_id).Select(x => x.kod).FirstOrDefault() : null),
                        p.resim_id,
                        resim = (p.resim_id != null ? db.tbl_dosyalar.Where(k => k.id == p.resim_id).Select(x => x.ad).FirstOrDefault() : null),
                        p.resim_kategori_id,
                        resim_kategori = (p.resim_kategori_id != null ? db.tbl_dosyalar_kategori.Where(k => k.id == p.resim_kategori_id && k.tip == (int)Class.Sabitler.Dosya.Resim).Select(x => x.ad).FirstOrDefault() : null),
                        p.video_kategori_id,
                        video_kategori = (p.video_kategori_id != null ? db.tbl_dosyalar_kategori.Where(k => k.id == p.video_kategori_id && k.tip == (int)Class.Sabitler.Dosya.Video).Select(x => x.ad).FirstOrDefault() : null),
                        p.ad,
                        p.on_aciklama,
                        anasayfa = AdminClass.EvetHayir(p.anasayfa),
                        ziyaret = db.tbl_ziyaretler.Where(k => k.urun_id == p.id).Count(),
                        kategori = Kategoriler(p.id),
                        etiket = Etiketler(p.id),
                        marka = Markalar(p.id),
                        p.tarih_ek,
                        p.tarih_gun,
                        ekleyen = AdminClass.Admin(p.admin_id_ek),
                        guncelleyen = AdminClass.Admin(p.admin_id_gun),
                        dil = AdminClass.Dil(p.dil_id),
                        onay = AdminClass.EvetHayir(p.onay)
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

        #region Yeni Kayıt İşlemleri

        protected void YeniKayitEkraniGetir(object sender, EventArgs e)
        {
            AdminClass.StoreDoldurDil(StoreDil1, false);
            StoreDoldurMarka(StoreMarka1);
            StoreDoldurKod(StoreKod1);
            StoreDoldurResim(StoreResim1);
            StoreDoldurParaBirim(StoreParaBirim1);
            StoreDoldurKdv(StoreKdv1);
            StoreDoldurIndirim(StoreIndirim1);
            StoreDoldurKargoHesaplama(StoreKargoHesaplama1);

            #region Otomatik Dil Seçimi
            if (ComboBoxDil.SelectedItem.Value == "-1")
            {
                Ekle_ComboBoxDil.SelectedItem.Value = AdminClass.AnaDilID();
            }
            else
            {
                Ekle_ComboBoxDil.SelectedItem.Value = ComboBoxDil.SelectedItem.Value;
            }
            #endregion

            WindowEkle.Show();
        }

        protected void YeniKayitYap(object sender, DirectEventArgs e)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                #region Onay Boolean Çevirme
                bool OnayBool = false;
                string CO = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxOnay.Value.ToString().Trim());
                if (CO == "1")
                {
                    OnayBool = true;
                }
                #endregion

                tbl_urunler ta = new tbl_urunler();
                ta.dil_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxDil.Value.ToString().Trim()));
                ta.ad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldAd.Text.Trim()).ToUpper();

                if (Ekle_ComboBoxKod.Value != null)
                {
                    ta.kod_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxKod.Value.ToString().Trim()));
                }

                if (Ekle_ComboBoxResim.Value != null)
                {
                    ta.resim_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxResim.Value.ToString().Trim()));
                }

                if (Ekle_TreePanelKategorilerResim.CheckedNodes != null)
                {
                    ta.resim_kategori_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TreePanelKategorilerResim.CheckedNodes[0].NodeID));
                }

                if (Ekle_TreePanelKategorilerVideo.CheckedNodes != null)
                {
                    ta.video_kategori_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TreePanelKategorilerVideo.CheckedNodes[0].NodeID));
                }

                ta.on_aciklama = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextAreaOnAciklama.Text.Trim()).Replace("\r\n", "<br/>" + Class.Degiskenler.Diger.vbCrLf);

                if (!string.IsNullOrEmpty(Ekle_HtmlEditorAciklama.Value.ToString().Trim()))
                {
                    ta.aciklama = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_HtmlEditorAciklama.Value.ToString().Trim());
                }
                else
                {
                    ta.aciklama = ta.on_aciklama;
                }

                // HY 31.10.2012 19:30 Fiyat bilgileri kayıt ediliyor
                #region fiyat bilgileri kayıt ediliyor

                string fiyat = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldFiyat.Text.Trim());
                string kdv = SHOPClass.Fonksiyonlar.Genel.KdvYuzde(int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxKdv.Value.ToString().Trim()))).ToString();

                if (Convert.ToBoolean(Ekle_CheckboxKdvDahilMi.Value.ToString()))
                {
                    ta.fiyat = double.Parse(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(fiyat, kdv, SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonAyir, 0)));
                }
                else
                {
                    ta.fiyat = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldFiyat.Text.Trim()));
                }

                if (Ekle_ComboBoxParaBirim.Value != null)
                {
                    ta.para_birimi_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxParaBirim.Value.ToString().Trim()));
                }
                if (Ekle_ComboBoxKdv.Value != null)
                {
                    ta.kdv_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxKdv.Value.ToString().Trim()));
                }
                if (Ekle_ComboBoxIndirim.Value != null)
                {
                    ta.indirim_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxIndirim.Value.ToString().Trim()));
                }
                #endregion

                #region kargo bilgileri kayıt ediliyor
                if (Ekle_TextFieldEn.Text.Trim() != "")
                {
                    ta.en = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldEn.Text.Trim()));
                }
                if (Ekle_TextFieldBoy.Text.Trim() != "")
                {
                    ta.boy = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldBoy.Text.Trim()));
                }
                if (Ekle_TextFieldYukseklik.Text.Trim() != "")
                {
                    ta.yukseklik = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldYukseklik.Text.Trim()));
                }
                if (Ekle_TextFieldDesi.Text.Trim() != "")
                {
                    ta.desi = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldDesi.Text.Trim()));
                }
                if (Ekle_TextFieldKg.Text.Trim() != "")
                {
                    ta.kg = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldKg.Text.Trim()));
                }
                if (Ekle_ComboBoxKargoHesaplama.Value != null)
                {
                    ta.kargo_hesaplama_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxKargoHesaplama.Value.ToString().Trim()));
                }
                #endregion

                #region SHOP İçin Gerekli Olan ve Mecburen Eklenen Alanlar
                //ta.para_birimi_id = 999;
                //ta.kargo_hesaplama_id = 1;
                #endregion

                ta.stok = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxStok.Value.ToString().Trim()));
                ta.yeni = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxYeni.Value.ToString().Trim()));
                ta.anasayfa = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxAnasayfa.Value.ToString().Trim()));
                ta.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                ta.onay = OnayBool;
                db.AddTotbl_urunler(ta);
                db.SaveChanges();

                #region Admin İşlem Log
                Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                #endregion

                #region Markalar Kayıt
                foreach (SelectedListItem v in Ekle_MultiComboMarka.SelectedItems)
                {
                    tbl_urunler_markalar ta2 = new tbl_urunler_markalar();
                    ta2.urun_id = ta.id;
                    ta2.marka_id = int.Parse(v.Value);
                    ta2.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                    db.AddTotbl_urunler_markalar(ta2);
                    db.SaveChanges();

                    #region Admin İşlem Log
                    Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta2)).EntityKey.EntitySetName.ToString(), ta2.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                    #endregion
                }
                #endregion

                #region Kategoriler Kayıt
                if (Ekle_TreePanelKategoriler.CheckedNodes != null)
                {
                    foreach (var i in Ekle_TreePanelKategoriler.CheckedNodes)
                    {
                        tbl_urunler_kategoriler ta3 = new tbl_urunler_kategoriler();
                        ta3.urun_id = ta.id;
                        ta3.kategori_id = int.Parse(i.NodeID);
                        ta3.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        db.AddTotbl_urunler_kategoriler(ta3);
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta3)).EntityKey.EntitySetName.ToString(), ta3.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                        #endregion
                    }
                }
                #endregion

                #region Etiket Kayıt
                List<string> Etiketler = new List<string>(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldEtiketler.Text.Trim())).ToLower().Split(',').ToList());

                if (Etiketler.Count > 0)
                {
                    foreach (var i in Etiketler)
                    {
                        if (!string.IsNullOrEmpty(i.ToString()))
                        {
                            tbl_urunler_etiketler ta4 = new tbl_urunler_etiketler();
                            ta4.urun_id = ta.id;
                            ta4.etiket_id = EtiketID(i.ToString().Trim(), int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_ComboBoxDil.Value.ToString().Trim())));
                            ta4.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                            db.AddTotbl_urunler_etiketler(ta4);
                            db.SaveChanges();

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta4)).EntityKey.EntitySetName.ToString(), ta4.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                            #endregion
                        }
                    }
                }
                #endregion
            }

            RSM.ClearSelections();
            Store1.DataBind();

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
                var SQL2 = (from p in db.tbl_urunler
                            where p.id == ID
                            select new
                            {
                                p.id,
                                p.dil_id,
                                p.onay,
                                p.anasayfa,
                                p.on_aciklama,
                                p.aciklama,
                                p.ad,
                                p.resim_id,
                                p.resim_kategori_id,
                                p.video_kategori_id,
                                p.kod_id,
                                p.fiyat,
                                p.para_birimi_id,
                                p.kdv_id,
                                p.indirim_id,
                                p.en,
                                p.boy,
                                p.yukseklik,
                                p.desi,
                                p.kg,
                                p.kargo_hesaplama_id,
                                p.stok,
                                p.yeni
                            });

                if (SQL2.Any())
                {
                    AdminClass.StoreDoldurDil(StoreDil2, false);
                    StoreDoldurMarka(StoreMarka2);
                    StoreDoldurKod(StoreKod2);
                    StoreDoldurResim(StoreResim2);
                    StoreDoldurParaBirim(StoreParaBirim2);
                    StoreDoldurKdv(StoreKdv2);
                    StoreDoldurIndirim(StoreIndirim2);
                    StoreDoldurKargoHesaplama(StoreKargoHesaplama2);

                    Duzenle_LabelMarka.Html = Markalar(SQL2.Select(x => x.id).FirstOrDefault());

                    Duzenle_ComboBoxDil.SelectedItem.Value = SQL2.Select(x => x.dil_id).FirstOrDefault().ToString();

                    if (!string.IsNullOrEmpty(SQL2.Select(x => x.kod_id).FirstOrDefault().ToString()))
                    {
                        Duzenle_ComboBoxKod.SelectedItem.Value = SQL2.Select(x => x.kod_id).FirstOrDefault().ToString();
                    }

                    Duzenle_TextFieldAd.Text = SQL2.Select(x => x.ad).FirstOrDefault();

                    if (!string.IsNullOrEmpty(SQL2.Select(x => x.resim_id).FirstOrDefault().ToString()))
                    {
                        Duzenle_ComboBoxResim.SelectedItem.Value = SQL2.Select(x => x.resim_id).FirstOrDefault().ToString();
                    }

                    #region Fiyat bilgileri
                    Duzenle_TextFieldFiyat.Text = SQL2.Select(x => x.fiyat).FirstOrDefault().ToString();

                    if (!string.IsNullOrEmpty(SQL2.Select(x => x.kdv_id).FirstOrDefault().ToString()))
                    {
                        Duzenle_ComboBoxKdv.SelectedItem.Value= SQL2.Select(x => x.kdv_id).FirstOrDefault().ToString();
                    }

                    if (!string.IsNullOrEmpty(SQL2.Select(x => x.para_birimi_id).FirstOrDefault().ToString()))
                    {
                        Duzenle_ComboBoxParaBirim.SelectedItem.Value = SQL2.Select(x => x.para_birimi_id).FirstOrDefault().ToString();
                    }

                    if (!string.IsNullOrEmpty(SQL2.Select(x => x.indirim_id).FirstOrDefault().ToString()))
                    {
                        Duzenle_ComboBoxIndirim.SelectedItem.Value = SQL2.Select(x => x.indirim_id).FirstOrDefault().ToString();
                    }
                    #endregion

                    #region Kargo bilgileri
                    Duzenle_TextFieldEn.Text = SQL2.Select(x => x.en).FirstOrDefault().ToString();
                    Duzenle_TextFieldBoy.Text = SQL2.Select(x => x.boy).FirstOrDefault().ToString();
                    Duzenle_TextFieldYukseklik.Text = SQL2.Select(x => x.yukseklik).FirstOrDefault().ToString();
                    Duzenle_TextFieldDesi.Text = SQL2.Select(x => x.desi).FirstOrDefault().ToString();
                    Duzenle_TextFieldKg.Text = SQL2.Select(x => x.kg).FirstOrDefault().ToString();

                    if (!string.IsNullOrEmpty(SQL2.Select(x => x.kargo_hesaplama_id).FirstOrDefault().ToString()))
                    {
                        Duzenle_ComboBoxKargoHesaplama.SelectedItem.Value = SQL2.Select(x => x.kargo_hesaplama_id).FirstOrDefault().ToString();
                    }
                    #endregion

                    #region Kategoriler
                    string Kat = Kategoriler(SQL2.Select(x => x.id).FirstOrDefault());

                    if (!string.IsNullOrEmpty(Kat))
                    {
                        Kat = Kat.Replace("<br/>", ",");
                        Duzenle_DropDownFieldKategoriler.SetValue(Kat);
                    }
                    else
                    {
                        Duzenle_DropDownFieldKategoriler.Clear();
                        Duzenle_DropDownFieldKategoriler.SetValue("");
                    }
                    #endregion

                    #region Resim Kategori
                    Duzenle_LabelResimKategori.Text = (SQL2.Select(x => x.resim_kategori_id).FirstOrDefault() != null ? db.tbl_dosyalar_kategori.Where(k => k.id == SQL2.Select(x => x.resim_kategori_id).FirstOrDefault() && k.tip == (int)Class.Sabitler.Dosya.Resim).Select(x => x.ad).FirstOrDefault() : null);

                    /*
                    if (!string.IsNullOrEmpty(Duzenle_LabelResimKategori.Text.Trim()))
                    {
                        Duzenle_DropDownFieldKategorilerResim.Text = Duzenle_LabelResimKategori.Text.Trim();
                    }
                    */
                    #endregion

                    #region Video Kategori
                    Duzenle_LabelVideoKategori.Text = (SQL2.Select(x => x.video_kategori_id).FirstOrDefault() != null ? db.tbl_dosyalar_kategori.Where(k => k.id == SQL2.Select(x => x.video_kategori_id).FirstOrDefault() && k.tip == (int)Class.Sabitler.Dosya.Video).Select(x => x.ad).FirstOrDefault() : null);

                    /*
                    if (!string.IsNullOrEmpty(Duzenle_LabelVideoKategori.Text.Trim()))
                    {
                        Duzenle_DropDownFieldKategorilerVideo.Text = Duzenle_LabelVideoKategori.Text.Trim();
                    }
                    */
                    #endregion

                    #region Etiketler
                    string Etk = Etiketler(SQL2.Select(x => x.id).FirstOrDefault());

                    if (!string.IsNullOrEmpty(Etk))
                    {
                        Etk = Etk.Replace("<br/>", ",");
                        Duzenle_TextFieldEtiketler.Text = Etk;
                    }
                    else
                    {
                        Duzenle_TextFieldEtiketler.Clear();
                    }
                    #endregion

                    Duzenle_TextAreaOnAciklama.Text = SQL2.Select(x => x.on_aciklama).FirstOrDefault().Replace("<br/>", Class.Degiskenler.Diger.vbCrLf);
                    Duzenle_HtmlEditorAciklama.Text = SQL2.Select(x => x.aciklama).FirstOrDefault();

                    Duzenle_ComboBoxStok.SelectedItem.Value = Class.Fonksiyonlar.Genel.Cevirmeler.BoolToInteger(SQL2.Select(x => x.stok).FirstOrDefault());
                    Duzenle_ComboBoxYeni.SelectedItem.Value = Class.Fonksiyonlar.Genel.Cevirmeler.BoolToInteger(SQL2.Select(x => x.yeni).FirstOrDefault());
                    Duzenle_ComboBoxAnasayfa.SelectedItem.Value = Class.Fonksiyonlar.Genel.Cevirmeler.BoolToInteger(SQL2.Select(x => x.anasayfa).FirstOrDefault());
                    Duzenle_ComboBoxOnay.SelectedItem.Value = Class.Fonksiyonlar.Genel.Cevirmeler.BoolToInteger(SQL2.Select(x => x.onay).FirstOrDefault());

                    WindowDuzenle.Title = ID + " numaralı kaydı güncelle...";
                }
            }

            WindowDuzenle.Show();
        }

        protected void GuncellemeYap(object sender, DirectEventArgs e)
        {
            #region Onay Boolean Çevirme
            bool OnayBool = false;
            string CO = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxOnay.Value.ToString().Trim());
            if (CO == "1")
            {
                OnayBool = true;
            }
            #endregion

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                int PID = int.Parse(Duzenle_ID.Text.Trim());
                tbl_urunler ta1 = (from p in db.tbl_urunler where p.id == PID select p).FirstOrDefault();
                ta1.dil_id = int.Parse(Duzenle_ComboBoxDil.SelectedItem.Value.ToString());

                ta1.ad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldAd.Text.Trim()).ToUpper();

                // HY 31.10.2012 19:30 Fiyat bilgileri kayıt ediliyor
                #region fiyat bilgileri kayıt ediliyor
                //ta1.fiyat = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldFiyat.Text.Trim()));

                string fiyat = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldFiyat.Text.Trim());
                string kdv = SHOPClass.Fonksiyonlar.Genel.KdvYuzde(int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxKdv.Value.ToString().Trim()))).ToString();

                if (Convert.ToBoolean(Duzenle_CheckboxKdvDahilMi.Value.ToString()))
                {
                    ta1.fiyat = double.Parse(SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(fiyat, kdv, SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.KomisyonAyir, 0)));
                }
                else
                {
                    ta1.fiyat = double.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldFiyat.Text.Trim()));
                }

                if (Duzenle_ComboBoxParaBirim.Value != null)
                {
                    ta1.para_birimi_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxParaBirim.Value.ToString().Trim()));
                }
                if (Duzenle_ComboBoxKdv.Value != null)
                {
                    ta1.kdv_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxKdv.Value.ToString().Trim()));
                }
                if (Duzenle_ComboBoxIndirim.Value != null)
                {
                    ta1.indirim_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxIndirim.Value.ToString().Trim()));
                }
                #endregion

                #region kargo bilgileri kayıt ediliyor
                if (Duzenle_TextFieldEn.Text.Trim() != "")
                {
                    ta1.en = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldEn.Text.Trim()));
                }
                if (Duzenle_TextFieldBoy.Text.Trim() != "")
                {
                    ta1.boy = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldBoy.Text.Trim()));
                }
                if (Duzenle_TextFieldYukseklik.Text.Trim() != "")
                {
                    ta1.yukseklik = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldYukseklik.Text.Trim()));
                }
                if (Duzenle_TextFieldDesi.Text.Trim() != "")
                {
                    ta1.desi = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldDesi.Text.Trim()));
                }
                if (Duzenle_TextFieldKg.Text.Trim() != "")
                {
                    ta1.kg = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldKg.Text.Trim()));
                }
                if (Duzenle_ComboBoxKargoHesaplama.Value != null)
                {
                    ta1.kargo_hesaplama_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxKargoHesaplama.Value.ToString().Trim()));
                }
                #endregion

                #region Kod
                if (Duzenle_ComboBoxKod.Value != null)
                {
                    if (!string.IsNullOrEmpty(Duzenle_ComboBoxKod.Value.ToString().Trim()))
                    {
                        ta1.kod_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxKod.Value.ToString().Trim()));
                    }
                    else
                    {
                        ta1.kod_id = null;
                    }
                }
                else
                {
                    ta1.kod_id = null;
                }
                #endregion

                #region Resim
                if (Duzenle_ComboBoxResim.Value != null)
                {
                    if (!string.IsNullOrEmpty(Duzenle_ComboBoxResim.Value.ToString().Trim()))
                    {
                        ta1.resim_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxResim.Value.ToString().Trim()));
                    }
                    else
                    {
                        ta1.resim_id = null;
                    }
                }
                else
                {
                    ta1.resim_id = null;
                }
                #endregion

                #region Resim Kategori
                if (Convert.ToBoolean(Duzenle_ChecboxResimKategori.Value.ToString()))
                {
                    if (Duzenle_TreePanelKategorilerResim.CheckedNodes != null)
                    {
                        ta1.resim_kategori_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TreePanelKategorilerResim.CheckedNodes[0].NodeID));
                    }
                    else
                    {
                        ta1.resim_kategori_id = null;
                    }
                }
                else
                {
                    ta1.resim_kategori_id = null;
                }
                #endregion

                #region Video Kategori
                if (Convert.ToBoolean(Duzenle_ChecboxResimKategori.Value.ToString()))
                {
                    if (Duzenle_TreePanelKategorilerVideo.CheckedNodes != null)
                    {
                        ta1.video_kategori_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TreePanelKategorilerVideo.CheckedNodes[0].NodeID));
                    }
                    else
                    {
                        ta1.video_kategori_id = null;
                    }
                }
                else
                {
                    ta1.video_kategori_id = null;
                }
                #endregion

                ta1.on_aciklama = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextAreaOnAciklama.Text.Trim()).Replace("\r\n", "<br/>");

                #region Açıklama
                if (!string.IsNullOrEmpty(Duzenle_HtmlEditorAciklama.Value.ToString().Trim()))
                {
                    ta1.aciklama = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_HtmlEditorAciklama.Value.ToString().Trim());
                }
                else
                {
                    ta1.aciklama = ta1.on_aciklama;
                }
                #endregion

                ta1.stok = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxStok.Value.ToString().Trim()));
                ta1.yeni = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxYeni.Value.ToString().Trim()));
                ta1.anasayfa = Class.Fonksiyonlar.Genel.Cevirmeler.StringToBool(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxAnasayfa.Value.ToString().Trim()));
                ta1.onay = OnayBool;
                ta1.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                db.SaveChanges();

                #region Admin İşlem Log
                Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta1)).EntityKey.EntitySetName.ToString(), ta1.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                #endregion

                #region Markalar Kayıt
                if (Convert.ToBoolean(Duzenle_ChecboxMarka.Value.ToString()))
                {
                    #region Eski Kayıtları Sil
                    List<int> ListMarkalar = MarkalarList(ta1.id);

                    if (ListMarkalar.Count > 0)
                    {
                        foreach (var j in ListMarkalar)
                        {
                            tbl_urunler_markalar tta1 = (from p in db.tbl_urunler_markalar where p.marka_id == j && p.urun_id == ta1.id select p).FirstOrDefault();
                            db.DeleteObject(tta1);

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(tta1)).EntityKey.EntitySetName.ToString(), j, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                            #endregion

                            db.SaveChanges();
                        }
                    }
                    #endregion

                    #region Yenileri Kaydet
                    foreach (SelectedListItem v in Duzenle_MultiComboMarka.SelectedItems)
                    {
                        if (!MarkaKontrol(ta1.id, int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, v.Value))))
                        {
                            tbl_urunler_markalar ta2 = new tbl_urunler_markalar();
                            ta2.urun_id = ta1.id;
                            ta2.marka_id = int.Parse(v.Value);
                            ta2.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                            db.AddTotbl_urunler_markalar(ta2);
                            db.SaveChanges();

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta2)).EntityKey.EntitySetName.ToString(), ta2.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                            #endregion
                        }
                    }
                    #endregion
                }
                #endregion

                #region Kategoriler Kayıt
                if (Duzenle_TreePanelKategoriler.CheckedNodes != null)
                {
                    #region Eski Kayıtları Sil
                    List<int> ListKategoriler = KategorilerList(ta1.id);

                    if (ListKategoriler.Count > 0)
                    {
                        foreach (var j in ListKategoriler)
                        {
                            tbl_urunler_kategoriler tta2 = (from p in db.tbl_urunler_kategoriler where p.kategori_id == j && p.urun_id == ta1.id select p).FirstOrDefault();
                            db.DeleteObject(tta2);

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(tta2)).EntityKey.EntitySetName.ToString(), j, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                            #endregion

                            db.SaveChanges();
                        }
                    }
                    #endregion

                    #region Yenileri Kaydet
                    foreach (var i in Duzenle_TreePanelKategoriler.CheckedNodes)
                    {
                        if (!KategoriKontrol(ta1.id, int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, i.NodeID))))
                        {
                            #region Dosyayı Eklenen Kategoriye Ata
                            tbl_urunler_kategoriler ta3 = new tbl_urunler_kategoriler();
                            ta3.urun_id = ta1.id;
                            ta3.kategori_id = int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, i.NodeID));
                            ta3.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                            db.AddTotbl_urunler_kategoriler(ta3);
                            db.SaveChanges();

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta3)).EntityKey.EntitySetName.ToString(), ta3.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                            #endregion
                            #endregion
                        }
                    }
                    #endregion
                }
                #endregion

                #region Etiket Kayıt

                #region Eski Kayıtları Sil
                List<int> ListEtiketler = EtiketlerList(ta1.id);

                if (ListEtiketler.Count > 0)
                {
                    foreach (var j in ListEtiketler)
                    {
                        tbl_urunler_etiketler tta3 = (from p in db.tbl_urunler_etiketler where p.etiket_id == j && p.urun_id == ta1.id select p).FirstOrDefault();
                        db.DeleteObject(tta3);

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(tta3)).EntityKey.EntitySetName.ToString(), j, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                        #endregion

                        db.SaveChanges();
                    }
                }
                #endregion

                #region Yenileri Kaydet
                List<string> Etiketler = new List<string>(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldEtiketler.Text.Trim())).ToLower().Split(',').ToList());

                if (Etiketler.Count > 0)
                {
                    foreach (var i in Etiketler)
                    {
                        if (!string.IsNullOrEmpty(i.ToString()))
                        {
                            tbl_urunler_etiketler ta4 = new tbl_urunler_etiketler();
                            ta4.urun_id = ta1.id;
                            ta4.etiket_id = EtiketID(i.ToString().Trim(), int.Parse(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_ComboBoxDil.Value.ToString().Trim())));
                            ta4.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                            db.AddTotbl_urunler_etiketler(ta4);
                            db.SaveChanges();

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta4)).EntityKey.EntitySetName.ToString(), ta4.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                            #endregion
                        }
                    }
                }
                #endregion
                #endregion
            }

            RSM.ClearSelections();
            Store1.DataBind();

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
                        tbl_urunler ta = (from p in db.tbl_urunler where p.id == PID select p).FirstOrDefault();
                        db.DeleteObject(ta);

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                        #endregion

                        db.SaveChanges();
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
                        tbl_urunler ta = (from p in db.tbl_urunler where p.id == PID select p).FirstOrDefault();
                        db.DeleteObject(ta);

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                        #endregion

                        db.SaveChanges();
                    }

                }
            }

            Store1.DataBind();
        }

        #endregion

        #region Onay İşlemleri

        #region Alt Bardaki Butondan Gelenler

        protected void SecilenleriOnayla(object sender, EventArgs e)
        {
            DM_OnayVer(-1);
        }

        protected void SecilenleriOnaysizYap(object sender, EventArgs e)
        {
            DM_OnayKaldir(-1);
        }

        #endregion

        [DirectMethod]
        public void DM_OnayKaldir(int ID)
        {
            if (ID == -1)
            {
                if (RSM.SelectedRows.Count > 0)
                {
                    for (int i = 0; i < RSM.SelectedRows.Count; i++)
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            int PID = int.Parse(RSM.SelectedRows[i].RecordID);
                            tbl_urunler ta = (from p in db.tbl_urunler where p.id == PID select p).FirstOrDefault();

                            if (ta.onay)
                            {
                                ta.onay = false;
                                ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                                db.SaveChanges();

                                #region Admin İşlem Log
                                Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                                #endregion
                            }
                        }
                    }
                }
            }
            else
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_urunler ta = (from p in db.tbl_urunler where p.id == ID select p).FirstOrDefault();

                    if (ta.onay)
                    {
                        ta.onay = false;
                        ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                        #endregion
                    }
                }
            }

            RSM.ClearSelections();
            Store1.DataBind();
        }

        [DirectMethod]
        public void DM_OnayVer(int ID)
        {
            if (ID == -1)
            {
                if (RSM.SelectedRows.Count > 0)
                {
                    for (int i = 0; i < RSM.SelectedRows.Count; i++)
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            int PID = int.Parse(RSM.SelectedRows[i].RecordID);
                            tbl_urunler ta = (from p in db.tbl_urunler where p.id == PID select p).FirstOrDefault();

                            if (!ta.onay)
                            {
                                ta.onay = true;
                                ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                                db.SaveChanges();

                                #region Admin İşlem Log
                                Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), PID, (int)Class.Sabitler.AdminLog.Islemler.Update);
                                #endregion
                            }
                        }
                    }
                }
            }
            else
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_urunler ta = (from p in db.tbl_urunler where p.id == ID select p).FirstOrDefault();

                    if (!ta.onay)
                    {
                        ta.onay = true;
                        ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                        #endregion
                    }
                }
            }

            RSM.ClearSelections();
            Store1.DataBind();
        }

        #endregion

        #region Dosya Yükleme İşlemleri

        protected void DosyaYuklemeEkraniGetir(object sender, EventArgs e)
        {
            WindowResimYukle.Show();
        }

        public void DosyaGonderClick(object sender, DirectEventArgs e)
        {
            if (gonderilecek_dosya.PostedFile.FileName.Trim() != "")
            {
                DosyaGonder();
            }
            else
            {
                Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, "İşlem başarısız", "İlgili dosya yüklenemedi!<br/>Lütfen yeniden deneyiniz.");
                return;
            }
        }

        protected void DosyaGonder()
        {
            Objeler.Tanimlar.Messages M = AdminClass.DosyaGonder(gonderilecek_dosya, Class.Degiskenler.Site.Yollar.Urun);
            HttpPostedFile GelenDosya = gonderilecek_dosya.PostedFile;

            switch (M.Type)
            {
                case Class.Sabitler.MessageTypes.OK:
                    #region İşlem Başarıyla
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        string YeniKategori = DateTime.Now.Date.ToString().Substring(0, 10);
                        int KategoriID;

                        var SQL = (from p in db.tbl_dosyalar_kategori
                                   where p.ad == YeniKategori
                                   select
                                   new
                                   {
                                       p.id,
                                       p.ad
                                   });

                        if (SQL.Any())
                        {
                            KategoriID = SQL.Select(x => x.id).FirstOrDefault();
                        }
                        else
                        {
                            #region Kategori Oluştur
                            tbl_dosyalar_kategori ta1 = new tbl_dosyalar_kategori();
                            ta1.ad = YeniKategori;
                            ta1.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                            db.AddTotbl_dosyalar_kategori(ta1);
                            db.SaveChanges();

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta1)).EntityKey.EntitySetName.ToString(), ta1.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                            #endregion

                            KategoriID = ta1.id;
                            #endregion
                        }

                        #region Dosya Kaydet
                        tbl_dosyalar ta2 = new tbl_dosyalar();
                        ta2.tip = (int)Class.Sabitler.Dosya.Resim;
                        ta2.ad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, GelenDosya.FileName);
                        ta2.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        ta2.onay = false;
                        db.AddTotbl_dosyalar(ta2);
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta2)).EntityKey.EntitySetName.ToString(), ta2.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                        #endregion
                        #endregion

                        #region Dosyayı Eklenen Kategoriye Ata
                        tbl_dosyalar_kategoriler ta3 = new tbl_dosyalar_kategoriler();
                        ta3.dosya_id = ta2.id;
                        ta3.kategori_id = KategoriID;
                        ta3.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        db.AddTotbl_dosyalar_kategoriler(ta3);
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta3)).EntityKey.EntitySetName.ToString(), ta3.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                        #endregion
                        #endregion
                    }

                    WindowResimYukle.Hide();
                    RSM.ClearSelections();
                    Store1.DataBind();
                    #endregion
                    break;

                case Class.Sabitler.MessageTypes.ERROR:
                    Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, M.Header, M.Text);
                    break;
            }
        }

        #endregion

        #region Anasayfa İşlemleri
        public void AnasayfaEkle(object sender, DirectEventArgs e)
        {
            if (RSM.SelectedRows.Count > 0)
            {
                for (int i = 0; i < RSM.SelectedRows.Count; i++)
                {
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        int PID = int.Parse(RSM.SelectedRows[i].RecordID);
                        tbl_urunler ta = (from p in db.tbl_urunler where p.id == PID select p).FirstOrDefault();

                        if (!ta.anasayfa)
                        {
                            ta.anasayfa = true;
                            ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                            db.SaveChanges();

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), PID, (int)Class.Sabitler.AdminLog.Islemler.Update);
                            #endregion
                        }
                    }
                }

            }

            RSM.ClearSelections();
            Store1.DataBind();
        }

        public void AnasayfaKaldir(object sender, DirectEventArgs e)
        {
            if (RSM.SelectedRows.Count > 0)
            {
                for (int i = 0; i < RSM.SelectedRows.Count; i++)
                {
                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                    {
                        int PID = int.Parse(RSM.SelectedRows[i].RecordID);
                        tbl_urunler ta = (from p in db.tbl_urunler where p.id == PID select p).FirstOrDefault();

                        if (ta.anasayfa)
                        {
                            ta.anasayfa = false;
                            ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();
                            db.SaveChanges();

                            #region Admin İşlem Log
                            Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), PID, (int)Class.Sabitler.AdminLog.Islemler.Update);
                            #endregion
                        }
                    }
                }

            }

            RSM.ClearSelections();
            Store1.DataBind();
        }
        #endregion
    }
}