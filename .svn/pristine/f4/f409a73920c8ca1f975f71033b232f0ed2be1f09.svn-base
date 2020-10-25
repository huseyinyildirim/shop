using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Reflection;
using System.Text;
using System.Web.UI.WebControls;
using _PosnetDotNetModule;

//! setmpos.ykb.com/PosnetF1/yardim_tr/hataKodlari/02_sunucu.htm

public partial class POSTesti : System.Web.UI.Page
{
    SHOPObjeler.Tanimlar.OdemeBilgileri OB = new SHOPObjeler.Tanimlar.OdemeBilgileri();

    #region POS Durum Objesi
    SHOPClass.Odemeler.POSDurum PD = new SHOPClass.Odemeler.POSDurum();
    #endregion

    #region POS Objesi
    SHOPObjeler.Tanimlar.POS POS = new SHOPObjeler.Tanimlar.POS();
    #endregion

    #region Enum Tanımlama
    Dictionary<int, string> EnumIcerigi = new Dictionary<int, string>();
    #endregion

    #region Değişkenler
    string IslemID = "MBTEST_";

    //string Tutar = "10000"; //+ YKR istiyor mal! 1522 = 15,22 TL oluyor.
    //string Puan = "200";    //+ YKR istiyor mal! 200 = 2 TL oluyor.

    //string Pesin = "00";
    //string Taksit = "06";
    #endregion

    #region Kart Bilgileri
    List<SHOPObjeler.Tanimlar.KrediKart> TestKartlari = new List<SHOPObjeler.Tanimlar.KrediKart>();
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        #region Ödeme Bilgileri
        OB.ParaBirimiID = 1;
        OB.Taksit = 6;
        OB.Tutar = 15.22; 
        #endregion

        POS = SHOPClass.Odemeler.Pos.Bilgiler(1);
        TestKartlari = SHOPClass.Odemeler.Pos.TestKrediKart(1);
        EnumIcerigi = Enum.GetValues(typeof(SHOPClass.Sabitler.PosIslemTipleri)).Cast<SHOPClass.Sabitler.PosIslemTipleri>().Select(t => new KeyValuePair<int, string>((int)t, t.ToString())).ToDictionary(p => p.Key, p => p.Value);

        if (!IsPostBack)
        {
            DropDownDoldur();
        }
    }

    protected void MesajlariYaz()
    {
        if (IsPostBack)
        {
            LiteralIslemTipi.Text = PD.ProcessType.ToString();

            if (PD.POSIslem != null)
            {
                Dictionary<string, string> PIA = new Dictionary<string, string>();
                PIA = PD.POSIslem.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance).Select(p => PD.POSIslem.GetType().GetProperty(p.Name)).ToDictionary(p => p.Name, p => p.PropertyType.UnderlyingSystemType.Name);

                //List<SHOPObjeler.Tanimlar.POSIslem> PO = new List<SHOPObjeler.Tanimlar.POSIslem>();
                //PO.Add(PD.POSIslem);

                StringBuilder SB = new StringBuilder();

                foreach (var i in PIA)
                {
                    SB.Append("<p>");
                    SB.Append(i.Key + " :" + DegerOku(PD.POSIslem, i.Key));
                    SB.Append("</p>\r\n");
                }

                LiteralPosIslem.Text = SB.ToString();
            }

            if (PD.Message != null)
            {
                StringBuilder SB = new StringBuilder();

                SB.Append("<h1>");
                SB.Append(PD.Message.Header);
                SB.Append("</h1>\r\n");

                SB.Append("<p>");
                SB.Append(PD.Message.Text);
                SB.Append("</p>\r\n");

                LiteralMesaj.Text = SB.ToString();
            }
        }
        else
        {
            LiteralIslemTipi.Text = string.Empty;
            LiteralMesaj.Text = string.Empty;
            LiteralPosIslem.Text = string.Empty;
        }
    }

    #region Functions
    protected string TLCevir(string KurusTutar)
    {
        string sonuc = "0";

        try
        {
            if (!string.IsNullOrEmpty(KurusTutar))
            {
                double Kurus = double.Parse(KurusTutar);
                sonuc = (Kurus / 100).ToString();
            }

            return sonuc;
        }
        catch
        {
            return sonuc;
        }
    }

    protected string KurusCevir(string TLTutar)
    {
        string sonuc = "0";

        try
        {
            if (!string.IsNullOrEmpty(TLTutar))
            {
                double TL = double.Parse(TLTutar);
                sonuc = (TL * 100).ToString();
            }

            return sonuc;
        }
        catch
        {
            return sonuc;
        }
    }

    protected static string TersCevir(string s)
    {
        char[] arr = s.ToCharArray();
        Array.Reverse(arr);
        return new string(arr);
    }
    /// <summary>
    /// Degers the ver.
    /// </summary>
    /*
     * Create FÜ 11.08.2012 18:49
     */
    /// <param name="L">The L.</param>
    /// <param name="Alan">The alan.</param>
    /// <returns></returns>
    public static string DegerVer(List<SHOPObjeler.Tanimlar.POSIslem> L, string Alan)
    {
        try
        {
            string sonuc = L.AsQueryable().Select("" + Alan + "").Cast<object>().ToList()[0].ToString();

            if (!string.IsNullOrEmpty(sonuc))
            {
                return sonuc;
            }
            else
            {
                return null;
            }
        }
        catch
        {
            return null;
        }
    }

    public static string DegerOku(object P, string Alan)
    {
        try
        {
            PropertyInfo PI = P.GetType().GetProperty(Alan, BindingFlags.Public | BindingFlags.Instance);
            return PI.GetValue(P, null).ToString();
        }
        catch
        {
            return null;
        }
    }
    #endregion

    protected void DropDownDoldur()
    {
        #region Kartları Doldur
        foreach (var i in TestKartlari)
        {
            DropDownKartlar.Items.Add(new ListItem(i.KartNo, i.KartNo.ToString()));
        }
        #endregion

        #region İşlemleri Doldur
        DropDownIslemler.Items.Add(new ListItem("SEÇİNİZ", "-1"));

        foreach (var i in EnumIcerigi)
        {
            DropDownIslemler.Items.Add(new ListItem(i.Value, i.Key.ToString()));
        }
        #endregion
    }

    protected void DropDownIslemler_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownIslemler.SelectedValue.ToString() != "-1")
        {
            #region Kredi Kartı Objesi
            SHOPObjeler.Tanimlar.KrediKart KK = (from p in TestKartlari
                                                 where p.KartNo == DropDownKartlar.SelectedValue.ToString()
                                                 select p).ToList()[0];
            #endregion

            #region Enum Atama
            SHOPClass.Sabitler.PosIslemTipleri PT = (SHOPClass.Sabitler.PosIslemTipleri)Enum.Parse(typeof(SHOPClass.Sabitler.PosIslemTipleri), DropDownIslemler.SelectedValue.ToString());
            #endregion

            //- İşlem -> Bin Kontrolü Evet -> Puan Sorgula Evet -> Ön Otorizasyon Yada da Satış
            //- İşlem -> Bin Kontrolü Evet -> Puan Sorgula Hayır -> Vade Farkı Sorgulama Evet -> Ön Otorizasyon Yada da Satış
            //- İşlem -> Bin Kontrolü Hayır -> Vade Farkı Sorgulama Evet -> Ön Otorizasyon Yada da Satış

            SHOPClass.Odemeler.POSDurum POSD = new SHOPClass.Odemeler.POSDurum();

            if (BinKontrol(POS, KK))
            {
                #region Puan Sorgula
                POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Puan, POS, KK, OB); 
                #endregion

                if (POSD.Message.Type == Class.Sabitler.MessageTypes.OK)
                {
                    #region Ön Otorizasyon veya Satış
                    if (POS.OnOtorizasyon)
                    {
                        POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon, POS, KK, OB);
                    } 
                    else
                    {
                        POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Satis, POS, KK, OB);
                    }
                    #endregion
                }
                else
                {
                    //HATA
                }
            }
            else
            {
                #region Vade Farkı Sorgula
                POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Vade, POS, KK, OB); 
                #endregion

                if (POSD.Message.Type == Class.Sabitler.MessageTypes.OK)
                {
                    #region Ön Otorizasyon veya Satış
                    if (POS.OnOtorizasyon)
                    {
                        POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon, POS, KK, OB);
                    }
                    else
                    {
                        POSD = PosIslem(SHOPClass.Sabitler.PosIslemTipleri.Satis, POS, KK, OB);
                    }
                    #endregion
                }
                else
                {
                    //
                }
            }

            MesajlariYaz();
        }
    }

    #region İşlemler
    /// <summary>
    /// Seçilen banka için Bin kontrolü ve gönderilen kart için Bin doğrulama işlemi yapıyor.
    /// </summary>
    /* Create FÜ - 10.08.2012
     * Edit FÜ - 12.08.2012 - 18:23 If kısmına comment eklendi, Summary alanı açıklaması değiştirildi.
     */
    /// <param name="P">SHOPObjeler.Tanimlar.POS</param>
    /// <param name="K">SHOPObjeler.Tanimlar.KrediKart</param>
    /// <returns>
    /// Bool döndürür
    /// </returns>
    public bool BinKontrol(SHOPObjeler.Tanimlar.POS P, SHOPObjeler.Tanimlar.KrediKart K)
    {
        if (P != null && K != null)
        {
            if (K.BankaID > 0)
            {
                bool B = (from p in P.Bankalar
                          where p.Key == K.BankaID
                          select p.Value).FirstOrDefault();

                #region Seçilen Bankada Bin Kontrolü Açıksa
                if (B)
                {
                    if (!string.IsNullOrEmpty(K.KartNo))
                    {
                        return SHOPClass.Odemeler.Pos.BinNoKontrol(K.BankaID, K.KartNo.Substring(0, 6));
                    }
                    else
                    {
                        return false;
                    }
                }
                #endregion
                else
                {
                    return false;
                } 
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// Puan Sorgulama, Vade Sorgulama, Ön Otorizasyon, Satış gibi POS İşlemlerini gerçekleştirir.
    /// </summary>
    /* Create FÜ - 00.00.00 - 00:00
     * Edit FÜ - 12.08.2012 - 18:30 Summary kısmı eklendi.
     */
    /// <param name="PT">POS İşlem Tipleri Objesi</param>
    /// <param name="P">POS Bilgileri Objesi</param>
    /// <param name="K">Kredi Kartı Bilgileri Objesi</param>
    /// <param name="O">Ödeme Bilgileri Objesi</param>
    /// <returns>
    /// SHOPClass.Odemeler.POSDurum objesi döndürür.
    /// </returns>
    public SHOPClass.Odemeler.POSDurum PosIslem(SHOPClass.Sabitler.PosIslemTipleri PT, SHOPObjeler.Tanimlar.POS P, SHOPObjeler.Tanimlar.KrediKart K, SHOPObjeler.Tanimlar.OdemeBilgileri O)
    {
        #region Obje İçin Yeni Instance Oluşturma
        SHOPObjeler.Tanimlar.POSIslem PI = new SHOPObjeler.Tanimlar.POSIslem();
        Objeler.Tanimlar.Messages M = new Objeler.Tanimlar.Messages();
        #endregion

        if (P != null && K != null)
        {
            try
            {
                #region YKB Pos Instance
                C_Posnet CP = new C_Posnet();
                #endregion

                #region Empty Bool Instance
                Boolean B = false;
                #endregion

                #region POS Bilgileri
                #region Mağaza ID, Terminal ID vb. Gibi Bilgileri Atama
                CP.SetMid(P.MID);
                CP.SetTid(P.TID);
                #endregion
                #region URL Ayarlama
                if (P.Test)
                {
                    if (!string.IsNullOrEmpty(P.TestURL))
                    {
                        CP.SetURL(P.TestURL);
                    }
                    else
                    {
                        CP.SetURL(P.URL);
                    }
                }
                else
                {
                    CP.SetURL(P.URL);
                }
                #endregion
                #endregion

                #region Islem ID
                //! 24 karakter istiyor
                IslemID = IslemID + (new Random((int)DateTime.Now.Ticks)).Next().ToString() + (new Random((int)DateTime.Now.Ticks)).Next().ToString();
                IslemID = IslemID.Substring(0, 24);
                #endregion

                #region İşlem Tipleri
                switch (PT)
                {
                    #region Puan Sorgula
                    case SHOPClass.Sabitler.PosIslemTipleri.Puan:
                        #region İşlem Tipini Atama
                        PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Puan;
                        #endregion
                        B = CP.DoPointInquiryTran(K.KartNo, TersCevir(K.SonKullanim));
                        break;
                    #endregion

                    #region Vade Farkı Öğren
                    case SHOPClass.Sabitler.PosIslemTipleri.Vade:
                        #region İşlem Tipini Atama
                        PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Vade;
                        #endregion
                        B = CP.DoVFTInquiry(K.KartNo, KurusCevir(O.Tutar.ToString()), O.Taksit.ToString(), P.KampanyaKodu);
                        break;
                    #endregion

                    #region Ön Otorizasyon Yap
                    case SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon:
                        #region İşlem Tipini Atama
                        PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Otorizasyon;
                        #endregion
                        B = CP.DoAuthTran(K.KartNo, TersCevir(K.SonKullanim), K.CVC, IslemID, KurusCevir(O.Tutar.ToString()), P.ParaBirimleri.Where(x=>x.Key==1).Select(x=>x.Value).FirstOrDefault(), O.Taksit.ToString());
                        break;
                    #endregion

                    #region Satış Yap
                    case SHOPClass.Sabitler.PosIslemTipleri.Satis:
                        #region İşlem Tipini Atama
                        PD.ProcessType = SHOPClass.Sabitler.PosIslemTipleri.Satis;
                        #endregion
                        B = CP.DoSaleTran(K.KartNo, TersCevir(K.SonKullanim), K.CVC, IslemID, KurusCevir(O.Tutar.ToString()), P.ParaBirimleri.Where(x => x.Key == 1).Select(x => x.Value).FirstOrDefault(), O.Taksit.ToString());
                        break;
                    #endregion
                }
                #endregion

                if (B == true)
                {
                    #region Durum Kodu
                    if (!string.IsNullOrEmpty(CP.GetApprovedCode()))
                    {
                        PI.DurumKodu = CP.GetApprovedCode();
                    }
                    #endregion

                    if (CP.GetApprovedCode() == "1" || CP.GetApprovedCode() == "2")
                    {
                        //- İşlem Onaylandıysa
                        #region INFO
                        //x GetHostlogkey Referans numarası
                        //x GetAuthcode Onay Kodu
                        //x GetTotalPoint Kullanılabilir Toplam Puan
                        //x GetTotalPointAmount Kullanılabilir Toplam Puan Tutarı (Yeni Kuruş cinsinden)
                        //x GetPoint Kazanılan Toplam Puan
                        //x GetPointAmount Kazanılan Toplam Puan Tutarı (Yeni Kuruş cinsinden)
                        //x GetInstalmentNumber Taksit sayısı
                        //x GetInstalmentAmount Taksit tutarı (Yeni Kuruş cinsinden)
                        #endregion

                        #region Onay Bilgisi
                        #region Onay Kodu
                        if (!string.IsNullOrEmpty(CP.GetAuthcode().Trim()))
                        {
                            PI.OnayKodu = CP.GetAuthcode();
                        }
                        #endregion
                        #region Referans Numarası
                        if (!string.IsNullOrEmpty(CP.GetHostlogkey().Trim()))
                        {
                            PI.ReferansNumarasi = CP.GetHostlogkey();
                        }
                        #endregion
                        #endregion
                        #region Puan Bilgileri
                        if (!string.IsNullOrEmpty(CP.GetTotalPoint()))
                        {
                            PI.KullanilabilirToplamPuan = CP.GetTotalPoint();
                        }
                        if (!string.IsNullOrEmpty(CP.GetTotalPointAmount()))
                        {
                            PI.KullanilabilirToplamPuanTutari = CP.GetTotalPointAmount();
                        }
                        if (!string.IsNullOrEmpty(CP.GetPoint()))
                        {
                            PI.KazanilanToplamPuan = CP.GetPoint();
                        }
                        if (!string.IsNullOrEmpty(CP.GetPointAmount()))
                        {
                            PI.KazanilanToplamPuanTutari = CP.GetPointAmount();
                        }
                        #endregion
                        #region Taksit Bilgileri
                        if (!string.IsNullOrEmpty(CP.GetInstalmentNumber()))
                        {
                            PI.TaksitSayisi = CP.GetInstalmentNumber();
                        }
                        if (!string.IsNullOrEmpty(CP.GetInstalmentAmount()))
                        {
                            PI.TaksitTutari = TLCevir(CP.GetInstalmentAmount());
                        }
                        #endregion
                        #region Vade Bilgileri
                        if (!string.IsNullOrEmpty(CP.GetVFTAmount()))
                        {
                            PI.VadeTutari = TLCevir(CP.GetVFTAmount());
                        }
                        if (!string.IsNullOrEmpty(CP.GetVFTRate()))
                        {
                            PI.VadeOrani = CP.GetVFTRate();
                        }
                        if (!string.IsNullOrEmpty(CP.GetVFTDayCount()))
                        {
                            PI.VadeGunSayisi = CP.GetVFTDayCount();
                        }
                        #endregion
                        #region Dönüş Mesajı
                        PD.Message.Type = Class.Sabitler.MessageTypes.OK;
                        PD.Message.Header = "İşlem Başarılı";
                        PD.Message.Text = "İşlem başarıyla gerçekleştirilmiştir.";
                        #endregion
                    }
                    else
                    {
                        //- İşlem Onaylanmadıysa
                        #region INFO
                        //x GetResponseCode Hata kodu
                        //x GetResponseText Hata mesajı
                        #endregion

                        #region POS Hata Mesajı
                        if (!string.IsNullOrEmpty(CP.GetResponseCode()))
                        {
                            PI.HataMesajiKodu = CP.GetResponseCode();
                        }
                        if (!string.IsNullOrEmpty(CP.GetResponseText()))
                        {
                            PI.HataMesaji = CP.GetResponseText();
                        }
                        #endregion
                        #region Dönüş Mesajı
                        PD.Message.Type = Class.Sabitler.MessageTypes.ERROR;
                        PD.Message.Header = "Bir Hata Oluştu";
                        PD.Message.Text = CP.GetResponseCode() + " - " + CP.GetResponseText();
                        #endregion
                    }
                }
                else
                {
                    #region Dönüş Mesajı
                    M.Type = Class.Sabitler.MessageTypes.ERROR;
                    M.Header = "Bir Hata Oluştu";
                    M.Text = "False geldi.";
                    #endregion
                }
            }
            catch (Exception Ex)
            {
                #region Dönüş Mesajı
                M.Type = Class.Sabitler.MessageTypes.ERROR;
                M.Header = "Bir Hata Oluştu";
                M.Text = Ex.Message;
                #endregion
            }
        }
        else
        {
            #region Dönüş Mesajı
            M.Type = Class.Sabitler.MessageTypes.Other;
            M.Header = "İşlem Hatası";
            M.Text = "POS yada Kart Objesi Boş Geldi.";
            #endregion
        }

        #region Objeye Diğer Objeleri Atama
        PD.POSIslem = PI;
        PD.Message = M;
        #endregion

        return PD;
    }
    #endregion
}