using System;
using System.Collections;
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
    public partial class kullanicilar : System.Web.UI.Page
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
        protected bool KullaniciKontrol(string Mail, int KullaniciID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                int EID = (from p in db.tbl_kullanicilar
                           where p.mail == Mail && p.id != KullaniciID
                           select p.id).FirstOrDefault();

                if (EID == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        protected void StoreDoldurUyelikMetot(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_sbt_uyelik_metot
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

        protected void StoreDoldurAlanKodu(Store StoreAdi)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_sbt_ulke
                           where p.alan_kodu != null
                           select
                           new
                           {
                               id = p.alan_kodu,
                               p.alan_kodu
                           }).Distinct();

                StoreAdi.DataSource = SQL;
                StoreAdi.DataBind();
            }
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
                    var SQL1 = (from p in db.tbl_kullanicilar
                                select new
                                {
                                    p.id,
                                    uyelik_metot = db.tbl_sbt_uyelik_metot.Where(a => a.id == p.uyelik_metot_id).Select(a => a.ad).FirstOrDefault(),
                                    p.ad_soyad,
                                    p.mail,
                                    p.alan_kodu_id,
                                    p.gsm,
                                    p.tarih_ek,
                                    p.tarih_gun,
                                    p.admin_id_gun,
                                    p.onay
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
                        p.id,
                        p.ad_soyad,
                        p.uyelik_metot,
                        p.alan_kodu_id,
                        p.gsm,
                        p.mail,
                        p.tarih_ek,
                        p.tarih_gun,
                        p.admin_id_gun,
                        guncelleyen = AdminClass.Admin(p.admin_id_gun),
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

        protected string TeslimatAdres(int KullaniciID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_kullanicilar_adresler
                           where p.tip == true && p.kullanici_id == KullaniciID
                           select new
                           {
                               p.baslik,
                               p.adres,
                               p.il,
                               p.ilce,
                               ulke = db.tbl_sbt_ulke.Where(a => a.id == p.ulke_id).Select(a => a.ad).FirstOrDefault(),
                               p.posta_kodu,
                               p.acik_adres
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    foreach (var i in SQL)
                    {

                        sb.Append("<strong>Başlık:</strong> " + i.baslik + "<br />");
                        sb.Append("<strong>Adres:</strong> " + i.adres + "<br />");
                        sb.Append(i.ilce + "/" + i.il + "/" + i.ulke + " " + i.posta_kodu + "<br />");
                        sb.Append("<strong>Açık Adres:</strong> " + i.acik_adres + "<br /><br />");

                    }

                    return sb.ToString();
                }
                else
                {
                    return "Eklenmiş teslimat adresi bulunmuyor!";
                }
            }
        }

        protected string FaturaAdres(int KullaniciID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_kullanicilar_adresler
                           where p.tip == false && p.kullanici_id == KullaniciID
                           select new
                           {
                               p.baslik,
                               p.adres,
                               p.il,
                               p.ilce,
                               ulke = db.tbl_sbt_ulke.Where(a => a.id == p.ulke_id).Select(a => a.ad).FirstOrDefault(),
                               p.posta_kodu,
                               p.acik_adres,
                               firma = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.firma).FirstOrDefault(),
                               tip = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.tip).FirstOrDefault(),
                               vergi_no = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.vergi_no).FirstOrDefault(),
                               vergi_daire = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.vergi_dairesi).FirstOrDefault(),
                               tc_kimlik_no = db.tbl_kullanicilar_vergi_bilgiler.Where(a => a.adres_id == p.id).Select(a => a.tc_kimlik_no).FirstOrDefault()
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    foreach (var i in SQL)
                    {
                        sb.Append("<strong>Başlık:</strong> " + i.baslik + "<br />");
                        sb.Append("<strong>Firma:</strong> " + i.firma + "<br />");
                        sb.Append("<strong>Adres:</strong> " + i.adres + "<br />");
                        sb.Append(i.ilce + "/" + i.il + "/" + i.ulke + " " + i.posta_kodu + "<br />");

                        if (i.tip)
                        {
                            sb.Append("<strong>Vergi Daire/No:</strong> " + i.vergi_daire + " " + i.vergi_no + "<br /><br />");
                        }
                        else
                        {
                            sb.Append("<strong>TC Kimlik No:</strong> " + i.tc_kimlik_no + "<br /><br />");
                        }

                    }

                    return sb.ToString();
                }
                else
                {
                    return "Eklenmiş fatura adresi bulunmuyor!";
                }
            }
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
            WindowEkle.Show();

            StoreDoldurUyelikMetot(StoreUyelikMetot1);
            StoreDoldurAlanKodu(StoreAlanKodu1);
        }

        protected void YeniKayitYap(object sender, DirectEventArgs e)
        {
            if (!KullaniciKontrol(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldMail.Text.Trim()).ToUpper(), 0))
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

                    tbl_kullanicilar ta = new tbl_kullanicilar();
                    ta.uyelik_metot_id = int.Parse(Ekle_ComboBoxUyelikMetotID.Value.ToString());
                    ta.uyelik_metot_info = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldUyelikMetotUyeInfo.Text.Trim());
                    ta.uyelik_metot_uye_id = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldUyelikMetotUyeID.Text.Trim());
                    ta.ad_soyad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldAdSoyad.Text.Trim()).ToUpper();
                    ta.mail = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldMail.Text.Trim());

                    if (Ekle_ComboBoxAlanKoduID.Text.ToString() != "")
                    {
                        ta.alan_kodu_id = int.Parse(Ekle_ComboBoxAlanKoduID.Text.ToString());
                    }

                    ta.gsm = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Ekle_TextFieldGsm.Text.Trim());
                    ta.sifre = Class.Fonksiyonlar.Genel.Sifrele(Ekle_TextFieldSifre.Text.Trim());
                    ta.onay = OnayBool;
                    db.AddTotbl_kullanicilar(ta);
                    db.SaveChanges();

                    #region Admin İşlem Log
                    Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                    #endregion
                }

                RSM.ClearSelections();
                Store1.DataBind();

                WindowEkle.Hide();
            }
            else
            {
                Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, "İşlem başarısız", "Aynı mail adresiyle kullanıcı mevcut.<br/>Lütfen farklı bir mail belirtin!");
                return;
            }
        }

        #endregion

        #region Güncelleme İşlemleri

        [DirectMethod]
        public void DM_GuncellemeEkraniGetir(int ID)
        {
            Duzenle_ID.Text = ID.ToString();

            fatura_adres3.Html = FaturaAdres(ID);
            teslimat_adres3.Html = TeslimatAdres(ID);

            LoadConfig lc = new LoadConfig();
            lc.Url = "kullanicilar-siparis.aspx?KID=" + ID;
            lc.ShowMask = true;
            lc.Mode = LoadMode.IFrame;
            lc.MaskMsg = "Yükleniyor...";
            Panel5.LoadContent(lc);

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL2 = (from p in db.tbl_kullanicilar
                            where p.id == ID
                            select new
                            {
                                p.id,
                                p.uyelik_metot_id,
                                p.uyelik_metot_info,
                                p.uyelik_metot_uye_id,
                                p.ad_soyad,
                                p.mail,
                                p.alan_kodu_id,
                                p.gsm,
                                p.onay
                            });

                if (SQL2.Any())
                {
                    StoreDoldurAlanKodu(StoreAlanKodu2);
                    StoreDoldurUyelikMetot(StoreUyelikMetot2);

                    Duzenle_Mail.Text = SQL2.Select(x => x.mail).FirstOrDefault();
                    Duzenle_ComboBoxUyelikMetotID.SelectedItem.Value = SQL2.Select(x => x.uyelik_metot_id).FirstOrDefault().ToString();
                    Duzenle_TextFieldUyelikMetotUyeID.Text = SQL2.Select(x => x.uyelik_metot_uye_id).FirstOrDefault();
                    Duzenle_TextFieldUyelikMetotUyeInfo.Text = SQL2.Select(x => x.uyelik_metot_info).FirstOrDefault();
                    Duzenle_TextFieldAdSoyad.Text = HttpUtility.HtmlDecode(SQL2.Select(x => x.ad_soyad).FirstOrDefault());
                    Duzenle_TextFieldMail.Text = SQL2.Select(x => x.mail).FirstOrDefault();
                    Duzenle_ComboBoxAlanKoduID.SelectedItem.Value = SQL2.Select(x => x.alan_kodu_id).FirstOrDefault().ToString();
                    Duzenle_TextFieldGsm.Text = SQL2.Select(x => x.gsm).FirstOrDefault();
                    Duzenle_ComboBoxOnay.SelectedItem.Value = Class.Fonksiyonlar.Genel.Cevirmeler.BoolToInteger(SQL2.Select(x => x.onay).FirstOrDefault());

                    WindowDuzenle.Title = ID + " numaralı kaydı güncelle...";
                }
            }

            WindowDuzenle.Reload();
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
                tbl_kullanicilar ta = (from p in db.tbl_kullanicilar where p.id == PID select p).FirstOrDefault();
                ta.ad_soyad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldAdSoyad.Text.Trim()).ToUpper();
                ta.uyelik_metot_id = int.Parse(Duzenle_ComboBoxUyelikMetotID.Value.ToString());
                ta.uyelik_metot_info = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldUyelikMetotUyeInfo.Text.Trim());
                ta.uyelik_metot_uye_id = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldUyelikMetotUyeID.Text.Trim());

                if (Duzenle_ComboBoxAlanKoduID.Text.ToString() != "")
                {
                    ta.alan_kodu_id = int.Parse(Duzenle_ComboBoxAlanKoduID.Text.ToString());
                }

                ta.gsm = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldGsm.Text.Trim());
                ta.onay = OnayBool;
                ta.admin_id_gun = Class.Fonksiyonlar.Admin.Genel.AdminID();

                if (!KullaniciKontrol(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldMail.Text.Trim()).ToUpper(), PID))
                {
                    ta.mail = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Duzenle_TextFieldMail.Text.Trim());
                }

                if (Convert.ToBoolean(Duzenle_Checbox.Value.ToString()))
                {
                    ta.sifre = Class.Fonksiyonlar.Genel.Sifrele(Duzenle_TextFieldSifre.Text.Trim());
                }

                db.SaveChanges();

                #region Admin İşlem Log
                Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ta.id, (int)Class.Sabitler.AdminLog.Islemler.Update);
                #endregion
            }

            RSM.ClearSelections();
            Store1.DataBind();

            WindowDuzenle.Hide();
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
                            tbl_kullanicilar ta = (from p in db.tbl_kullanicilar where p.id == PID select p).FirstOrDefault();

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
                    tbl_kullanicilar ta = (from p in db.tbl_kullanicilar where p.id == ID select p).FirstOrDefault();

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
                            tbl_kullanicilar ta = (from p in db.tbl_kullanicilar where p.id == PID select p).FirstOrDefault();

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
                    tbl_kullanicilar ta = (from p in db.tbl_kullanicilar where p.id == ID select p).FirstOrDefault();

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

        #region Sipariş listesi
        #endregion
    }
}