using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySQLDataModel;

namespace SHOP
{
    public partial class order_detail : System.Web.UI.Page
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID;
        string KullanilacakDovizAd = SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd();
        int KullanilacakDoviz = SHOPClass.Fonksiyonlar.Genel.KullanilacakDoviz();

        public Dictionary<int, string> Kategoriler = new Dictionary<int, string>();

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
                Response.Redirect("/login.aspx?ReturnUrl=" + Class.Fonksiyonlar.Genel.MevcutSayfa(), false);
                Context.ApplicationInstance.CompleteRequest();
            }

            KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

            #region title
            Class.Fonksiyonlar.UserKontrol.HeaderText("sitil", "Title", Class.Fonksiyonlar.Uygulama.SabitlerText(191) + " | " + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.title).FirstOrDefault());
            #endregion

            Page.MetaDescription = Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.description).FirstOrDefault();

            lit_nerdesin.Text = "<strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(61) + "</strong> <a href=\"/\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(62) + "</a> &raquo; <a href=\"/customer-services.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(100) + "</a> &raquo; <a href=\"/order-tracking.aspx\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(101) + "</a> &raquo; " + Class.Fonksiyonlar.Uygulama.SabitlerText(191);
            lit_ortabaslik.Text = "// " + Class.Fonksiyonlar.Uygulama.SabitlerText(191).ToUpper();

            Kategoriler = Class.Fonksiyonlar.Uygulama.Bloklar.Urunler.Kategoriler(DilID, 0);
            Class.Fonksiyonlar.Uygulama.Bloklar.Icerik.Kategoriler(Kategoriler);

            btn_havale_bildirimi_yap.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(198);

            // Gridin başlıkları
            grid_sepet.Columns[1].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(113).ToUpper();
            grid_sepet.Columns[2].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(114).ToUpper();
            grid_sepet.Columns[3].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(115).ToUpper();
            grid_sepet.Columns[4].HeaderText = Class.Fonksiyonlar.Uygulama.SabitlerText(116).ToUpper();

            if (Request.QueryString["ID"] != null)
            {
                if (!string.IsNullOrEmpty(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["ID"].ToString())))
                {
                    if (Class.Fonksiyonlar.Genel.Kontroller.Numerik(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle, Request.QueryString["ID"].ToString())) && SHOPClass.Fonksiyonlar.Genel.SiparisKullaniciyamiAit(int.Parse(Request.QueryString["ID"].ToString())))
                    {
                        SiparisDetay();
                        OdemeBildirimYapilmisMi();
                    }
                    else
                    {
                        Response.Redirect("/order-tracking.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                }
                else
                {
                    Response.Redirect("/order-tracking.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            else
            {
                Response.Redirect("/order-tracking.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void OdemeBildirimYapilmisMi()
        {
            int SiparisID = int.Parse(Request.QueryString["ID"].ToString());

            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_odeme_bildirimler
                           where a.siparis_id == SiparisID && a.odeme_tarih == null
                           select new { a.id });

                if (SQL.Any())
                {
                    btn_havale_bildirimi_yap.Visible = true;
                }
                else
                {
                    btn_havale_bildirimi_yap.Visible = false;
                }
            }
        }

        protected void SiparisDetay()
        {
            int SiparisID = int.Parse(Request.QueryString["ID"].ToString());
            int DilID = Class.Fonksiyonlar.Dil.ID();

            // Siparişlerin ürünleri gridview yazılıyor
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_siparisler_urunler
                           where a.siparis_id == SiparisID
                           select new
                           {
                               a.id,
                               a.adet,
                               urunadi = db.tbl_cpy_siparisler_urunler.Where(p => p.id == a.siparisler_urunler_id).Select(p => p.ad).FirstOrDefault(),
                               urunid = a.siparisler_urunler_id
                           });

                grid_sepet.DataSource = SQL;
                grid_sepet.DataBind();
            }

            // Sipariş bilgileri yazılıyor
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_siparisler
                           let kargo_id = (db.tbl_siparisler_gonderimler.Where(p => p.siparis_id == SiparisID).Select(p => p.kargo_id).FirstOrDefault())
                           //let siparis_durum_id = db.tbl_siparisler_durumlar.Where(t => t.siparis_id == a.id).Select(t => t.siparis_durum_id).FirstOrDefault()
                           where a.id == SiparisID && a.kullanici_id == KullaniciID
                           select new
                           {
                               a.no,
                               //durum = (db.tbl_siparis_durumlar.Where(p => p.siparis_durum_id == siparis_durum_id && p.dil_id == DilID).Select(p => p.text).FirstOrDefault()),
                               odeme_sekil = (db.tbl_sbt_odeme_sekli.Where(p => p.id == a.odeme_sekli_id).Select(p => p.ad).FirstOrDefault()),
                               a.odeme_sekli_id,
                               a.para_birimi_id,
                               a.tutar,
                               a.toplam_kdv,
                               a.kargo_payi,
                               a.indirim_tutari,
                               a.toplam_tutar,
                               a.toplam,
                               a.tarih,
                               kargo_id,
                               a.genel_toplam,
                               a.komisyon_tutari,
                               komisyon_ad = (db.tbl_cpy_indirimler_komisyonlar.Where(p => p.id == a.indirim_komisyon_id).Select(p => p.ad).FirstOrDefault())
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    foreach (var i in SQL)
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append("<table id=\"bilgitablo\" summary=\"\"><tbody><tr class=\"baslik\">");
                        sb.Append("<td>&nbsp;</td>");
                        sb.Append("<td><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(192).ToUpper() + "</strong></td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        sb.Append("<td><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(188).ToUpper() + "</strong></td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        //sb.Append("<td><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(190).ToUpper() + "</strong></td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        sb.Append("<td><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(193).ToUpper() + "</strong></td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        sb.Append("<td><strong>" + Class.Fonksiyonlar.Uygulama.SabitlerText(212).ToUpper() + "</strong></td>");
                        sb.Append("</tr><tr>");
                        sb.Append("<td>&nbsp;</td>");
                        sb.Append("<td>" + i.tarih.Value.ToLongDateString() + " " + i.tarih.Value.ToShortTimeString() + "</td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        sb.Append("<td>" + i.no + "</td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        //sb.Append("<td>" + i.durum + "</td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        sb.Append("<td>" + i.odeme_sekil + "</td>");
                        //sb.Append("<td width=\"30\">&nbsp;</td>");
                        sb.Append("<td>" + SHOPClass.Fonksiyonlar.Genel.Kargo.KargoFirmaAdi(i.kargo_id) + "</td>");
                        sb.Append("</tr></tbody></table>");
                        lit_sepetbilgi.Text = sb.ToString();

                        if (i.odeme_sekli_id == 1 || i.odeme_sekli_id == 6)
                        {
                            btn_havale_bildirimi_yap.Visible = true;
                        }

                        lit_tutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.tutar.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());
                        lit_toplamkdv.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.toplam_kdv.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());
                        lit_kargo_payi.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.kargo_payi.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());

                        if (i.indirim_tutari != 0)
                        {
                            pnl_indirim.Visible = true;
                            lit_indirimtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.indirim_tutari.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());
                        }

                        lit_toplamtutar.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.toplam_tutar.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());

                        if (i.kargo_payi != 0)
                        {
                            pnl_kargo_payi.Visible = true;
                            lit_kargo_payi.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.kargo_payi.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());
                        }

                        lit_toplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.toplam.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());

                        if (i.komisyon_tutari != 0)
                        {
                            pnl_komisyon.Visible = true;
                            lit_komisyon_ad.Text = i.komisyon_ad;
                            lit_komisyon.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.komisyon_tutari.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());
                        }

                        lit_geneltoplam.Text = SHOPClass.Finans.Cevirme.ParaFormat(i.genel_toplam.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString());
                    }
                }
                else
                {
                    Response.Redirect("/order-tracking.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }

            // Siparişin fatura ve teslimat adresi yazılıyor
            #region Fatura ve teslimat bilgileri
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var AdresSQL = (from a in db.view_siparis_adresler
                                where a.id == SiparisID
                                select a).AsEnumerable();

                if (AdresSQL.Any())
                {
                    foreach (var i in AdresSQL)
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append(i.FaturaBaslik + "<br />" + i.FaturaAdres + "<br />" + i.FaturaIlce + "/" + i.FaturaIl + "/" + i.FaturaUlke + " " + i.FaturaPostaKodu);

                        if (i.FaturaVergiTip == 0)
                        {
                            sb.Append("<br />" + i.FaturaTcNo);
                        }
                        else
                        {
                            sb.Append("<br />" + i.FaturaVergiDaire + " " + i.FaturaVergiNo);
                        }

                        LitFaturaAdres.Text = sb.ToString();
                        LitKargoAdres.Text = i.KargoBaslik + "<br />" + i.KargoAdres + "<br />" + i.KargoIlce + "/" + i.KargoIl + "/" + i.KargoUlke + " " + i.KargoPostaKodu + "<br />" + i.KargoAcikAdresAdres;
                    }
                }
            }
            #endregion

            #region Şipariş durumları yazdırılıyor
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_siparisler_durumlar
                           orderby a.tarih descending
                           where a.siparis_id == SiparisID
                           select new
                           {
                               a.tarih,
                               siparis_durum = (db.tbl_siparis_durumlar.Where(p => p.siparis_durum_id == a.siparis_durum_id && p.dil_id == DilID).Select(p => p.text).FirstOrDefault())
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb_siparisdurum = new StringBuilder();
                    sb_siparisdurum.Append("<table id=\"bilgitablo\" summary=\"\"><tbody>");
                    sb_siparisdurum.Append("<tr class=\"baslik\"><td width=\"1%\">&nbsp;</td><td width=\"48%\" height=\"25\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(190).ToUpper() + "</td></tr>");

                    foreach (var i in SQL)
                    {
                        sb_siparisdurum.Append("<tr><td>&nbsp;</td><td>" + i.tarih.Value.ToLongDateString() + " " + i.tarih.Value.ToShortTimeString() + " - " + i.siparis_durum + "</td></tr>");
                    }

                    sb_siparisdurum.Append("</tbody></table>");
                    lit_durumlar.Text = sb_siparisdurum.ToString();
                }
            }
            #endregion
        }

        protected void sepet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int UrunID = int.Parse(e.Row.Cells[2].Text);
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    var SQL = (from a in db.tbl_cpy_siparisler_urunler
                               where a.id == UrunID
                               select new
                               {
                                   a.id,
                                   a.ad,
                                   fiyat = a.fiyat == null ? 0 : a.fiyat,
                                   a.resim_id,
                                   a.kdv_id,
                                   a.para_birimi_id,
                                   a.indirim_id,
                                   a.kargo_hesaplama_id,
                                   a.urunler_id,
                                   urunkod = a.kod,
                                   indirim = a.indirim_yuzde,
                                   kdv_yuzde = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.ad).FirstOrDefault(),
                                   kdv = db.tbl_sbt_kdv.Where(p => p.id == a.kdv_id).Select(p => p.yuzde).FirstOrDefault()
                               }).AsEnumerable();

                    if (SQL.Any())
                    {
                        foreach (var i in SQL)
                        {
                            e.Row.Cells[1].Text = "<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.urunler_id.ToString()) + "\"><img src=\"/ashx/product-image.ashx?i=" + i.resim_id + "&amp;w=60&amp;h=60&amp;k=t\" alt=\"" + i.ad + "\" align=\"left\" /></a>&nbsp;<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.urunler_id.ToString()) + "\">" + i.ad + "</a>";
                            
                            if (!string.IsNullOrEmpty(i.urunkod))
                            {
                                e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br />&nbsp;Ürün Kodu: " + i.urunkod;
                            }

                            if (i.kargo_hesaplama_id == 1)
                            {
                                e.Row.Cells[1].Text = e.Row.Cells[1].Text + "<br />&nbsp;<a href=\"" + SHOPClass.Fonksiyonlar.Genel.SeoLink("product", i.ad, i.id.ToString()) + "\"><img alt=\"tipsy\" title=\"" + Class.Fonksiyonlar.Uygulama.SabitlerText(216) + "\" src=\"/images/btn-ucretsizkargo.png\" /></a>";
                            }

                            StringBuilder sb = new StringBuilder();
                            if (!string.IsNullOrEmpty(i.indirim_id.ToString()))
                            {
                                string IndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), i.indirim.ToString(), SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.IndirimliFiyat, 0));
                                string ToplamIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(IndirimliFiyat, "0", SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat, int.Parse(e.Row.Cells[3].Text)));


                                sb.Append("<strike>" + SHOPClass.Finans.Cevirme.ParaFormat(i.fiyat.ToString()) + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()) + "</strike><br />");
                                sb.Append(IndirimliFiyat + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));

                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Hesaplama.GecmisDovizCevir(IndirimliFiyat, int.Parse(i.para_birimi_id.ToString()), SHOPClass.Fonksiyonlar.Genel.SiparisKurTarih(int.Parse(Request.QueryString["ID"].ToString()))) + " " + KullanilacakDovizAd);
                                }

                                e.Row.Cells[4].Text = SHOPClass.Finans.Hesaplama.GecmisDovizCevir(ToplamIndirimliFiyat, int.Parse(i.para_birimi_id.ToString()), SHOPClass.Fonksiyonlar.Genel.SiparisKurTarih(int.Parse(Request.QueryString["ID"].ToString()))) + " " + KullanilacakDovizAd;
                            }
                            else
                            {
                                sb.Append(i.fiyat.ToString() + " " + SHOPClass.Fonksiyonlar.Genel.ParaSimgeVer(i.para_birimi_id.ToString()));
                                //sb.Append("<br />" + SHOPClass.Finans.Hesaplama.GecmisDovizCevir(i.fiyat.ToString(), int.Parse(i.para_birimi_id.ToString()), SHOPClass.Fonksiyonlar.Genel.SiparisKurTarih(int.Parse(Request.QueryString["ID"].ToString()))) + " " + KullanilacakDovizAd);

                                if (KullanilacakDoviz != i.para_birimi_id)
                                {
                                    sb.Append("<br />" + SHOPClass.Finans.Hesaplama.GecmisDovizCevir(i.fiyat.ToString(), int.Parse(i.para_birimi_id.ToString()), SHOPClass.Fonksiyonlar.Genel.SiparisKurTarih(int.Parse(Request.QueryString["ID"].ToString()))) + " " + KullanilacakDovizAd);
                                }

                                string ToplamIndirimliFiyat = SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.IndirimKomisyonHesapla(i.fiyat.ToString(), "0", SHOPObjeler.Tanimlar.IndirimKomisyonTipleri.Fiyat, int.Parse(e.Row.Cells[3].Text)));

                                e.Row.Cells[4].Text = SHOPClass.Finans.Hesaplama.GecmisDovizCevir(ToplamIndirimliFiyat, int.Parse(i.para_birimi_id.ToString()), SHOPClass.Fonksiyonlar.Genel.SiparisKurTarih(int.Parse(Request.QueryString["ID"].ToString()))) + " " + KullanilacakDovizAd;
                            }

                            e.Row.Cells[2].Text = sb.ToString();
                        }
                    }
                }
            }
        }

        protected void btn_havale_bildirimi_yap_Click(object sender, EventArgs e)
        {
            Response.Redirect("/payment-manifesto.aspx?ID=" + Request.QueryString["ID"].ToString(), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}