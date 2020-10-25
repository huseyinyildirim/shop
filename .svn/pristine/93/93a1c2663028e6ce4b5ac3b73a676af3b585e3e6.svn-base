using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using _PosnetDotNetModule;

//!++ Dövizli işlemler (US ve EU) sadece yabancı kredi kartları ile yapılabilmektedir.
//!++ Dolayısı ile dövizli yapılabilecek işlem tipleri, Peşin Provizyon, Peşin Satış ve Peşin Finansallaştırma işlemleridir.

//- Joker Vadaa Sorgulama Dönüş Değerleri
//- GetCampMessageCount  İlgili kredi kartı içi kullanılabilecek toplam Joker Vadaa sayısı 
//- GetCampCode(index As Integer)  Her bir Joker Vadaa işleminin Joker Vadaa kodu. Örneğin ilgili kredi kartının toplam iki Joker Vadaa ‘sı var ise, birinci Joker Vadaa ‘nın kodunu öğrenmek için GetCampCode(1), ikinci Joker Vadaa ‘nın kodunu öğrenmek için ise GetCampCode(2) fonksiyonu çağrılır.
//- GetCampMessage(index As Integer)  Her bir Joker Vadaa işleminin Joker Vadaa açıklaması. Örneğin ilgili kredi kartının toplam iki Joker Vadaa ‘sı var ise, birinci Joker Vadaa ‘nın açıklamasını öğrenmek için GetCampMessage(1), ikinci Joker Vadaa ‘nın açıklamasını öğrenmek için ise GetCampMessage (2) fonksiyonu çağrılır.

public enum MessageTypes
{
    OK, ERROR, Other
}

public enum ResultTypes
{
    YES, NO
}

public enum ProcessTypes
{
    Bin, Puan, Vade, Otorizasyon, Satis
}

public class Messages
{
    public MessageTypes Type { get; set; }
    public string Header { get; set; }
    public string Text { get; set; }
}

public class Process
{
    public ProcessTypes ProcessType { get; set; }
    public ResultTypes ResultType { get; set; }
    public Messages Message { get; set; }
    public PosIslem PosIslem { get; set; }
}

public class PosIslem
{
    public string DurumKodu { get; set; }
    public string OnayKodu { get; set; }
    public string ReferansNumarasi { get; set; }
    public string KullanilabilirToplamPuan { get; set; }
    public string KullanilabilirToplamPuanTutari { get; set; }
    public string KazanilanToplamPuan { get; set; }
    public string KazanilanToplamPuanTutari { get; set; }
    public string TaksitSayisi { get; set; }
    public string TaksitTutari { get; set; }
    public string VadeTutari { get; set; }
    public string VadeOrani { get; set; }
    public string VadeGunSayisi { get; set; }
    public string HataMesaji { get; set; }
    public string HataMesajiKodu { get; set; }
    public PosIslem() { }
    public PosIslem(string _DurumKodu, string _OnayKodu, string _ReferansNumarasi, string _KullanilabilirToplamPuan, string _KullanilabilirToplamPuanTutari, string _KazanilanToplamPuan, string _KazanilanToplamPuanTutari, string _TaksitSayisi, string _TaksitTutari, string _VadeTutari, string _VadeOrani, string _VadeGunSayisi, string _HataMesaji, string _HataMesajiKodu)
    {
        _DurumKodu = DurumKodu;
        _OnayKodu = OnayKodu;
        _ReferansNumarasi = ReferansNumarasi;
        _KullanilabilirToplamPuan = KullanilabilirToplamPuan;
        _KullanilabilirToplamPuanTutari = KullanilabilirToplamPuanTutari;
        _KazanilanToplamPuan = KazanilanToplamPuan;
        _KazanilanToplamPuanTutari = KazanilanToplamPuanTutari;
        _TaksitSayisi = TaksitSayisi;
        _TaksitTutari = TaksitTutari;
        _VadeTutari = VadeTutari;
        _VadeOrani = VadeOrani;
        _VadeGunSayisi = VadeGunSayisi;
        _HataMesaji = HataMesaji;
        _HataMesajiKodu = HataMesajiKodu;
    }
}

/*
//Onay Kodu				
CP.GetAuthcode()

//Referans numarası
CP.GetHostlogkey()

//Kullanılabilir Toplam Puan
CP.GetTotalPoint()
//Kullanılabilir Toplam Puan Tutarı
CP.GetTotalPointAmount()
//Kazanılan Toplam Puan
CP.GetPoint()
//Kazanılan Toplam Puan Tutarı
CP.GetPointAmount()

//Taksit sayısı
CP.GetInstalmentNumber()
//Taksit tutarı
TLCevir(CP.GetInstalmentAmount())

//Vade tutarı
TLCevir(CP.GetVFTAmount())
//Vade oranı
CP.GetVFTRate()
//Vade gün sayısı
CP.GetVFTDayCount()

//Uyarı Mesajı
CP.GetApprovedCode()

CP.GetResponseText()
CP.GetResponseCode()
*/

public partial class pos_test : System.Web.UI.Page
{
    /*
    Process P = new Process();

    //! Para birimi (YT, US, EU)

    #region Enum Tanımlama
    Dictionary<int, string> EnumIcerigi = Enum.GetValues(typeof(IslemTipleri)).Cast<IslemTipleri>().Select(e => new KeyValuePair<int, string>((int)e, e.ToString())).ToDictionary(p => p.Key, p => p.Value);

    public enum IslemTipleri
    {
        Provizyon = 0,
        Puan_Kullandirma = 1,
        Puan_Sorgulama = 2,
        Puanli_Satis = 3,
        Satis = 4,
        Vade_Farki_Sorgulama = 5,
        Vade_Farkli_Satis = 6
    }
    #endregion

    #region Değişkenler
    string IslemID = "MBTEST_";

    string Tutar = "10000"; //+ YKR istiyor mal! 1522 = 15,22 TL oluyor.
    string Puan = "200";    //+ YKR istiyor mal! 200 = 2 TL oluyor.

    string Pesin = "00";
    string Taksit = "06";

    string vtfCode = "K001";
    #endregion

    #region Kart Bilgileri
    List<SHOPObjeler.Tanimlar.TestKrediKart> TestKartlari = SHOPClass.Odemeler.Pos.TestKrediKart(1);
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownDoldur();
        }
    }

    protected string TLCevir(string KurusTutari)
    {
        string sonuc = "0";

        try
        {
            if (!string.IsNullOrEmpty(KurusTutari))
            {
                double Kurus = double.Parse(KurusTutari);
                sonuc = (Kurus / 100).ToString();
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

    protected void DropDownDoldur()
    {
        #region Kartları Doldur
        foreach (var i in TestKartlari)
        {
            DropDownList2.Items.Add(new ListItem(i.KartNo, i.KartNo.ToString()));
        }
        #endregion

        #region İşlemleri Doldur
        DropDownList1.Items.Add(new ListItem("SEÇİNİZ", "-1"));

        foreach (var i in EnumIcerigi)
        {
            DropDownList1.Items.Add(new ListItem(i.Value, i.Key.ToString()));
        }
        #endregion
    }

    protected void PosTest(IslemTipleri Tip, SHOPObjeler.Tanimlar.TestKrediKart KK)
    {
        try
        {
            #region Create Instance
            StringBuilder SB = new StringBuilder();
            Boolean B = false;
            C_Posnet CP = new C_Posnet();
            #endregion

            #region POS Bilgileri
            if (SHOPClass.Odemeler.Pos.Test(1))
            {
                CP.SetURL(SHOPClass.Odemeler.Pos.TestURL(1));
            }
            else
            {
                CP.SetURL(SHOPClass.Odemeler.Pos.URL(1));
            }

            CP.SetMid(SHOPClass.Odemeler.Pos.MagazaNo(1));
            CP.SetTid(SHOPClass.Odemeler.Pos.ApiKullanici(1));
            #endregion

            #region Islem ID
            //! 24 karakter istiyor
            IslemID = IslemID + (new Random((int)DateTime.Now.Ticks)).Next().ToString() + (new Random((int)DateTime.Now.Ticks)).Next().ToString();
            IslemID = IslemID.Substring(0, 24);
            #endregion

            switch (Tip)
            {
                case IslemTipleri.Provizyon:
                    B = CP.DoAuthTran(KK.KartNo, TersCevir(KK.SonKullanim), KK.CVC, IslemID, Tutar, "YT", Pesin);
                    break;

                case IslemTipleri.Puan_Kullandirma:
                    B = CP.DoPointUsageTran(KK.KartNo, TersCevir(KK.SonKullanim), IslemID, Tutar, "YT");
                    break;

                case IslemTipleri.Puan_Sorgulama:
                    B = CP.DoPointInquiryTran(KK.KartNo, TersCevir(KK.SonKullanim));
                    break;

                case IslemTipleri.Puanli_Satis:
                    B = CP.DoSaleWPTran(KK.KartNo, TersCevir(KK.SonKullanim), KK.CVC, IslemID, Tutar, Puan, "YT", Pesin);
                    break;

                case IslemTipleri.Satis:
                    B = CP.DoSaleTran(KK.KartNo, TersCevir(KK.SonKullanim), KK.CVC, IslemID, Tutar, "YT", Pesin);
                    break;

                case IslemTipleri.Vade_Farki_Sorgulama:
                    B = CP.DoVFTInquiry(KK.KartNo, Tutar, Taksit, vtfCode);
                    break;

                case IslemTipleri.Vade_Farkli_Satis:
                    B = CP.DoVFTSale(KK.KartNo, TersCevir(KK.SonKullanim), KK.CVC, IslemID, Tutar, "YT", Pesin, vtfCode);
                    break;
            }

            if (B == true)
            {
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
                    if (!string.IsNullOrEmpty(CP.GetAuthcode().Trim()))
                    {
                        SB.Append("<hr/>");
                        SB.Append("Onay Kodu: " + CP.GetAuthcode() + "<br />");
                        SB.Append("<hr/>");
                    }

                    if (!string.IsNullOrEmpty(CP.GetHostlogkey().Trim()))
                    {
                        SB.Append("<hr/>");
                        SB.Append("Referans numarası: " + CP.GetHostlogkey() + "<br />");
                        SB.Append("<hr/>");
                    }
                    #endregion

                    #region Puan Bilgileri
                    SB.Append("<hr/>");
                    SB.Append("Kullanılabilir Toplam Puan: " + CP.GetTotalPoint() + "<br />");
                    SB.Append("Kullanılabilir Toplam Puan Tutarı: " + CP.GetTotalPointAmount() + "<br />");
                    SB.Append("Kazanılan Toplam Puan: " + CP.GetPoint() + "<br />");
                    SB.Append("Kazanılan Toplam Puan Tutarı: " + CP.GetPointAmount() + "<br />");
                    SB.Append("<hr/>");
                    #endregion

                    #region Taksit Bilgileri
                    SB.Append("<hr/>");
                    SB.Append("Taksit sayısı: " + CP.GetInstalmentNumber() + "<br />");
                    SB.Append("Taksit tutarı: " + TLCevir(CP.GetInstalmentAmount()) + "<br />");
                    SB.Append("<hr/>");
                    #endregion

                    #region Vade Bilgileri
                    SB.Append("<hr/>");
                    SB.Append("Vade tutarı: " + TLCevir(CP.GetVFTAmount()) + "<br />");
                    SB.Append("Vade oranı: " + CP.GetVFTRate() + "<br />");
                    SB.Append("Vade gün sayısı: " + CP.GetVFTDayCount() + "<br />");
                    SB.Append("<hr/>");
                    #endregion

                    #region Uyarı Mesajı
                    if (CP.GetApprovedCode() == "2")
                    {
                        SB.Append("<hr/>");
                        SB.Append(CP.GetResponseText() + "<br />");
                        SB.Append(CP.GetResponseCode() + "<br />");
                        SB.Append("<hr/>");
                    }
                    #endregion
                }
                else
                {
                    //- İşlem Onaylanmadıysa
                    #region INFO
                    //x GetResponseCode Hata kodu
                    //x GetResponseText Hata mesajı
                    #endregion

                    #region Hata mesajı
                    SB.Append("<hr/>");
                    SB.Append("Hata kodu: " + CP.GetResponseText() + "<br />");
                    SB.Append("Hata mesajı: " + CP.GetResponseCode() + "<br />");
                    SB.Append("<hr/>");
                    #endregion
                }

            }
            else
            {
                SB.Append("<hr/>");
                SB.Append("ELSE GELDİ");
                SB.Append("<hr/>");
            }

            Literal1.Text = SB.ToString();
        }
        catch (Exception Ex)
        {
            Literal1.Text = Ex.Message;
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString() != "-1")
        {
            int a = int.Parse(DropDownList1.SelectedValue.ToString());
            IslemTipleri SI = (IslemTipleri)Enum.Parse(typeof(IslemTipleri), EnumIcerigi.Where(p => p.Key == a).Select(p => p.Value).FirstOrDefault());

            SHOPObjeler.Tanimlar.TestKrediKart K = (from p in TestKartlari
                                                  where p.KartNo == DropDownList2.SelectedValue.ToString()
                                                  select p).ToList()[0];

            PosTest(SI, K);
        }
        else
        {
            Literal1.Text = string.Empty;
        }
    }

    #region İşlemler
    public void IslemBin()
    {
    }

    public void IslemPuan()
    {
    }

    public void IslemVade()
    {
    }

    public void IslemOtorizasyon()
    {
    }

    public void IslemSatis()
    {
    }
    #endregion
     */
}