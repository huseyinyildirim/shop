using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using MySQLDataModel;

namespace SHOP
{
    public partial class basket_confirmation : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID;
        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

        #region Sistem objemiz
        SHOPObjeler.Tanimlar.Sistem Sistem { get; set; }
        #endregion

        #region Boş VIEWSTATE
        protected override void SavePageStateToPersistenceMedium(object viewState)
        {
        }

        protected override object LoadPageStateFromPersistenceMedium()
        {
            return null;
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SHOPClass.Fonksiyonlar.Kullanici.Genel.SessionKontrol())
            {
                Response.Redirect("/login.aspx?ReturnUrl=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), true);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

                ObjeSetle();

                if (Sistem.Sepet.FaturaAdresID == 0 || Sistem.Sepet.KargoAdresID == 0 || Sistem.Sepet.SiparisDurumID == 0 || Sistem.Sepet.ParaBirimID == 0 || Sistem.Sepet.OdemeSekliID == 0 || Sistem.Sepet.ToplamTutar == 0 || Sistem.Sepet.GenelToplam == 0 || Sistem.Sepet.Tutar == 0)
                {
                    Response.Redirect("/basket-address.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(97) + " &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(120);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(97);

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            Yazdir();

            /*
            #region sepet için oluşturduğumuz list temizliyoruz
            int index = -1;
            index = SHOPObjeler.Listeler.Sepet.FindIndex(delegate(SHOPObjeler.Tanimlar.Sepet p)
            {
                return (p.KullaniciID == SHOPClass.Fonksiyonlar.Kullanici.Genel.ID());
            });
            if (index != -1)
            {
                SHOPObjeler.Listeler.Sepet.RemoveAt(index);
            }
            #endregion
            */
        }

        protected void ObjeSetle()
        {
            try
            {
                Sistem = (from p in SHOPObjeler.Listeler.Sistem
                          where p.Key == KullaniciID
                          select p.Value).Cast<SHOPObjeler.Tanimlar.Sistem>().ToList()[0];
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
            }
        }

        #region Kullanıcıya giden sipariş detay maili
        protected void Yazdir()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_siparisler
                           where a.kullanici_id == KullaniciID
                           orderby a.tarih descending
                           select new
                           {
                               a.id,
                               a.no,
                               ad_soyad = (db.tbl_kullanicilar.Where(p => p.id == KullaniciID).Select(p => p.ad_soyad).FirstOrDefault()),
                               mail = (db.tbl_kullanicilar.Where(p => p.id == KullaniciID).Select(p => p.mail).FirstOrDefault()),
                               a.odeme_sekli_id,
                               odeme_sekli = (db.tbl_sbt_odeme_sekli.Where(p => p.id == a.odeme_sekli_id).Select(p => p.ad).FirstOrDefault()),
                               a.toplam,
                               a.para_birimi_id,
                               //para_birim = (db.tbl_sbt_para_birim.Where(p => p.id == a.para_birimi_id).Select(p => p.simge).FirstOrDefault()),
                               banka_id = (db.tbl_odeme_bildirimler.Where(p => p.siparis_id == a.id).Select(p => p.odeme_bildirimler_hesap_nolar_id).FirstOrDefault()),
                           }).AsEnumerable().Take(1);

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        #region Mail formatını textlerden çekiyor ve belirlediğim taglara göre replace ediyor
                        string Metin = Class.Fonksiyonlar.Uygulama.SabitlerText(259);
                        Metin = Metin.Replace("{{MusteriAdi}}", i.ad_soyad);
                        Metin = Metin.Replace("{{SiparisNo}}", i.no);

                        string MailMetin = Class.Fonksiyonlar.Uygulama.SabitlerText(260);
                        MailMetin = MailMetin.Replace("{{FirmaLogo}}", "<img src=\"http://" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault() + "/images/logo.png\" alt=\"" + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault() + "\" />");
                        MailMetin = MailMetin.Replace("{{MusteriAdi}}", i.ad_soyad);
                        MailMetin = MailMetin.Replace("{{SiparisNo}}", i.no);
                        MailMetin = MailMetin.Replace("{{OdemeTur}}", i.odeme_sekli);
                        MailMetin = MailMetin.Replace("{{FirmaAdi}}", Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault());

                        #region Ödeme türüne göre içerik geliyor
                        if (i.odeme_sekli_id == 2)
                        {
                            MailMetin = MailMetin.Replace("{{OdenecekTutar}}", SHOPClass.Finans.Cevirme.ParaFormat(i.toplam.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));
                            MailMetin = MailMetin.Replace("{{Aciklama}}", "");
                        }
                        else
                        {
                            MailMetin = MailMetin.Replace("{{OdenecekTutar}}", SHOPClass.Finans.Cevirme.ParaFormat(i.toplam.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));
                            MailMetin = MailMetin.Replace("{{Aciklama}}", SHOPClass.Fonksiyonlar.Genel.BankaHesapBilgi(i.banka_id));
                        }
                        #endregion

                        string KullaniciAdi, Sifre, Host;
                        int Port;
                        Class.Fonksiyonlar.Genel.Mail.Bilgiler(out KullaniciAdi, out Sifre, out Host, out Port);
                        Class.Fonksiyonlar.Genel.Mail.Gonder(KullaniciAdi, Sifre, Host, Port, i.mail, null, null, Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.mail).FirstOrDefault(), Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.firma).FirstOrDefault(), Class.Fonksiyonlar.Uygulama.SabitlerText(261).Replace("{{SiparisNo}}", i.no.ToString()), MailMetin, true);

                        lit_mesaj.Text = Metin;

                        #endregion
                    }

                }
                else
                {
                    Response.Redirect("/basket.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }
        #endregion
    }
}