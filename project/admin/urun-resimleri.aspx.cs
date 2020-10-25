using System;
using System.Collections.Generic;
using System.Data.Objects.DataClasses;
using System.IO;
using System.Linq;
using System.Web;
using Ext.Net;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class urun_resimleri : System.Web.UI.Page
    {
        List<AdminClass.Resim> Resimler;

        protected void Page_Load(object sender, EventArgs e)
        {
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
                ResimleriGetir();

                #region Verileri Listeleme
                if (!X.IsAjaxRequest)
                {
                    VerileriGetir();
                    Label2.Html = "İlgili resimler " + "<b><u>" + Class.Degiskenler.Site.Yollar.Urun + "</u></b>" + " klasöründen gösterilmektedir.";
                }
                #endregion
            }
            #endregion

            #region Icon Register Olayı
            if (!IsPostBack)
            {
                ResourceManager1.RegisterIcon(Icon.Error);
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

        protected void ResimleriGetir()
        {
            Resimler = AdminClass.ResimleriGetir(Class.Degiskenler.Site.Yollar.Urun, "U");
        }

        protected void VerileriGetir()
        {
            Store1.DataSource = Resimler;
            Store1.DataBind();
        }

        protected void KayitlariYenile(object sender, StoreRefreshDataEventArgs e)
        {
            ResimleriGetir();
            VerileriGetir();
        }

        public void YoneticiAdiYaz(Observable sender)
        {
            YoneticiAdi.Html = AdminClass.YoneticiAdi();
        }

        #endregion

        #region Silme İşlemleri

        [DirectMethod]
        public void DM_SecilenleriSil()
        {
            SecilenleriSil(null, null);
        }

        protected void SecilenleriSil(object sender, DirectEventArgs e)
        {
            if (ImageView.SelectedRecordID != "")
            {
                try
                {
                    foreach (SelectedRow row in ImageView.SelectedRows)
                    {
                        int ID = int.Parse(row.RecordID);
                        var Resim = Resimler.Where(p => p.ID == ID).Select(p => new { p.Yol, p.ResimAdi }).FirstOrDefault();

                        if (!string.IsNullOrEmpty(Resim.Yol))
                        {
                            #region Resmi Veritabanindan Sil
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_dosyalar ta = (from p in db.tbl_dosyalar where p.ad == Resim.ResimAdi select p).FirstOrDefault();

                                #region Resim Varsa DB Den Siliyoruz
                                if (ta != null)
                                {
                                    int ResimID = ta.id;
                                    db.DeleteObject(ta);

                                    #region Admin İşlem Log
                                    Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta)).EntityKey.EntitySetName.ToString(), ResimID, (int)Class.Sabitler.AdminLog.Islemler.Delete);
                                    #endregion

                                    db.SaveChanges();
                                }
                                #endregion
                            }
                            #endregion

                            File.Delete(Resim.Yol);
                        }
                    }
                }
                catch
                {
                    ImageView.SelectedRows.Clear();
                    ImageView.UpdateSelection();
                    ResimleriGetir();
                    VerileriGetir();
                }

                ImageView.SelectedRows.Clear();
                ImageView.UpdateSelection();
                ResimleriGetir();
                VerileriGetir();
            }
            else
            {
                ImageView.SelectedRows.Clear();
                ImageView.UpdateSelection();
            }
        }

        #endregion

        #region Seçim Temizleme

        protected void SecimiTemizle(object sender, DirectEventArgs e)
        {
            ImageView.SelectedRows.Clear();
            ImageView.UpdateSelection();
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
                #region İşlem Başarıylıysa
                case Class.Sabitler.MessageTypes.OK:
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
                        //ta2.kategori_id = KategoriID;
                        ta2.ad = Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.StringTemizle, GelenDosya.FileName);
                        ta2.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                        ta2.onay = false;
                        db.AddTotbl_dosyalar(ta2);
                        db.SaveChanges();

                        #region Admin İşlem Log
                        Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(ta2)).EntityKey.EntitySetName.ToString(), ta2.id, (int)Class.Sabitler.AdminLog.Islemler.Insert);
                        #endregion
                        #endregion
                    }

                    WindowResimYukle.Hide();
                    KayitlariYenile(null, null);
                #endregion
                    break;

                case Class.Sabitler.MessageTypes.ERROR:
                    Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, M.Header, M.Text);
                    break;
            }
        }

        #endregion
    }
}