using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using MySQLDataModel;


namespace SHOP.ascx
{
    public partial class odeme_kredikarti : System.Web.UI.UserControl
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();
        int KullaniciID;

        //#region POS Objesi
        //SHOPObjeler.Tanimlar.POS POS = new SHOPObjeler.Tanimlar.POS();
        //#endregion
        //#region POS Durum Objesi
        //SHOPClass.Odemeler.POSDurum POSD = new SHOPClass.Odemeler.POSDurum();
        //#endregion
        //#region Ödeme Bilgileri Objesi
        //SHOPObjeler.Tanimlar.OdemeBilgileri OB = new SHOPObjeler.Tanimlar.OdemeBilgileri();
        //#endregion
        //#region Kart Bilgileri Objesi
        //SHOPObjeler.Tanimlar.KrediKart KK = new SHOPObjeler.Tanimlar.KrediKart();
        //#endregion

        //#region Değişkenler
        //string IslemID = "MBTEST_";
        //#endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();

            int index = -1;

            //Bu ne işe yarıyor anlamadım. Ben yazdım ben anlamıyorum :) Fazlalık gibi.
            index = SHOPObjeler.Listeler.SessionGenelID.FindIndex(delegate(SHOPObjeler.Tanimlar.SessionGenelID p)
            {
                return (p.KullaniciID == KullaniciID && p.OdemeTipi == SHOPClass.Sabitler.OdemeTipi.KrediKarti);
            });

            if (index > -1)
            {
                //Kredi Kartı
                SHOPObjeler.Listeler.SessionGenelID[index].ID = 2;
            }
            else
            {
                SHOPObjeler.Tanimlar.SessionGenelID SGI = new SHOPObjeler.Tanimlar.SessionGenelID();
                SGI.OdemeTipi = SHOPClass.Sabitler.OdemeTipi.KrediKarti;
                SGI.KullaniciID = KullaniciID;
                SGI.ID = 2;

                SHOPObjeler.Listeler.SessionGenelID.Add(SGI);
            }

            //btn_kredi_karti_odeme.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(157).ToUpper();
            lit_aciklama.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(288);

            if (!IsPostBack)
            {
                Banka();
                SonKullanmaTarihi();
                //TaksitBanka();

                #region Kart Tiplerini Alıyoruz
                Dictionary<int, string> EnumIcerigi = Enum.GetValues(typeof(SHOPClass.Sabitler.KartTipi)).Cast<SHOPClass.Sabitler.KartTipi>().Select(t => new KeyValuePair<int, string>((int)t, t.ToString())).ToDictionary(p => p.Key, p => p.Value);
                #endregion
                #region Kart Tiplerini Dolduruyoruz
                foreach (var i in EnumIcerigi)
                {
                    ddl_kart_tip.Items.Add(new ListItem(i.Value.ToString(), i.Key.ToString()));
                }
                #endregion
            }
        }

        protected void SonKullanmaTarihi()
        {
            ddl_son_tarih_ay.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(177), "0"));
            ddl_son_tarih_ay.Items.Add(new ListItem("01", "01"));
            ddl_son_tarih_ay.Items.Add(new ListItem("02", "02"));
            ddl_son_tarih_ay.Items.Add(new ListItem("03", "03"));
            ddl_son_tarih_ay.Items.Add(new ListItem("04", "04"));
            ddl_son_tarih_ay.Items.Add(new ListItem("05", "05"));
            ddl_son_tarih_ay.Items.Add(new ListItem("06", "06"));
            ddl_son_tarih_ay.Items.Add(new ListItem("07", "07"));
            ddl_son_tarih_ay.Items.Add(new ListItem("08", "08"));
            ddl_son_tarih_ay.Items.Add(new ListItem("09", "09"));
            ddl_son_tarih_ay.Items.Add(new ListItem("10", "10"));
            ddl_son_tarih_ay.Items.Add(new ListItem("11", "11"));
            ddl_son_tarih_ay.Items.Add(new ListItem("12", "12"));

            ddl_son_tarih_yil.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(178), "0"));
            for (int i = int.Parse(string.Format("{0:yy}", DateTime.Now.AddYears(-1))); i < int.Parse(string.Format("{0:yy}", DateTime.Now.AddYears(14))); i++)
            {
                ddl_son_tarih_yil.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void Banka()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_banka
                           orderby a.marka ascending
                           select new
                           {
                               a.id,
                               marka = a.marka != null ? a.marka : a.ad
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    ddl_banka.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(175), "0"));

                    foreach (var i in SQL)
                    {
                        ddl_banka.Items.Add(new ListItem(i.marka, i.id.ToString()));
                    }

                    ddl_banka.Items.Add(new ListItem(Class.Fonksiyonlar.Uygulama.SabitlerText(176), "-1"));
                }
            }
        }

        /*
        protected void TaksitBanka()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_sanal_pos
                           select new
                           {
                               a.id,
                               a.ikon,
                               taksitsayi = db.tbl_cpy_sanal_pos_oranlar.Where(p => p.sanal_pos_id == a.id).Count()
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<table width=\"100%\" summary=\"\"><tbody><tr>");
                    int i = 1;
                    foreach (var i in SQL)
                    {
                        if (i.taksitsayi > 0)
                        {
                            sb.Append("<td width=\"33%\" valign=\"top\">" + TaksitSecenekler(i.ikon, i.id) + "</td>");

                            if (i == 3)
                            {
                                sb.Append("</tr><tr>");
                                i = 1;
                            }
                            else
                            {
                                i++;
                            }
                        }
                    }
                    sb.Append("</tr></tbody></table>");

                    lit_taksitsecenekleri.Text = sb.ToString();
                }
                else
                {
                    lit_taksitsecenekleri.Text = "<div class=\"bilgi\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(128) + "</div>";
                }
            }
        }

        protected string TaksitSecenekler(string KartAdi, int SanalPosID)
        {
            double UrunFiyat = SHOPObjeler.Listeler.Sepet.Where(p => p.KullaniciID == (SHOPClass.Fonksiyonlar.Kullanici.Genel.ID())).Select(p => p.Toplam).FirstOrDefault();

            StringBuilder sb = new StringBuilder();
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                var SQL = (from a in db.tbl_sbt_sanal_pos_oran
                           where a.onay == true && a.sanal_pos_id == SanalPosID
                           select new
                           {
                               a.id,
                               a.ay,
                               a.oran
                           }).AsEnumerable();

                if (SQL.Any())
                {
                    int x = 0;
                    sb.Append("<table cellspacing=\"1\" class=\"taksitsecenek\" summary=\"\"><tbody><tr><td colspan=\"4\" class=\"banka\"><img src=\"/images/bank/" + KartAdi + "\" alt=\"\" /></td></tr><tr><td class=\"taksitbaslik\"></td><td class=\"taksitbaslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(129) + "</td><td class=\"taksit2baslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(130) + "</td><td class=\"taksit2baslik\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(131) + "</td></tr>");
                    foreach (var i in SQL)
                    {
                        sb.Append("<tr><td class=\"taksit\"><input id=\"kk_taksit_id\" type=\"radio\" name=\"kk_taksit_id\" value=\"" + i.id + "-" + SHOPClass.Finans.Hesaplama.KrediKartiTaksit(double.Parse(i.ay.ToString()), UrunFiyat, double.Parse(i.oran.ToString())) + "\"");
                        if (x == 0)
                        {
                            sb.Append(" checked");
                            x++;
                        }
                        sb.Append(" /></td><td class=\"taksit\">" + i.ay + "</td><td class=\"taksit2\">" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(double.Parse(i.ay.ToString()), UrunFiyat, double.Parse(i.oran.ToString()))) + " " + SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd() + "</td><td class=\"taksit2\">" + SHOPClass.Finans.Cevirme.ParaFormat(SHOPClass.Finans.Hesaplama.KrediKartiTaksit(1, UrunFiyat, double.Parse(i.oran.ToString()))) + " " + SHOPClass.Fonksiyonlar.Genel.KullanilacakDovizAd() + "</td></tr>");
                    }

                    var SQL2 = (from b in db.tbl_sbt_sanal_pos_banka
                                where b.sanal_pos_id == SanalPosID
                                select new
                                {
                                    banka = db.tbl_sbt_banka.Where(p => p.id == b.banka_id).Select(p => p.marka).FirstOrDefault() != null ? db.tbl_sbt_banka.Where(p => p.id == b.banka_id).Select(p => p.marka).FirstOrDefault() : db.tbl_sbt_banka.Where(p => p.id == b.banka_id).Select(p => p.ad).FirstOrDefault()
                                }).AsEnumerable();

                    if (SQL2.Any())
                    {
                        sb.Append("<tr><td colspan=\"3\">" + Class.Fonksiyonlar.Uygulama.SabitlerText(294) + " ");
                        int y = 1;
                        int sayi = SQL2.AsEnumerable().Count();
                        foreach (var i in SQL2)
                        {
                            sb.Append(i.banka);

                            if (y != sayi)
                            {
                                sb.Append(", ");
                                y++;
                            }
                            else
                            {
                                y = 1;
                            }
                        }
                        sb.Append("</td></tr>");
                    }

                    sb.Append("</tbody></table>");
                }
            }
            return sb.ToString();
        }
        */

        /*protected void btn_kredi_karti_odeme_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txt_banka.SelectedValue))
            {
                int BankaID = int.Parse(txt_banka.SelectedValue.ToString());
                int POSID = Class.Odemeler.Pos.POSID(BankaID);

                #region POS Bilgilerini Al
                if (POSID == 0)
                {
                    POS = Class.Odemeler.Pos.Bilgiler(1);
                }
                else
                {
                    POS = Class.Odemeler.Pos.Bilgiler(POSID);
                } 
                #endregion

                if (POS!=null)
                {
                    #region Ödeme Bilgileri
                    OB.ParaBirimiID = 1;
                    OB.Taksit = 6;
                    OB.Tutar = 15.22;
                    #endregion
                }
            }

            #region bu kodları kredi kartı işlemleri basamaklandırmak için yaptım, yani kk bilgilerini girdiğinde kontrol edip 2. adıma geçmek için kullanılıyor
            SHOPObjeler.Tanimlar.Secim S = new SHOPObjeler.Tanimlar.Secim();
            S.KullaniciID = SHOPClass.Fonksiyonlar.Kullanici.Genel.ID();
            S.Tanim = "pos";
            S.Deger = true;
            SHOPObjeler.Listeler.Secim.Add(S);
            #endregion
        }*/

        //protected void Yap()
        //{
        //    //- İşlem -> Bin Kontrolü Evet -> Puan Sorgula Evet -> Ön Otorizasyon Yada da Satış
        //    //- İşlem -> Bin Kontrolü Evet -> Puan Sorgula Hayır -> Vade Farkı Sorgulama Evet -> Ön Otorizasyon Yada da Satış
        //    //- İşlem -> Bin Kontrolü Hayır -> Vade Farkı Sorgulama Evet -> Ön Otorizasyon Yada da Satış

        //    if (BinKontrol(POS, KK))
        //    {
        //        #region Puan Sorgula
        //        POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Puan, POS, KK, OB);
        //        #endregion

        //        if (POSD.Message.Type == Class.Sabitler.MessageTypes.OK)
        //        {
        //            #region Ön Otorizasyon veya Satış
        //            if (POS.OnOtorizasyon)
        //            {
        //                POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon, POS, KK, OB);
        //            }
        //            else
        //            {
        //                POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Satis, POS, KK, OB);
        //            }
        //            #endregion
        //        }
        //        else
        //        {
        //            //HATA
        //        }
        //    }
        //    else
        //    {
        //        #region Vade Farkı Sorgula
        //        POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Vade, POS, KK, OB);
        //        #endregion

        //        if (POSD.Message.Type == Class.Sabitler.MessageTypes.OK)
        //        {
        //            #region Ön Otorizasyon veya Satış
        //            if (POS.OnOtorizasyon)
        //            {
        //                POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon, POS, KK, OB);
        //            }
        //            else
        //            {
        //                POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Satis, POS, KK, OB);
        //            }
        //            #endregion
        //        }
        //        else
        //        {
        //            //
        //        }
        //    }
        //}

        //#region POS İşlemleri
        ///// <summary>
        ///// Seçilen banka için Bin kontrolü ve gönderilen kart için Bin doğrulama işlemi yapıyor.
        ///// </summary>
        ///* Create FÜ - 10.08.2012
        // * Edit FÜ - 12.08.2012 - 18:23 If kısmına comment eklendi, Summary alanı açıklaması değiştirildi.
        // */
        ///// <param name="P">SHOPObjeler.Tanimlar.POS</param>
        ///// <param name="K">SHOPObjeler.Tanimlar.KrediKart</param>
        ///// <returns>
        ///// Bool döndürür
        ///// </returns>
        //protected bool BinKontrol(SHOPObjeler.Tanimlar.POS P, SHOPObjeler.Tanimlar.KrediKart K)
        //{
        //    if (P != null && K != null)
        //    {
        //        if (K.BankaID > 0)
        //        {
        //            bool B = (from p in P.Bankalar
        //                      where p.Key == K.BankaID
        //                      select p.Value).FirstOrDefault();

        //            #region Seçilen Bankada Bin Kontrolü Açıksa
        //            if (B)
        //            {
        //                if (!string.IsNullOrEmpty(K.KartNo))
        //                {
        //                    return SHOPClass.Odemeler.Pos.BinNoKontrol(K.BankaID, K.KartNo.Substring(0, 6));
        //                }
        //                else
        //                {
        //                    return false;
        //                }
        //            }
        //            #endregion
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}

        ///// <summary>
        ///// Puan Sorgulama, Vade Sorgulama, Ön Otorizasyon, Satış gibi POS İşlemlerini gerçekleştirir.
        ///// </summary>
        ///* Create FÜ - 00.00.00 - 00:00
        // * Edit FÜ - 12.08.2012 - 18:30 Summary kısmı eklendi.
        // */
        ///// <param name="PT">POS İşlem Tipleri Objesi</param>
        ///// <param name="P">POS Bilgileri Objesi</param>
        ///// <param name="K">Kredi Kartı Bilgileri Objesi</param>
        ///// <param name="O">Ödeme Bilgileri Objesi</param>
        ///// <returns>
        ///// Class.Odemeler.POSDurum objesi döndürür.
        ///// </returns>
        //protected SHOPClass.Odemeler.POSDurum PosIslem(SHOPClass.Sabitler.PosIslemTipleri PT, SHOPObjeler.Tanimlar.POS P, SHOPObjeler.Tanimlar.KrediKart K, SHOPObjeler.Tanimlar.OdemeBilgileri O)
        //{
        //    #region Obje İçin Yeni Instance Oluşturma
        //    SHOPObjeler.Tanimlar.POSIslem PI = new SHOPObjeler.Tanimlar.POSIslem();
        //    Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
        //    #endregion

        //    if (P != null && K != null)
        //    {
        //        try
        //        {
        //            #region YKB Pos Instance
        //            C_Posnet CP = new C_Posnet();
        //            #endregion

        //            #region Empty Bool Instance
        //            Boolean B = false;
        //            #endregion

        //            #region POS Bilgileri
        //            #region Mağaza ID, Terminal ID vb. Gibi Bilgileri Atama
        //            CP.SetMid(P.MID);
        //            CP.SetTid(P.TID);
        //            #endregion
        //            #region URL Ayarlama
        //            if (P.Test)
        //            {
        //                if (!string.IsNullOrEmpty(P.TestURL))
        //                {
        //                    CP.SetURL(P.TestURL);
        //                }
        //                else
        //                {
        //                    CP.SetURL(P.URL);
        //                }
        //            }
        //            else
        //            {
        //                CP.SetURL(P.URL);
        //            }
        //            #endregion
        //            #endregion

        //            #region Islem ID
        //            //! 24 karakter istiyor
        //            IslemID = IslemID + (new Random((int)DateTime.Now.Ticks)).Next().ToString() + (new Random((int)DateTime.Now.Ticks)).Next().ToString();
        //            IslemID = IslemID.Substring(0, 24);
        //            #endregion

        //            #region İşlem Tipleri
        //            switch (PT)
        //            {
        //                #region Puan Sorgula
        //                case SHOPClass.Sabitler.PosIslemTipleri.Puan:
        //                    #region İşlem Tipini Atama
        //                    POSD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Puan;
        //                    #endregion
        //                    B = CP.DoPointInquiryTran(K.KartNo, Class.Fonksiyonlar.Genel.TersCevir(K.SonKullanim));
        //                    break;
        //                #endregion

        //                #region Vade Farkı Öğren
        //                case SHOPClass.Sabitler.PosIslemTipleri.Vade:
        //                    #region İşlem Tipini Atama
        //                    POSD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Vade;
        //                    #endregion
        //                    B = CP.DoVFTInquiry(K.KartNo, SHOPClass.Finans.Cevirme.KurusCevir(O.Tutar.ToString()), O.Taksit.ToString(), P.KampanyaKodu);
        //                    break;
        //                #endregion

        //                #region Ön Otorizasyon Yap
        //                case SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon:
        //                    #region İşlem Tipini Atama
        //                    POSD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon;
        //                    #endregion
        //                    B = CP.DoAuthTran(K.KartNo, Class.Fonksiyonlar.Genel.TersCevir(K.SonKullanim), K.CVC, IslemID, SHOPClass.Finans.Cevirme.KurusCevir(O.Tutar.ToString()), P.ParaBirimleri.Where(x => x.Key == 1).Select(x => x.Value).FirstOrDefault(), O.Taksit.ToString());
        //                    break;
        //                #endregion

        //                #region Satış Yap
        //                case SHOPClass.Sabitler.PosIslemTipleri.Satis:
        //                    #region İşlem Tipini Atama
        //                    POSD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Satis;
        //                    #endregion
        //                    B = CP.DoSaleTran(K.KartNo, Class.Fonksiyonlar.Genel.TersCevir(K.SonKullanim), K.CVC, IslemID, SHOPClass.Finans.Cevirme.KurusCevir(O.Tutar.ToString()), P.ParaBirimleri.Where(x => x.Key == 1).Select(x => x.Value).FirstOrDefault(), O.Taksit.ToString());
        //                    break;
        //                #endregion
        //            }
        //            #endregion

        //            if (B == true)
        //            {
        //                #region Durum Kodu
        //                if (!string.IsNullOrEmpty(CP.GetApprovedCode()))
        //                {
        //                    PI.DurumKodu = CP.GetApprovedCode();
        //                }
        //                #endregion

        //                if (CP.GetApprovedCode() == "1" || CP.GetApprovedCode() == "2")
        //                {
        //                    //- İşlem Onaylandıysa
        //                    #region INFO
        //                    //x GetHostlogkey Referans numarası
        //                    //x GetAuthcode Onay Kodu
        //                    //x GetTotalPoint Kullanılabilir Toplam Puan
        //                    //x GetTotalPointAmount Kullanılabilir Toplam Puan Tutarı (Yeni Kuruş cinsinden)
        //                    //x GetPoint Kazanılan Toplam Puan
        //                    //x GetPointAmount Kazanılan Toplam Puan Tutarı (Yeni Kuruş cinsinden)
        //                    //x GetInstalmentNumber Taksit sayısı
        //                    //x GetInstalmentAmount Taksit tutarı (Yeni Kuruş cinsinden)
        //                    #endregion

        //                    #region Onay Bilgisi
        //                    #region Onay Kodu
        //                    if (!string.IsNullOrEmpty(CP.GetAuthcode().Trim()))
        //                    {
        //                        PI.OnayKodu = CP.GetAuthcode();
        //                    }
        //                    #endregion
        //                    #region Referans Numarası
        //                    if (!string.IsNullOrEmpty(CP.GetHostlogkey().Trim()))
        //                    {
        //                        PI.ReferansNumarasi = CP.GetHostlogkey();
        //                    }
        //                    #endregion
        //                    #endregion
        //                    #region Puan Bilgileri
        //                    if (!string.IsNullOrEmpty(CP.GetTotalPoint()))
        //                    {
        //                        PI.KullanilabilirToplamPuan = CP.GetTotalPoint();
        //                    }
        //                    if (!string.IsNullOrEmpty(CP.GetTotalPointAmount()))
        //                    {
        //                        PI.KullanilabilirToplamPuanTutari = CP.GetTotalPointAmount();
        //                    }
        //                    if (!string.IsNullOrEmpty(CP.GetPoint()))
        //                    {
        //                        PI.KazanilanToplamPuan = CP.GetPoint();
        //                    }
        //                    if (!string.IsNullOrEmpty(CP.GetPointAmount()))
        //                    {
        //                        PI.KazanilanToplamPuanTutari = CP.GetPointAmount();
        //                    }
        //                    #endregion
        //                    #region Taksit Bilgileri
        //                    if (!string.IsNullOrEmpty(CP.GetInstalmentNumber()))
        //                    {
        //                        PI.TaksitSayisi = CP.GetInstalmentNumber();
        //                    }
        //                    if (!string.IsNullOrEmpty(CP.GetInstalmentAmount()))
        //                    {
        //                        PI.TaksitTutari = SHOPClass.Finans.Cevirme.TLCevir(CP.GetInstalmentAmount());
        //                    }
        //                    #endregion
        //                    #region Vade Bilgileri
        //                    if (!string.IsNullOrEmpty(CP.GetVFTAmount()))
        //                    {
        //                        PI.VadeTutari = SHOPClass.Finans.Cevirme.TLCevir(CP.GetVFTAmount());
        //                    }
        //                    if (!string.IsNullOrEmpty(CP.GetVFTRate()))
        //                    {
        //                        PI.VadeOrani = CP.GetVFTRate();
        //                    }
        //                    if (!string.IsNullOrEmpty(CP.GetVFTDayCount()))
        //                    {
        //                        PI.VadeGunSayisi = CP.GetVFTDayCount();
        //                    }
        //                    #endregion
        //                    #region Dönüş Mesajı
        //                    POSD.Message.Type = Class.Sabitler.MessageTypes.OK;
        //                    POSD.Message.Header = "İşlem Başarılı";
        //                    POSD.Message.Text = "İşlem başarıyla gerçekleştirilmiştir.";
        //                    #endregion
        //                }
        //                else
        //                {
        //                    //- İşlem Onaylanmadıysa
        //                    #region INFO
        //                    //x GetResponseCode Hata kodu
        //                    //x GetResponseText Hata mesajı
        //                    #endregion

        //                    #region POS Hata Mesajı
        //                    if (!string.IsNullOrEmpty(CP.GetResponseCode()))
        //                    {
        //                        PI.HataMesajiKodu = CP.GetResponseCode();
        //                    }
        //                    if (!string.IsNullOrEmpty(CP.GetResponseText()))
        //                    {
        //                        PI.HataMesaji = CP.GetResponseText();
        //                    }
        //                    #endregion
        //                    #region Dönüş Mesajı
        //                    POSD.Message.Type = Class.Sabitler.MessageTypes.ERROR;
        //                    POSD.Message.Header = "Bir Hata Oluştu";
        //                    POSD.Message.Text = CP.GetResponseCode() + " - " + CP.GetResponseText();
        //                    #endregion
        //                }
        //            }
        //            else
        //            {
        //                #region Dönüş Mesajı
        //                M.Type = Class.Sabitler.MessageTypes.ERROR;
        //                M.Header = "Bir Hata Oluştu";
        //                M.Text = "False geldi.";
        //                #endregion
        //            }
        //        }
        //        catch (Exception Ex)
        //        {
        //            #region Dönüş Mesajı
        //            M.Type = Class.Sabitler.MessageTypes.ERROR;
        //            M.Header = "Bir Hata Oluştu";
        //            M.Text = Ex.Message;
        //            #endregion
        //        }
        //    }
        //    else
        //    {
        //        #region Dönüş Mesajı
        //        M.Type = Class.Sabitler.MessageTypes.Other;
        //        M.Header = "İşlem Hatası";
        //        M.Text = "POS yada Kart Objesi Boş Geldi.";
        //        #endregion
        //    }

        //    #region Objeye Diğer Objeleri Atama
        //    POSD.POSIslem = PI;
        //    POSD.Message = M;
        //    #endregion

        //    return POSD;
        //}
        //#endregion
    }
}