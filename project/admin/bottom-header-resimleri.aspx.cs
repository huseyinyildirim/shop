using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Ext.Net;

namespace SHOP.admin
{
    public partial class bottom_header_resimleri : System.Web.UI.Page
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
                    Label2.Html = "İlgili resimler " + "<b><u>" + Class.Degiskenler.Site.Yollar.Diger + "</u></b>" + " klasöründen gösterilmektedir.";
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

        protected void ResimleriGetir()
        {
            Resimler = AdminClass.ResimleriGetir(Class.Degiskenler.Site.Yollar.Diger, "D");
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
                        string Yol = Resimler.Where(p => p.ID == ID).Select(p => p.Yol).FirstOrDefault();

                        if (!string.IsNullOrEmpty(Yol))
                        {
                            File.Delete(Yol);
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
            Objeler.Tanimlar.Messages M = AdminClass.DosyaGonder(gonderilecek_dosya, Class.Degiskenler.Site.Yollar.Diger);

            switch (M.Type)
            {
                case Class.Sabitler.MessageTypes.OK:
                    WindowResimYukle.Hide();
                    KayitlariYenile(null, null);
                    break;

                case Class.Sabitler.MessageTypes.ERROR:
                    Class.Fonksiyonlar.ExtJS.MesajKutusu(Icon.Error, MessageBox.Icon.ERROR, M.Header, M.Text);
                    break;
            }
        }

        #endregion
    }
}