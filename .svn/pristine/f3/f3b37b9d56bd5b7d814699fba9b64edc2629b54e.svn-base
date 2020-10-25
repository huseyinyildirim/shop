using System;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using MySQLDataModel;

//!++ Ürün fiyatları hesaplarken ürün fiyatı yabancı para birimi olarak belirtilmişse hesaplayarak listeye eklemeli!

namespace SHOP.admin.dummy
{
    public partial class siparis_durum : System.Web.UI.Page
    {
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
                if (Request.QueryString["id"] != null)
                {
                    if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["id"].ToString().Trim())))
                    {
                        SiparisGetir(int.Parse(Request.QueryString["id"].ToString().Trim()));

                        if (!IsPostBack)
                        {
                            DurumYukle();
                        }
                    }
                }
            }
            #endregion
        }

        void DurumYukle()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_siparis_durumlar
                           where p.dil_id == 999 && p.onay == true
                           orderby p.text ascending
                           select new
                           {
                               p.siparis_durum_id,
                               p.text
                           });

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        ddl_durumlar.Items.Add(new ListItem(i.text.ToString(), i.siparis_durum_id.ToString()));
                    }
                }
            }
        }

        protected void SiparisGetir(int SiparisID)
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from p in db.tbl_siparisler
                           where p.id == SiparisID
                           select p).AsEnumerable().Take(1);

                if (SQL.Any())
                {
                    StringBuilder SB = new StringBuilder();

                    #region Ödeme Şekli
                    int OdemeSekliID = SQL.Select(p => p.odeme_sekli_id).FirstOrDefault();
                    //LitOdemeSekli.Text = db.tbl_sbt_odeme_sekli.Where(x => x.id == OdemeSekliID).Select(x => x.ad).FirstOrDefault();
                    #endregion

                    #region Kullanıcı Bilgileri
                    int KullaniciID = SQL.Select(p => p.kullanici_id).FirstOrDefault();

                    var KullaniciSQL = (from p in db.tbl_kullanicilar
                                        where p.id == KullaniciID
                                        select p).AsEnumerable().Take(1);

                    LitKullaniciAd.Text = KullaniciSQL.Select(p => p.ad_soyad).FirstOrDefault();
                    LitKullaniciMail.Text = "<a href='mailto:" + KullaniciSQL.Select(p => p.mail).FirstOrDefault() + "'>" + KullaniciSQL.Select(p => p.mail).FirstOrDefault() + "</a>";
                    LitKullaniciTel.Text = "+(" + KullaniciSQL.Select(p => p.alan_kodu_id).FirstOrDefault() + ") " + Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.TelFormatla, KullaniciSQL.Select(p => p.gsm).FirstOrDefault());
                    LitKullaniciTarih.Text = KullaniciSQL.Select(p => p.tarih_ek).FirstOrDefault().ToString();
                    #endregion

                    #region Durum Bilgileri
                    var DurumlarSQL = (from p in db.tbl_siparisler_durumlar
                                       where p.siparis_id == SiparisID
                                       let durum = db.tbl_sbt_siparis_durum.Where(x => x.id == p.siparis_durum_id).Select(x => x.ad).FirstOrDefault()
                                       orderby p.tarih descending
                                       select new
                                       {
                                           durum,
                                           p.tarih
                                       });

                    SB = new StringBuilder();
                    foreach (var i in DurumlarSQL)
                    {
                        SB.Append("<tr>\r\n");
                        SB.Append("<td>" + i.durum + "</td>\r\n");
                        SB.Append("<td align=\"center\">" + i.tarih + "</td>\r\n");
                        SB.Append("</tr>\r\n");
                    }

                    LitSiparisDurum.Text = SB.ToString();
                    #endregion
                }
            }
        }

        protected void btn_durum_guncelle_Click(object sender, EventArgs e)
        {
#if DEBUG
            try
            {
#endif
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    tbl_siparisler_durumlar tbl = new tbl_siparisler_durumlar();
                    tbl.siparis_id = int.Parse(Request.QueryString["id"].ToString());
                    tbl.siparis_durum_id = int.Parse(Request.Form["ddl_durumlar"].ToString());
                    tbl.admin_id_ek = Class.Fonksiyonlar.Admin.Genel.AdminID();
                    db.AddTotbl_siparisler_durumlar(tbl);
                    db.SaveChanges();

                    #region Admin İşlem Log
                    Class.Fonksiyonlar.Admin.Log.Islemler(Class.Fonksiyonlar.Admin.Genel.AdminID(), ((EntityObject)(tbl)).EntityKey.EntitySetName.ToString(), int.Parse(Request.QueryString["id"].ToString()), (int)Class.Sabitler.AdminLog.Islemler.Update);
                    #endregion
                }

                Response.Redirect("siparis-durum.aspx?id=" + Request.QueryString["id"].ToString().Trim(), false);
                Context.ApplicationInstance.CompleteRequest();

#if DEBUG
            }
            catch (Exception ex)
            {
                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);

                Response.Redirect("siparis-durum.aspx?id=" + Request.QueryString["id"].ToString().Trim(), false);
                Context.ApplicationInstance.CompleteRequest();
            }
#endif
        }
    }
}