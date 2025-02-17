﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects.DataClasses;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;
using iTextSharp.text.pdf;
using MySQLDataModel;
using Newtonsoft.Json;

namespace SHOP
{
    public class Class
    {
        public class Sabitler
        {
            public enum Onay
            {
                Var = 1,
                Yok = 0
            }

            public class StringIslemleri
            {
                public class HarfClass
                {
                    public enum Tip
                    {
                        Buyuk, Kucuk
                    }

                    public enum Islem
                    {
                        Hepsi, IlkHarf, IlkKelime, Secilenler
                    }
                }

                public enum StringIslemTipleri
                {
                    TelFormatla, IbanFormatla, SQLTemizle, DosyaAdiizle, StringTemizle, StringTemizleAdres, Etiket, TurkceKarakter
                }
            }

            public enum Dil
            {
                TR = 0,
                Diger = 1
            }

            public enum Dosya
            {
                Resim = 0,
                Video = 1,
                Diger = 2
            }

            public enum KullaniciTip
            {
                Admin = 0,
                Kullanici = 1
            }

            public enum Ziyaret
            {
                URUN = 0,
                KATEGORI = 1,
                ETIKET = 2,
                MARKA = 3
            }

            /// <summary>
            ///  OK, ERROR, Other şeklindeki mesaj tipleri
            /// -   (Created By Fatih ÜNAL - 10.08.2012)
            /// </summary>
            public enum MessageTypes
            {
                OK, ERROR, Other
            }

            public class Hiza
            {
                public enum Konum
                {
                    Sol = 0,
                    Sag = 1
                }

                public enum Yer
                {
                    Ust = 0,
                    Alt = 1
                }
            }

            public class AdminLog
            {
                public enum Islemler
                {
                    Insert = 0,
                    Update = 1,
                    Delete = 2
                }

                public enum Hatalar
                {
                    KullaniciYok = 0,
                    SifreYanlis = 1,
                    OnayYok = 2
                }

                public enum Oturum
                {
                    Giris = 0,
                    Cikis = 1
                }
            }
        }

        public class Degiskenler
        {
            public class Site
            {
                public static string ResimUzantilari = "*.jpg,*.gif,*.png,*.bmp,*.JPG,*.GIF,*.PNG,*.BMP";

                public class Yollar
                {
                    public static string Ana = @HttpContext.Current.Request.ServerVariables["APPL_PHYSICAL_PATH"];

                    public static string Resim = Ana + "images\\";
                    public static string UserFiles = Ana + "userfiles\\";
                    public static string Bayrak = Resim + "flag\\";

                    public static string Urun = UserFiles + "product\\";
                    public static string Header = UserFiles + "header\\";
                    public static string Diger = UserFiles + "other\\";
                    public static string Kategori = UserFiles + "categori\\";
                    public static string Haber = UserFiles + "news\\";
                    public static string Marka = UserFiles + "brand\\";
                }
            }

            public class Diger
            {
                public static string vbCrLf = "\r\n";
            }
        }

        public class Fonksiyonlar
        {
            /// <summary>
            /// Firma bilgilerinde domain alanında http:// var mı yok mu kontrol ediyor, yoksa http:// ekliyor
            /// </summary>
            /*
             * Create HY 13.08.2012 13:07
             */
            public static string FirmaDomainHttpKontrol()
            {
#if DEBUG
                try
                {
#endif
                    if (Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault().ToString().StartsWith("http://www."))
                    {
                        return Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault();
                    }
                    else
                    {
                        return "http://www." + Class.Fonksiyonlar.Firma.Bilgi().Select(p => p.domain).FirstOrDefault();
                    }
#if DEBUG
                }
                catch (Exception ex)
                {
                    Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    return null;
                }
#endif
            }

            public class UserKontrol
            {
                public static void ElemanGizle(int Tip, string UserControlAdi, string ElementID, bool Durum)
                {
#if DEBUG
                    try
                    {
#endif
                        //Tip 0 Literal, 1 Placeholder
                        UserControl UC = (UserControl)((Page)HttpContext.Current.Handler).FindControl(UserControlAdi);

                        switch (Tip)
                        {
                            case 0:
                                System.Web.UI.WebControls.Literal Li = UC.FindControl(ElementID) as System.Web.UI.WebControls.Literal;
                                Li.Visible = Durum;
                                break;

                            case 1:
                                System.Web.UI.WebControls.PlaceHolder Ph = UC.FindControl(ElementID) as System.Web.UI.WebControls.PlaceHolder;
                                Ph.Visible = Durum;
                                break;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static void HeaderText(string UserControlAdi, string LiteralID, string Text)
                {
#if DEBUG
                    try
                    {
#endif
                        if (LiteralID == "Title")
                        {
                            var Page = (Page)HttpContext.Current.Handler;
                            Page.Title = Text;
                        }
                        else
                        {
                            UserControl UC = (UserControl)((Page)HttpContext.Current.Handler).FindControl(UserControlAdi);
                            System.Web.UI.WebControls.Literal Li = UC.FindControl(LiteralID) as System.Web.UI.WebControls.Literal;
                            Li.Text = Text;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }
            }

            public class ResimIslemleri
            {
                public static ImageCodecInfo Enkoder(ImageFormat ResimFormati)
                {
#if DEBUG
                    try
                    {
#endif
                        ImageCodecInfo[] ICI = ImageCodecInfo.GetImageDecoders();

                        foreach (ImageCodecInfo i in ICI)
                        {
                            if (i.FormatID == ResimFormati.Guid)
                            {
                                return i;
                            }
                        }

                        return null;
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                public static void Getir(System.Drawing.Image Resim, int Width, int Height, Color Renk, bool Kirp, Int64 Kalite, int Cozunurluk)
                {
#if DEBUG
                    try
                    {
#endif
                        using (Resim)
                        {
                            using (EncoderParameters EP = new EncoderParameters(1))
                            {
                                EP.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, Kalite);

                                using (Bitmap B2 = new Bitmap(Boyutlandir(Resim, Width, Height, Renk, Kirp)))
                                {
                                    if (B2.HorizontalResolution != Cozunurluk || B2.VerticalResolution != Cozunurluk)
                                    {
                                        B2.SetResolution((float)Cozunurluk, (float)Cozunurluk);
                                    }

                                    B2.Save(HttpContext.Current.Response.OutputStream, Enkoder(Format(Resim)), EP);
                                }
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static ImageFormat Format(System.Drawing.Image Resim)
                {
                    ImageFormat I = null;

#if DEBUG
                    try
                    {
#endif
                        using (Resim)
                        {
                            if (Resim.RawFormat.Equals(ImageFormat.Jpeg))
                            {
                                I = ImageFormat.Jpeg;
                            }
                            else if (Resim.RawFormat.Equals(ImageFormat.Bmp))
                            {
                                I = ImageFormat.Bmp;
                            }
                            else if (Resim.RawFormat.Equals(ImageFormat.Gif))
                            {
                                I = ImageFormat.Gif;
                            }
                            else if (Resim.RawFormat.Equals(ImageFormat.Png))
                            {
                                I = ImageFormat.Png;
                            }
                            #region Gereksizler
                            /*
                        else if (Resim.RawFormat.Equals(ImageFormat.Emf))
                        {
                            I = ImageFormat.Emf;
                        }
                        else if (Resim.RawFormat.Equals(ImageFormat.Exif))
                        {
                            I = ImageFormat.Exif;
                        }
                        else if (Resim.RawFormat.Equals(ImageFormat.Icon))
                        {
                            I = ImageFormat.Icon;
                        }
                        else if (Resim.RawFormat.Equals(ImageFormat.Tiff))
                        {
                            I = ImageFormat.Tiff;
                        }
                        else if (Resim.RawFormat.Equals(ImageFormat.Wmf))
                        {
                            I = ImageFormat.Wmf;
                        }
                        */
                            #endregion
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        I = ImageFormat.Jpeg;
                    }
#endif

                    return I;
                }

                public static System.Drawing.Image Boyutlandir(System.Drawing.Image Resim, int Width, int Height, Color Renk, bool Kirp)
                {
                    Bitmap B = null;
#if DEBUG
                    try
                    {
#endif
                        #region Değişkenler
                        int ResimW = Resim.Width;
                        int ResimH = Resim.Height;
                        int ResimX = 0;
                        int ResimY = 0;
                        int SonucX = 0;
                        int SonucY = 0;

                        float Yuzde = 0;
                        float YuzdeW = 0;
                        float YuzdeH = 0;

                        YuzdeW = ((float)Width / (float)ResimW);
                        YuzdeH = ((float)Height / (float)ResimH);

                        if (YuzdeH < YuzdeW)
                        {
                            Yuzde = YuzdeH;
                            SonucX = System.Convert.ToInt16((Width - (ResimW * Yuzde)) / 2);
                        }
                        else
                        {
                            Yuzde = YuzdeW;
                            SonucY = System.Convert.ToInt16((Height - (ResimH * Yuzde)) / 2);
                        }

                        int SonucW = (int)(ResimW * Yuzde);
                        int SonucH = (int)(ResimH * Yuzde);
                        #endregion

                        if (Kirp)
                        {
                            B = new Bitmap(Width, Height);
                        }
                        else
                        {
                            B = new Bitmap(SonucW, SonucH);
                        }

                        //B.SetResolution(Resim.HorizontalResolution,Resim.VerticalResolution);

                        using (Graphics G = Graphics.FromImage(B))
                        {
                            if (Kirp)
                            {
                                G.Clear(Renk);
                            }

                            #region Resim Kalitesi
                            G.CompositingQuality = CompositingQuality.HighQuality;
                            G.SmoothingMode = SmoothingMode.HighQuality;
                            G.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            G.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            #endregion

                            if (Kirp)
                            {
                                G.DrawImage(Resim, new Rectangle(SonucX, SonucY, SonucW, SonucH), new Rectangle(ResimX, ResimY, ResimW, ResimH), GraphicsUnit.Pixel);
                            }
                            else
                            {
                                G.DrawImage(Resim, 0, 0, SonucW, SonucH);
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return B;
                }
            }

            public class CookieIslemleri
            {
                public static void BosCookie(string CookieAdi, bool Guvenli, DateTime SonSure)
                {
#if DEBUG
                    try
                    {
#endif
                        HttpCookie HC = new HttpCookie(CookieAdi);
                        HC.Expires = SonSure;
                        HC.Secure = Guvenli;
                        HttpContext.Current.Response.Cookies.Add(HC);
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static void DegerYaz(string CookieAdi, string DegerAdi, string Deger)
                {
#if DEBUG
                    try
                    {
#endif
                        HttpContext.Current.Response.Cookies[CookieAdi].Values.Remove(DegerAdi);
                        HttpContext.Current.Response.Cookies[CookieAdi].Values.Add(DegerAdi, Deger);
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static string DegerVer(string CookieAdi, string DegerAdi)
                {
                    string b = null;

#if DEBUG
                    try
                    {
#endif
                        if (true)
                        {
                            b = HttpContext.Current.Response.Cookies[CookieAdi].Values.Get(DegerAdi);
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return b;
                }

                //KULLANIMI//
                /*
                Class.Fonksiyonlar.CookieIslemleri.BosCookie("VITRIN", true, DateTime.Now.AddDays(1));
                Class.Fonksiyonlar.CookieIslemleri.DegerVer("VITRIN", "logo");
                Class.Fonksiyonlar.CookieIslemleri.DegerYaz("VITRIN", "logo", "1");
                */
            }

            public class Firma
            {
                public static List<tbl_sbt_firma> Bilgi()
                {
                    List<tbl_sbt_firma> SQL = new List<tbl_sbt_firma>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            SQL = (from p in db.tbl_sbt_firma
                                   where p.id == 1
                                   select p).AsEnumerable().Take(1).Cast<tbl_sbt_firma>().ToList();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return SQL;
                }

                public static List<tbl_sbt_ayar> Ayar()
                {
                    List<tbl_sbt_ayar> SQL = new List<tbl_sbt_ayar>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            SQL = (from p in db.tbl_sbt_ayar
                                   where p.id == 1
                                   select p).AsEnumerable().Take(1).Cast<tbl_sbt_ayar>().ToList();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return SQL;
                }
            }

            public class Genel
            {
                public static string OzelAyar(string DegerAdi)
                {
#if DEBUG
                    try
                    {
#endif
                        if (Moduller.OzelAyar.GetConfig().Ayar.Count > 0)
                        {
                            #region Dictionary Oluştur
                            Dictionary<string, string> D = new Dictionary<string, string>();
                            #endregion

                            #region Ayarları Dictinonarye At
                            foreach (Moduller.OzelAyarState i in Moduller.OzelAyar.GetConfig().Ayar)
                            {
                                D.Add(i.Ad, i.Deger);
                            }
                            #endregion

                            #region Dictionaryde Veri Varsa
                            if (D.Count > 0)
                            {
                                return D.Where(k => k.Key == DegerAdi).Select(k => k.Value).FirstOrDefault();
                            }
                            #endregion
                            #region Dictionaryde Veri Yoksa
                            else
                            {
                                return null;
                            }
                            #endregion
                        }
                        else
                        {
                            return null;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                public class Mail
                {
                    /// <summary>
                    /// Mail gönderimleri için html header kalıbı
                    /// </summary> 
                    /*
                     * Create HY 17.08.12 13:21
                    */
                    public static string MailHtmlHeader(string Html, string Style)
                    {
#if DEBUG
                        try
                        {
#endif
                            StringBuilder sb = new StringBuilder();
                            sb.Append("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
                            sb.Append("<head>");
                            sb.Append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
                            sb.Append("<meta http-equiv=\"Content-Language\" content=\"TR\" />");
                            sb.Append("<meta http-equiv=\"Charset\" content=\"utf-8\" />");

                            if (Style != null)
                            {
                                sb.Append("<style>" + Style + "</style>");
                            }

                            sb.Append("</head>");
                            sb.Append("<body>");
                            sb.Append(Html);
                            sb.Append("</body>");
                            sb.Append("</html>");

                            return sb.ToString();
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }

                    public static void Bilgiler(out string KullaniciAdi, out string Sifre, out string Host, out int Port)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                var SQL = (from p in Objeler.Listeler.MailAyar
                                           where p.ID == 1
                                           select
                                           new
                                           {
                                               p.KullaniciAdi,
                                               p.Host,
                                               p.Sifre,
                                               p.Port
                                           });

                                if (SQL.Any())
                                {
                                    KullaniciAdi = SQL.Select(x => x.KullaniciAdi).FirstOrDefault();
                                    Sifre = SQL.Select(x => x.Sifre).FirstOrDefault();
                                    Host = SQL.Select(x => x.Host).FirstOrDefault();
                                    Port = int.Parse(SQL.Select(x => x.Port).FirstOrDefault().ToString());
                                }
                                else
                                {
                                    KullaniciAdi = null;
                                    Sifre = null;
                                    Host = null;
                                    Port = 0;
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            KullaniciAdi = null;
                            Sifre = null;
                            Host = null;
                            Port = 0;
                        }
#endif
                    }

                    public static void Gonder(string KullaniciAdi, string Sifre, string Host, int Port, string TO, string CC, string BCC, string GonderenMail, string GonderenIsim, string Konu, string Icerik, bool HTML)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (MailMessage MM = new MailMessage())
                            {
                                MM.To.Add(TO);

                                if (CC != null)
                                {
                                    MM.CC.Add(CC);
                                }

                                if (BCC != null)
                                {
                                    MM.Bcc.Add(BCC);
                                }

                                MM.From = new MailAddress(GonderenMail, GonderenIsim);
                                MM.BodyEncoding = Encoding.GetEncoding("utf-8");
                                MM.Subject = Konu;

                                AlternateView AV;

                                if (HTML)
                                {
                                    MM.IsBodyHtml = true;
                                    AV = AlternateView.CreateAlternateViewFromString(@Icerik, null, "text/html");
                                }
                                else
                                {
                                    MM.IsBodyHtml = false;
                                    AV = AlternateView.CreateAlternateViewFromString(@Icerik, null, "text/plain");
                                }

                                MM.AlternateViews.Add(AV);

                                using (SmtpClient SC = new SmtpClient())
                                {
                                    SC.Host = Host;
                                    SC.Port = Port;
                                    SC.UseDefaultCredentials = false;

                                    NetworkCredential NC = new NetworkCredential();
                                    NC.UserName = KullaniciAdi;
                                    NC.Password = Sifre;

                                    SC.Credentials = NC;
                                    //SC.EnableSsl = true;
                                    SC.Send(MM);
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }
                }

                public static string StringIslemleri(Sabitler.StringIslemleri.StringIslemTipleri Islem, string str)
                {
#if DEBUG
                    try
                    {
#endif
                        string Sonuc = null;

                        if (!string.IsNullOrEmpty(str))
                        {
                            switch (Islem)
                            {
                                case Sabitler.StringIslemleri.StringIslemTipleri.TelFormatla:
                                    if (str.Length == 10)
                                    {
                                        string bir = str.Substring(0, 3);
                                        string iki = str.Substring(3, 3);
                                        string uc = str.Substring(6, 2);
                                        string dort = str.Substring(8, 2);

                                        Sonuc = "(" + bir + ") " + iki + " " + uc + " " + dort;
                                    }
                                    else
                                    {
                                        Sonuc = str;
                                    }
                                    break;

                                case Sabitler.StringIslemleri.StringIslemTipleri.IbanFormatla:
                                    if (str.Length == 24)
                                    {
                                        string bir = str.Substring(0, 4).ToUpper();
                                        string iki = str.Substring(4, 4);
                                        string uc = str.Substring(8, 4);
                                        string dort = str.Substring(12, 4);
                                        string bes = str.Substring(16, 4);
                                        string alti = str.Substring(20, 4);
                                        string yedi = str.Substring(24, 2);

                                        Sonuc = bir + " " + iki + " " + uc + " " + dort + " " + bes + " " + alti + " " + yedi;
                                    }
                                    else
                                    {
                                        Sonuc = str;
                                    }
                                    break;

                                case Sabitler.StringIslemleri.StringIslemTipleri.SQLTemizle:
                                    //Regex R4 = new Regex("['’]", RegexOptions.None);
                                    //Sonuc = R4.Replace(str, "`");
                                    Sonuc = Regex.Replace(str, @"'", "`");
                                    Sonuc = Regex.Replace(str, @"’", "`");
                                    break;

                                case Sabitler.StringIslemleri.StringIslemTipleri.DosyaAdiizle:
                                    //Alfabe Dışındaki Karakterler
                                    Regex R1 = new Regex("(?:[^á-ža-z0-9 ]|(?<=['\"])s)", RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Compiled);
                                    //Boşluklar
                                    Regex R2 = new Regex(@"[ ]{2,}", RegexOptions.None);
                                    //Türkçe Karakterler
                                    Regex R3 = new Regex("(?:[^ĞÜŞİÖÇ])", RegexOptions.None);
                                    Sonuc = R2.Replace(R1.Replace(str.Trim().ToString().ToLower(), String.Empty).Trim(), @" ").Trim();
                                    break;

                                case Sabitler.StringIslemleri.StringIslemTipleri.StringTemizle:
                                    Sonuc = Regex.Replace(str, @"''", "");
                                    Sonuc = Regex.Replace(Sonuc, @"'", "");
                                    Sonuc = Regex.Replace(Sonuc, @"’", "");
                                    Sonuc = Regex.Replace(Sonuc, @"~", "");
                                    Sonuc = Regex.Replace(Sonuc, @"}", "");
                                    Sonuc = Regex.Replace(Sonuc, @"|", "");
                                    Sonuc = Regex.Replace(Sonuc, @"{", "");
                                    Sonuc = Regex.Replace(Sonuc, @"`", "");
                                    Sonuc = Regex.Replace(Sonuc, @"^", "");
                                    Sonuc = Regex.Replace(Sonuc, @"]", "");
                                    Sonuc = Regex.Replace(Sonuc, @"\", "");
                                    Sonuc = Regex.Replace(Sonuc, @"[", "");
                                    Sonuc = Regex.Replace(Sonuc, @"@", "");
                                    Sonuc = Regex.Replace(Sonuc, @"?", "");
                                    Sonuc = Regex.Replace(Sonuc, @">", "");
                                    Sonuc = Regex.Replace(Sonuc, @"=", "");
                                    Sonuc = Regex.Replace(Sonuc, @"<", "");
                                    Sonuc = Regex.Replace(Sonuc, @";", "");
                                    Sonuc = Regex.Replace(Sonuc, @"//", "");
                                    Sonuc = Regex.Replace(Sonuc, @"--", "");
                                    Sonuc = Regex.Replace(Sonuc, @"+", "");
                                    Sonuc = Regex.Replace(Sonuc, @"*", "");
                                    Sonuc = Regex.Replace(Sonuc, @")", "");
                                    Sonuc = Regex.Replace(Sonuc, @"(", "");
                                    Sonuc = Regex.Replace(Sonuc, @"&", "");
                                    Sonuc = Regex.Replace(Sonuc, @"%", "");
                                    Sonuc = Regex.Replace(Sonuc, @"$", "");
                                    Sonuc = Regex.Replace(Sonuc, @"#", "");
                                    Sonuc = Regex.Replace(Sonuc, @"!", "");
                                    Sonuc = Regex.Replace(Sonuc, @"..", "");
                                    Sonuc = Regex.Replace(Sonuc, @" ", "_");

                                    break;

                                case Sabitler.StringIslemleri.StringIslemTipleri.StringTemizleAdres:
                                    Sonuc = Regex.Replace(str, @"''", "");
                                    Sonuc = Regex.Replace(Sonuc, @"'", "");
                                    Sonuc = Regex.Replace(Sonuc, @"’", "");
                                    Sonuc = Regex.Replace(Sonuc, @"~", "");
                                    Sonuc = Regex.Replace(Sonuc, @"}", "");
                                    Sonuc = Regex.Replace(Sonuc, @"|", "");
                                    Sonuc = Regex.Replace(Sonuc, @"{", "");
                                    Sonuc = Regex.Replace(Sonuc, @"`", "");
                                    Sonuc = Regex.Replace(Sonuc, @"^", "");
                                    Sonuc = Regex.Replace(Sonuc, @"]", "");
                                    Sonuc = Regex.Replace(Sonuc, @"\", "");
                                    Sonuc = Regex.Replace(Sonuc, @"[", "");
                                    Sonuc = Regex.Replace(Sonuc, @"@", "");
                                    Sonuc = Regex.Replace(Sonuc, @"?", "");
                                    Sonuc = Regex.Replace(Sonuc, @">", "");
                                    Sonuc = Regex.Replace(Sonuc, @"=", "");
                                    Sonuc = Regex.Replace(Sonuc, @"<", "");
                                    Sonuc = Regex.Replace(Sonuc, @";", "");
                                    Sonuc = Regex.Replace(Sonuc, @"//", "");
                                    Sonuc = Regex.Replace(Sonuc, @"--", "-");
                                    Sonuc = Regex.Replace(Sonuc, @"+", "");
                                    Sonuc = Regex.Replace(Sonuc, @"*", "");
                                    Sonuc = Regex.Replace(Sonuc, @")", "");
                                    Sonuc = Regex.Replace(Sonuc, @"(", "");
                                    Sonuc = Regex.Replace(Sonuc, @"&", "-");
                                    Sonuc = Regex.Replace(Sonuc, @"%", "");
                                    Sonuc = Regex.Replace(Sonuc, @"$", "");
                                    Sonuc = Regex.Replace(Sonuc, @"#", "");
                                    Sonuc = Regex.Replace(Sonuc, @"!", "");
                                    Sonuc = Regex.Replace(Sonuc, @".", "");
                                    Sonuc = Regex.Replace(Sonuc, @",", "");
                                    Sonuc = Regex.Replace(Sonuc, @"_", "");
                                    Sonuc = Regex.Replace(Sonuc, @":", "");

                                    break;

                                case Sabitler.StringIslemleri.StringIslemTipleri.Etiket:
                                    Sonuc = Regex.Replace(str, @" ", "-");
                                    Sonuc = Regex.Replace(Sonuc, @"Ğ", "G");
                                    Sonuc = Regex.Replace(Sonuc, @"Ü", "U");
                                    Sonuc = Regex.Replace(Sonuc, @"Ş", "S");
                                    Sonuc = Regex.Replace(Sonuc, @"İ", "I");
                                    Sonuc = Regex.Replace(Sonuc, @"Ö", "O");
                                    Sonuc = Regex.Replace(Sonuc, @"Ç", "C");
                                    Sonuc = Sonuc.ToLower();
                                    Sonuc = Regex.Replace(Sonuc, @"ğ", "g");
                                    Sonuc = Regex.Replace(Sonuc, @"ü", "u");
                                    Sonuc = Regex.Replace(Sonuc, @"ş", "s");
                                    Sonuc = Regex.Replace(Sonuc, @"ı", "i");
                                    Sonuc = Regex.Replace(Sonuc, @"ö", "o");
                                    Sonuc = Regex.Replace(Sonuc, @"ç", "c");

                                    Sonuc = Sonuc.Replace("(", "-");
                                    Sonuc = Sonuc.Replace(")", "-");
                                    Sonuc = Sonuc.Replace(".", "-");
                                    Sonuc = Sonuc.Replace("--", "-");
                                    Sonuc = Sonuc.Replace("?", "-");

                                    break;

                                case Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter:
                                    Sonuc = Regex.Replace(str, @"Ğ", "G");
                                    Sonuc = Regex.Replace(Sonuc, @"Ü", "U");
                                    Sonuc = Regex.Replace(Sonuc, @"Ş", "S");
                                    Sonuc = Regex.Replace(Sonuc, @"İ", "I");
                                    Sonuc = Regex.Replace(Sonuc, @"Ö", "O");
                                    Sonuc = Regex.Replace(Sonuc, @"Ç", "C");
                                    Sonuc = Regex.Replace(Sonuc, @"ğ", "g");
                                    Sonuc = Regex.Replace(Sonuc, @"ü", "u");
                                    Sonuc = Regex.Replace(Sonuc, @"ş", "s");
                                    Sonuc = Regex.Replace(Sonuc, @"ı", "i");
                                    Sonuc = Regex.Replace(Sonuc, @"ö", "o");
                                    Sonuc = Regex.Replace(Sonuc, @"ç", "c");

                                    break;
                            }

                            return Sonuc.ToString();
                        }
                        else
                        {
                            return Sonuc.ToString();
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                public static string KarakterTemizle(string str, bool UrlEncode)
                {
#if DEBUG
                    try
                    {
#endif
                        if (!string.IsNullOrEmpty(str))
                        {
                            //Alfabe Dışındaki Karakterler
                            Regex R1 = new Regex("(?:[^á-ža-z0-9 ]|(?<=['\"])s)", RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Compiled);

                            //Boşluklar
                            Regex R2 = new Regex(@"[ ]{2,}", RegexOptions.None);

                            //Türkçe Karakterler
                            //Regex R3 = new Regex("(?:[^ĞÜŞİÖÇ])", RegexOptions.None);

                            string sonuc = R2.Replace(R1.Replace(str.Trim().Replace("&amp;", "&").Replace("&", ""), String.Empty).Trim(), @" ").Trim();

                            if (UrlEncode)
                            {
                                return HttpContext.Current.Server.UrlEncode(Genel.StringIslemleri(Sabitler.StringIslemleri.StringIslemTipleri.TurkceKarakter, sonuc.ToLower())).Replace("+", "-");
                            }
                            else
                            {
                                return sonuc;
                            }
                        }
                        else
                        {
                            return str;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return str;
                    }
#endif
                }

                /// <summary>
                /// String harf boyutlandırma
                /// </summary>
                /*
                Create HY 14.11.2012 11:41
                */
                public static string HarfBoyutlandirma(string str, Sabitler.StringIslemleri.HarfClass.Tip Tip, Sabitler.StringIslemleri.HarfClass.Islem Islem, string[] BoyutlanacakHarfler)
                {
                    string ReturnString = str;

#if DEBUG
                    try
                    {
#endif
                        if (Tip == Sabitler.StringIslemleri.HarfClass.Tip.Buyuk)
                        {
                            switch (Islem)
                            {
                                case Sabitler.StringIslemleri.HarfClass.Islem.Hepsi:
                                    ReturnString = str.ToUpper();
                                    break;
                                case Sabitler.StringIslemleri.HarfClass.Islem.IlkHarf:
                                    ReturnString = str.Substring(0, 1).ToUpper();
                                    break;
                                case Sabitler.StringIslemleri.HarfClass.Islem.IlkKelime:
                                    break;
                                case Sabitler.StringIslemleri.HarfClass.Islem.Secilenler:
                                    for (int i = 0; i < BoyutlanacakHarfler.Length; i++)
                                    {
                                        ReturnString = str.Replace(BoyutlanacakHarfler[i], BoyutlanacakHarfler[i].ToUpper());
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }
                        else if (Tip == Sabitler.StringIslemleri.HarfClass.Tip.Kucuk)
                        {
                            switch (Islem)
                            {
                                case Sabitler.StringIslemleri.HarfClass.Islem.Hepsi:
                                    ReturnString = str.ToLower();
                                    break;
                                case Sabitler.StringIslemleri.HarfClass.Islem.IlkHarf:
                                    ReturnString = str.Substring(0, 1).ToLower();
                                    break;
                                case Sabitler.StringIslemleri.HarfClass.Islem.IlkKelime:
                                    break;
                                case Sabitler.StringIslemleri.HarfClass.Islem.Secilenler:
                                    for (int i = 0; i < BoyutlanacakHarfler.Length; i++)
                                    {
                                        ReturnString = str.Replace(BoyutlanacakHarfler[i], BoyutlanacakHarfler[i].ToLower());
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        ReturnString = str;
                    }
#endif

                    return ReturnString;
                }

                public static string Sifrele(string str)
                {
#if DEBUG
                    try
                    {
#endif
                        return FormsAuthentication.HashPasswordForStoringInConfigFile(FormsAuthentication.HashPasswordForStoringInConfigFile(FormsAuthentication.HashPasswordForStoringInConfigFile(str + "- Fatih ÜNAL", "sha1"), "md5"), "md5");
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return str;
                    }
#endif
                }

                public static void MesajKutusu(string d)
                {
                    //System.Windows.Forms.MessageBox.Show(d, "Test Mesajı", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Information);
                    return;
                }

                public static string MevcutSayfa()
                {
#if DEBUG
                    try
                    {
#endif
                        return (HttpContext.Current.Request.Url.AbsoluteUri);
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                public class Cevirmeler
                {
                    public static string BoolToInteger(bool GelenBool)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (GelenBool)
                            {
                                return "1";
                            }
                            else
                            {
                                return "0";
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return null;
                        }
#endif
                    }

                    public static bool StringToBool(string GelenString)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (GelenString == "1")
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }
                }

                public class Kontroller
                {
                    public static bool Uzunluk(string word, int length)
                    {
#if DEBUG
                        try
                        {
#endif
                            if (word.Length > length || string.IsNullOrEmpty(word))
                            {
                                return false;
                            }
                            else
                            {
                                return true;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }

                    public static bool Numerik(string word)
                    {
                        int numeric;

#if DEBUG
                        try
                        {
#endif
                            if (int.TryParse(word, out numeric))
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }

                    public static bool Tarih(string date)
                    {
                        DateTime dateTime;

#if DEBUG
                        try
                        {
#endif
                            if (DateTime.TryParse(date, out dateTime))
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }
                }

                /// <summary>
                /// Gönderilen stringi reverse ederek geri döndürür.
                /// </summary>
                /*
                 * Create FÜ - 12.08.2012 23:44
                 */
                /// <param name="s">String</param>
                /// <returns>
                /// String Döndürür
                /// </returns>
                public static string TersCevir(string s)
                {
#if DEBUG
                    try
                    {
#endif
                        char[] arr = s.ToCharArray();
                        Array.Reverse(arr);
                        return new string(arr);
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return s;
                    }
#endif
                }

                /// <summary>
                /// Gönderilen objenin propertylerindeki value değerini okur.
                /// </summary>
                /*
                 * Create FÜ - 12.08.2012 23:45
                 */
                /// <param name="P">Obje</param>
                /// <param name="Alan">Okunacak Alan</param>
                /// <returns>
                /// String Döndürür
                /// </returns>
                public static string DegerOku(object P, string Alan)
                {
#if DEBUG
                    try
                    {
#endif
                        PropertyInfo PI = P.GetType().GetProperty(Alan, BindingFlags.Public | BindingFlags.Instance);
                        return PI.GetValue(P, null).ToString();
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                public static void DosyaKaydet(Byte[] ByteArrayi, string DosyaAdi)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BinaryWriter BW = new BinaryWriter(File.Open(Class.Fonksiyonlar.Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.StringTemizle, DosyaAdi), FileMode.OpenOrCreate, FileAccess.Write)))
                        {
                            BW.Write(ByteArrayi);
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static List<string> ResimleriListele(string Yol)
                {
                    List<string> L = new List<string>();

#if DEBUG
                    try
                    {
#endif
                        if (Directory.Exists(Yol))
                        {
                            string[] D = null;
                            string[] T = Degiskenler.Site.ResimUzantilari.Split(',');

                            foreach (string F in T)
                            {
                                D = Directory.GetFiles(Yol, F);

                                foreach (string i in D)
                                {
                                    L.Add(i.ToString());
                                }
                            }
                        }

                        return L;
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return L;
                    }
#endif
                }

                public static void Export(object O, string Tip, string DosyaAdi)
                {
#if DEBUG
                    try
                    {
#endif
                        #region XML İçin JSON Yap
                        StringBuilder SB = new StringBuilder();
                        SB.Append("{");
                        SB.Append("\"?xml\":");
                        SB.Append("{");
                        SB.Append("\"@version\": \"1.0\",");
                        SB.Append("\"@standalone\": \"no\"");
                        SB.Append("},");
                        SB.Append("\"records\":");
                        SB.Append("{");
                        SB.Append("\"record\":");
                        #region Gelen Obje
                        SB.Append(O.ToString());
                        #endregion
                        SB.Append("}}");
                        #endregion

                        #region JSON la Gelen Veriyi XML 'e Çevir
                        XmlDocument XD = (XmlDocument)JsonConvert.DeserializeXmlNode(@SB.ToString());
                        XmlNode XN = XD as XmlNode;
                        #endregion

                        #region Tampon Belleği Temizle
                        HttpContext.Current.Response.Clear();
                        #endregion

                        switch (Tip)
                        {
                            #region Döküman Tipi XML ise
                            case "xml":
                                string strXml = XN.OuterXml;
                                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + DosyaAdi + ".xml");
                                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                                HttpContext.Current.Response.AddHeader("Content-Length", strXml.Length.ToString());
                                HttpContext.Current.Response.ContentType = "application/xml";
                                HttpContext.Current.Response.Write(strXml);
                                break;
                            #endregion

                            #region Döküman Tipi XLS ise
                            case "xls":
                                HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + DosyaAdi + ".xls");
                                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                                XslCompiledTransform XCT1 = new XslCompiledTransform();
                                XCT1.Load(HttpContext.Current.Server.MapPath("xsl/excel.xsl"));
                                XCT1.Transform(XN, null, HttpContext.Current.Response.OutputStream);
                                break;
                            #endregion

                            #region Döküman Tipi CSV ise
                            case "csv":
                                HttpContext.Current.Response.ContentType = "application/octet-stream";
                                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + DosyaAdi + ".csv");
                                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                                XslCompiledTransform XCT2 = new XslCompiledTransform();
                                XCT2.Load(HttpContext.Current.Server.MapPath("xsl/csv.xsl"));
                                XCT2.Transform(XN, null, HttpContext.Current.Response.OutputStream);
                                break;
                            #endregion

                            #region Döküman Tipi PDF ise
                            case "pdf":
                                using (XmlNodeReader XNR = new XmlNodeReader(XN))
                                {
                                    using (DataSet DS = new DataSet())
                                    {
                                        DS.ReadXml(XNR);

                                        using (System.Web.UI.WebControls.GridView GridView1 = new System.Web.UI.WebControls.GridView())
                                        {
                                            GridView1.AllowPaging = false;
                                            GridView1.DataSource = DS.Tables[0];
                                            GridView1.DataBind();

                                            HttpContext.Current.Response.ContentType = "application/pdf";
                                            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + DosyaAdi + ".pdf");
                                            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

                                            using (StringWriter SW = new StringWriter())
                                            {
                                                using (HtmlTextWriter hw = new HtmlTextWriter(SW))
                                                {
                                                    GridView1.RenderControl(hw);

                                                    using (StringReader sr = new StringReader(SW.ToString()))
                                                    {
                                                        using (iTextSharp.text.Document D = new iTextSharp.text.Document(iTextSharp.text.PageSize.A4.Rotate(), 10f, 10f, 10f, 0f))
                                                        {
                                                            using (iTextSharp.text.html.simpleparser.HTMLWorker HW = new iTextSharp.text.html.simpleparser.HTMLWorker(D))
                                                            {
                                                                using (PdfWriter.GetInstance(D, HttpContext.Current.Response.OutputStream))
                                                                {
                                                                    D.Open();
                                                                    HW.Parse(sr);
                                                                    D.Close();
                                                                    HttpContext.Current.Response.Write(D);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                break;
                            #endregion

                            #region Döküman Tipi DOC ise
                            case "doc":
                                using (XmlNodeReader XNR = new XmlNodeReader(XN))
                                {
                                    using (DataSet DS = new DataSet())
                                    {
                                        DS.ReadXml(XNR);

                                        using (System.Web.UI.WebControls.GridView GridView1 = new System.Web.UI.WebControls.GridView())
                                        {
                                            GridView1.AllowPaging = false;
                                            GridView1.DataSource = DS.Tables[0];
                                            GridView1.DataBind();

                                            HttpContext.Current.Response.ContentType = "application/vnd.ms-word";
                                            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + DosyaAdi + ".doc");
                                            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

                                            using (StringWriter SW = new StringWriter())
                                            {
                                                using (HtmlTextWriter HW = new HtmlTextWriter(SW))
                                                {
                                                    GridView1.RenderControl(HW);
                                                    HttpContext.Current.Response.Output.Write(SW.ToString());
                                                }
                                            }
                                        }
                                    }
                                }
                                break;
                            #endregion

                            #region Döküman Tipi HTML ise
                            case "html":
                                using (XmlNodeReader XNR = new XmlNodeReader(XN))
                                {
                                    using (DataSet DS = new DataSet())
                                    {
                                        DS.ReadXml(XNR);

                                        using (System.Web.UI.WebControls.GridView GridView1 = new System.Web.UI.WebControls.GridView())
                                        {
                                            GridView1.AllowPaging = false;
                                            GridView1.DataSource = DS.Tables[0];
                                            GridView1.DataBind();

                                            HttpContext.Current.Response.ContentType = "text/html";
                                            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + DosyaAdi + ".html");
                                            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

                                            using (StringWriter SW = new StringWriter())
                                            {
                                                using (HtmlTextWriter HW = new HtmlTextWriter(SW))
                                                {
                                                    GridView1.RenderControl(HW);
                                                    HttpContext.Current.Response.Output.Write(SW.ToString());
                                                }
                                            }
                                        }
                                    }
                                }
                                break;
                            #endregion
                        }

                        #region Tampon Bellekle İşini Bitir
                        HttpContext.Current.Response.End();
                        #endregion
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static Dictionary<string, string> CografiBilgiler(string IP)
                {
                    Dictionary<string, string> D = new Dictionary<string, string>();

#if DEBUG
                    try
                    {
#endif
                        XmlDocument XD = new XmlDocument();
                        XD.Load("http://api.ipinfodb.com/v2/ip_query.php?key=1c9348841d076a0888d0a63590bc5e2486ac1c46b46993ab175fb17a6d598597&ip=" + IP);

                        D = (from c in XD.DocumentElement.ChildNodes.Cast<XmlNode>()
                             select c).ToDictionary(x => x.Name, x => x.InnerText);
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return D;
                }
            }

            public class Dil
            {
                public static bool SessionKontrol()
                {
#if DEBUG
                    try
                    {
#endif
                        int index = -1;

                        index = Objeler.Listeler.Dil.FindIndex(delegate(Objeler.Tanimlar.Dil p)
                        {
                            return (p.SessionID == HttpContext.Current.Session.SessionID);
                        });

                        if (index != -1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return false;
                    }
#endif
                }

                public static int ID()
                {
#if DEBUG
                    try
                    {
#endif
                        int index = -1;

                        index = Objeler.Listeler.Dil.FindIndex(delegate(Objeler.Tanimlar.Dil p)
                        {
                            return (p.SessionID == HttpContext.Current.Session.SessionID);
                        });

                        if (index != -1)
                        {
                            return Objeler.Listeler.Dil[index].DilID;
                        }
                        else
                        {
                            return 999;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return 999;
                    }
#endif
                }
            }

            public class JavaScript
            {
                public static void Ekle(string str)
                {
#if DEBUG
                    try
                    {
#endif
                        string JS = str.Replace("</", @"<\/");

                        Page p = HttpContext.Current.CurrentHandler as Page;

                        if (p != null && !p.ClientScript.IsClientScriptBlockRegistered(JS))
                        {
                            p.ClientScript.RegisterStartupScript(p.GetType(), Guid.NewGuid().ToString(), "\r\n" + JS + "\r\n", true);
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static void Yonlendir(string Url)
                {
#if DEBUG
                    try
                    {
#endif
                        StringBuilder sb = new StringBuilder();
                        sb.Append("<script type=\"text/javascript\">\n");
                        sb.Append("//<![CDATA[\n");
                        sb.Append("location.href=\"" + Url + "\"\n");
                        sb.Append("//]]>\n");
                        sb.Append("</script>\n");
                        HttpContext.Current.Response.Write(sb.ToString());
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static void MesajKutusuVeYonlendir(string Mesaj, string Url)
                {
#if DEBUG
                    try
                    {
#endif
                        StringBuilder sb = new StringBuilder();
                        sb.Append("<script type=\"text/javascript\">\n");
                        sb.Append("//<![CDATA[\n");
                        sb.Append("alert(\"" + Mesaj.Replace("[ln]", @"\n") + "\");\n");
                        sb.Append("location.href=\"" + Url + "\"\n");
                        sb.Append("//]]>\n");
                        sb.Append("</script>\n");
                        HttpContext.Current.Response.Write(sb.ToString());
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                protected static Hashtable handlerPages = new Hashtable();
                public static void MesajKutusu(string Message)
                {
#if DEBUG
                    try
                    {
#endif
                        if (!(handlerPages.Contains(HttpContext.Current.Handler)))
                        {
                            Page currentPage = (Page)HttpContext.Current.Handler;
                            if (!((currentPage == null)))
                            {
                                Queue messageQueue = new Queue();
                                messageQueue.Enqueue(Message);
                                handlerPages.Add(HttpContext.Current.Handler, messageQueue);
                                currentPage.Unload += new EventHandler(CurrentPageUnload);
                            }
                        }
                        else
                        {
                            Queue queue = ((Queue)(handlerPages[HttpContext.Current.Handler]));
                            queue.Enqueue(Message);
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                private static void CurrentPageUnload(object sender, EventArgs e)
                {
#if DEBUG
                    try
                    {
#endif
                        Queue queue = ((Queue)(handlerPages[HttpContext.Current.Handler]));
                        if (queue != null)
                        {
                            StringBuilder builder = new StringBuilder();
                            int iMsgCount = queue.Count;
                            builder.Append("<script language='javascript'>");
                            string sMsg;
                            while ((iMsgCount > 0))
                            {
                                iMsgCount = iMsgCount - 1;
                                sMsg = System.Convert.ToString(queue.Dequeue());
                                sMsg = sMsg.Replace("\"", "'");
                                builder.Append("alert( \"" + sMsg + "\" );");
                            }
                            builder.Append("</script>");
                            handlerPages.Remove(HttpContext.Current.Handler);
                            HttpContext.Current.Response.Write(builder.ToString());
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }
            }

            public class ExtJS
            {
                public static void MesajKutusu(Ext.Net.Icon UstIkon, Ext.Net.MessageBox.Icon Ikon, string Baslik, string Mesaj)
                {
#if DEBUG
                    try
                    {
#endif
                        Ext.Net.X.MessageBox.Show(new Ext.Net.MessageBoxConfig { Title = Baslik, Message = Mesaj, Buttons = Ext.Net.MessageBox.Button.OK, HeaderIcon = UstIkon, Icon = Ikon, Closable = false });
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static void YukleyerekYonlendir(string url, string yazi)
                {
#if DEBUG
                    try
                    {
#endif
                        Ext.Net.X.MessageBox.Show(new Ext.Net.MessageBoxConfig { Progress = true, Title = "" + yazi + "", Wait = true, WaitConfig = new Ext.Net.WaitConfig { Interval = 250, Duration = 5000 }, HeaderIcon = Ext.Net.Icon.Cup, MinWidth = 500, Closable = false });
                        Ext.Net.ResourceManager.AddInstanceScript("setTimeout(function(){Ext.MessageBox.hide();window.location=\"" + url + "\";},2550);");
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }
            }

            public class Uygulama
            {
                public static bool UrunVarmi(int UrunID)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_urunler where a.id == UrunID && a.onay == true select a.id);

                            if (SQL.Any())
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return false;
                    }
#endif
                }

                public static string KodScriptYaz(int DilID, string URL)
                {
#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from p in db.tbl_scriptler
                                       from k in db.tbl_menuler
                                       where k.id == p.menu_id && k.dil_id == DilID && k.url == URL && p.onay == true
                                       select p.script);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault();
                            }
                            else
                            {
                                return null;
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                public static string KodYaz(string kod)
                {
#if DEBUG
                    try
                    {
#endif
                        if (kod != null)
                        {
                            StringBuilder SB = new StringBuilder();
                            SB.Append("<div class=\"h3\">\r\n");
                            SB.Append("<h3>" + kod + "</h3>\r\n");
                            SB.Append("</div>\r\n");
                            return SB.ToString();
                        }
                        else
                        {
                            return null;
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                /// <summary>
                /// Site yazıları
                /// </summary>
                /*
                 * Edit HY 22.08.12 14:19 Objeye atanan textler çekiliyor
                 * Create FÜ 00.00.00 00:00
                */
                public static string SabitlerText(int SabitID)
                {
#if DEBUG
                    try
                    {
#endif
                        {
                            var SQL = (from p in Objeler.Listeler.Textler
                                       where p.SabitID == SabitID
                                       select p.Text);

                            if (SQL.Any())
                            {
                                return SQL.FirstOrDefault().ToString();
                            }
                            else
                            {
                                return "Language Error";
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        return null;
                    }
#endif
                }

                public static void ZiyaretEkle(int? ZiyaretTipi, int? ID)
                {
                    #region Ziyaret Ekle
#if DEBUG
                    try
                    {
#endif
                        if (ZiyaretTipi != null && ID != null)
                        {
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_ziyaretler tz = new tbl_ziyaretler();

                                switch (ZiyaretTipi)
                                {
                                    case (int)Sabitler.Ziyaret.URUN:
                                        tz.tip = (int)Sabitler.Ziyaret.URUN;
                                        tz.urun_id = ID;
                                        break;

                                    case (int)Sabitler.Ziyaret.ETIKET:
                                        tz.tip = (int)Sabitler.Ziyaret.ETIKET;
                                        tz.etiket_id = ID;
                                        break;

                                    case (int)Sabitler.Ziyaret.KATEGORI:
                                        tz.tip = (int)Sabitler.Ziyaret.KATEGORI;
                                        tz.kategori_id = ID;
                                        break;

                                    case (int)Sabitler.Ziyaret.MARKA:
                                        tz.tip = (int)Sabitler.Ziyaret.MARKA;
                                        tz.marka_id = ID;
                                        break;
                                }

                                db.AddTotbl_ziyaretler(tz);
                                db.SaveChanges();
                                //Class.Fonksiyonlar.Admin.Log.AllHttp("tbl_ziyaret", tz.id);
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                    #endregion
                }

                public static void AramalaraEkle(int DilID, string Kelime)
                {
#if DEBUG
                    try
                    {
#endif
                        if (!string.IsNullOrEmpty(Kelime))
                        {
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_aramalar ta = new tbl_aramalar();
                                ta.dil_id = DilID;
                                ta.kelime = Kelime;
                                db.AddTotbl_aramalar(ta);
                                db.SaveChanges();
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif
                }

                public static Dictionary<int, string> UstKategori(int DilID, int KategoriID)
                {
                    Dictionary<int, string> D = new Dictionary<int, string>();

#if DEBUG
                    try
                    {
#endif
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            int UstKategori;

                            var SQL = (from p in db.tbl_kategoriler
                                       where p.id == KategoriID && p.dil_id == DilID
                                       select new
                                       {
                                           KatID = (p.kategori_id != 0 ? p.kategori_id : p.id)
                                       }).FirstOrDefault();

                            if (SQL != null)
                            {
                                UstKategori = SQL.KatID;

                                D = (from p in db.tbl_kategoriler
                                     where p.id == UstKategori && p.dil_id == DilID
                                     select new
                                     {
                                         p.id,
                                         p.ad
                                     }).AsEnumerable().Skip(0).Take(1).ToDictionary(t => t.id, t => t.ad);
                            }
                        }
#if DEBUG
                    }
                    catch (Exception ex)
                    {
                        Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                    }
#endif

                    return D;
                }

                public class Urunler
                {
                    public static Dictionary<int, string> Markalar(int UrunID)
                    {
                        Dictionary<int, string> D = new Dictionary<int, string>();

#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                D = (from p in db.tbl_urunler_markalar
                                     from k in db.tbl_markalar
                                     where p.urun_id == UrunID && k.id == p.marka_id && k.onay == true
                                     select new
                                     {
                                         k.id,
                                         k.ad
                                     }).ToDictionary(t => t.id, t => t.ad);
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif

                        return D;
                    }

                    public static Dictionary<int, string> Resimler(int UrunID)
                    {
                        Dictionary<int, string> D = new Dictionary<int, string>();

#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                int DilID = Dil.ID();
                                int? ResimKategoriID = (from p in db.tbl_urunler
                                                        where p.id == UrunID && p.dil_id == DilID
                                                        select p.resim_kategori_id).FirstOrDefault();

                                if (ResimKategoriID != null)
                                {
                                    D = (from p in db.tbl_dosyalar_kategoriler
                                         from k in db.tbl_dosyalar
                                         where p.kategori_id == ResimKategoriID && k.id == p.dosya_id && k.onay == true && k.tip == (int)Sabitler.Dosya.Resim
                                         select new
                                         {
                                             k.id,
                                             k.ad
                                         }).ToDictionary(t => t.id, t => t.ad);
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif

                        return D;
                    }

                    public static Dictionary<int, string> Videolar(int UrunID)
                    {
                        Dictionary<int, string> D = new Dictionary<int, string>();

#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                int DilID = Dil.ID();
                                int? VideoKategoriID = (from p in db.tbl_urunler
                                                        where p.id == UrunID && p.dil_id == DilID
                                                        select p.video_kategori_id).FirstOrDefault();

                                if (VideoKategoriID != null)
                                {
                                    D = (from p in db.tbl_dosyalar_kategoriler
                                         from k in db.tbl_dosyalar
                                         where p.kategori_id == VideoKategoriID && k.id == p.dosya_id && k.onay == true && k.tip == (int)Sabitler.Dosya.Video
                                         select new
                                         {
                                             k.id,
                                             k.url
                                         }).ToDictionary(t => t.id, t => t.url);
                                }
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif

                        return D;
                    }
                }

                public class Bloklar
                {
                    public static void Blok(string BlokAdi, PlaceHolder Blok)
                    {
                        using (BaglantiCumlesi db = new BaglantiCumlesi())
                        {
                            var SQL = (from a in db.tbl_bloklar
                                       where a.sutun == BlokAdi && a.onay == true
                                       orderby a.sira ascending
                                       select new
                                       {
                                           a.baslik,
                                           a.sutun,
                                           a.tur,
                                           a.detay,
                                           a.baslik_goster
                                       });

                            if (SQL.Any())
                            {
                                foreach (var i in SQL)
                                {
                                    Blok.Controls.Add(new LiteralControl("<div class=\"bloklar\">\r\n<div class=\"ust\">\r\n"));
                                    if (i.baslik_goster == true)
                                    {
                                        Blok.Controls.Add(new LiteralControl("<div class=\"baslik\">" + i.baslik + "</div>\r\n"));
                                    }

                                    Blok.Controls.Add(new LiteralControl("</div>\r\n<div class=\"orta\">\r\n"));

                                    switch (i.tur)
                                    {
                                        case "ascx":
                                            if (!System.IO.File.Exists("~/ascx/blok/" + i.detay))
                                            {
                                                Page Pg = new Page();
                                                UserControl Uc = (UserControl)Pg.LoadControl("~/ascx/blok/" + i.detay + "");
                                                Blok.Controls.Add(Uc);
                                            }
                                            break;

                                        case "html":
                                            Blok.Controls.Add(new LiteralControl(i.detay));
                                            break;
                                    }

                                    Blok.Controls.Add(new LiteralControl("</div>\r\n<div class=\"alt\"></div>\r\n</div>\r\n<div class=\"h10\"></div>\r\n"));
                                }
                            }
                        }
                    }

                    public class Icerik
                    {
                        public static void Etiketler(List<string> Etiketler)
                        {
#if DEBUG
                            try
                            {
#endif
                                #region Literal Al
                                UserControl UC = (UserControl)((Page)HttpContext.Current.Handler).FindControl("sagblok");
                                System.Web.UI.WebControls.Literal Li = UC.FindControl("lit_etiketler") as System.Web.UI.WebControls.Literal;
                                #endregion

                                if (Etiketler.Any())
                                {
                                    #region String Builder
                                    StringBuilder SB = new StringBuilder();

                                    foreach (var i in Etiketler)
                                    {
                                        SB.Append("<a href=\"");
                                        SB.Append("/tag/" + i.ToString());
                                        SB.Append("\">");
                                        SB.Append(i.ToString());
                                        SB.Append("</a> ");
                                    }

                                    Li.Text = SB.ToString();
                                    #endregion
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif
                        }

                        public static void Markalar(List<string> Markalar)
                        {
#if DEBUG
                            try
                            {
#endif
                                #region Literal Al
                                UserControl UC = (UserControl)((Page)HttpContext.Current.Handler).FindControl("marka");
                                System.Web.UI.WebControls.PlaceHolder PH = UC.FindControl("phmarka") as System.Web.UI.WebControls.PlaceHolder;
                                System.Web.UI.WebControls.Literal Li = UC.FindControl("litmarka") as System.Web.UI.WebControls.Literal;
                                #endregion

                                if (Markalar.Count > 0)
                                {
                                    #region Marka Li Tanımlama
                                    string MarkaMenu = "<li><a href=\"/brand/{0}" + "\"><img src=\"/images/arrow.png\" alt=\"\"/>{1}</a></li>" + Degiskenler.Diger.vbCrLf;
                                    #endregion

                                    #region String Builder
                                    StringBuilder SB1 = new StringBuilder();
                                    StringBuilder SB2 = new StringBuilder();

                                    foreach (var i in Markalar)
                                    {
                                        SB1.AppendFormat(MarkaMenu, Genel.StringIslemleri(Class.Sabitler.StringIslemleri.StringIslemTipleri.Etiket, i.ToString().ToLower()), i.ToString().ToUpper());
                                    }

                                    SB2.Append("<ul class=\"mmenu\">" + Degiskenler.Diger.vbCrLf);
                                    SB2.Append(SB1.ToString());
                                    SB2.Append("</ul>");

                                    Li.Text = SB2.ToString();
                                    #endregion
                                }
                                else
                                {
                                    PH.Visible = false;
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif
                        }

                        public static void Kategoriler(Dictionary<int, string> Kategoriler)
                        {
#if DEBUG
                            try
                            {
#endif
                                Dictionary<int, int> IcMenuSayilari = new Dictionary<int, int>();

                                foreach (var i in Kategoriler)
                                {
                                    using (BaglantiCumlesi db = new BaglantiCumlesi())
                                    {
                                        int Kaunt = (from k in db.tbl_kategoriler
                                                     where k.kategori_id == i.Key
                                                     select k.id).Count();

                                        IcMenuSayilari.Add(i.Key, Kaunt);
                                    }
                                }

                                UserControl UC = (UserControl)((Page)HttpContext.Current.Handler).FindControl("solblok");
                                System.Web.UI.WebControls.Literal Li = UC.FindControl("kategorimenu") as System.Web.UI.WebControls.Literal;

                                if (Kategoriler.Count > 0)
                                {
                                    string KategoriMenu1 = "<li><a href=\"{0}" + "\">{1}</a></li>" + Class.Degiskenler.Diger.vbCrLf;
                                    string KategoriMenu2 = "<li class=\"alt\"><a href=\"{0}" + "\">{1}</a></li>" + Class.Degiskenler.Diger.vbCrLf;

                                    StringBuilder SB1 = new StringBuilder();
                                    StringBuilder SB2 = new StringBuilder();

                                    foreach (var i in Kategoriler)
                                    {
                                        int IcMenuSayisi = (from p in IcMenuSayilari
                                                            where p.Key == i.Key
                                                            select p.Value).FirstOrDefault();

                                        if (IcMenuSayisi > 0)
                                        {
                                            SB1.AppendFormat(KategoriMenu2, SHOPClass.Fonksiyonlar.Genel.SeoLink("category", i.Value, i.Key.ToString()), i.Value);
                                        }
                                        else
                                        {
                                            SB1.AppendFormat(KategoriMenu1, SHOPClass.Fonksiyonlar.Genel.SeoLink("category", i.Value, i.Key.ToString()), i.Value);
                                        }
                                    }

                                    SB2.Append("<ul id=\"kategorimenusol\">" + Class.Degiskenler.Diger.vbCrLf);
                                    SB2.Append(SB1.ToString());
                                    SB2.Append("</ul>");

                                    Li.Text = SB2.ToString();
                                }
                                else
                                {
                                    Li.Visible = false;
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif
                        }
                    }

                    public class Urunler
                    {
                        public static List<string> Etiketler(int DilID)
                        {
                            List<string> L = new List<string>();

#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    L = (from p in db.tbl_etiketler
                                         where p.dil_id == DilID && p.anasayfa == true && p.onay == true
                                         select p.ad).Distinct().ToList();
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return L;
                        }

                        public static List<string> Markalar()
                        {
                            List<string> L = new List<string>();

#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    L = (from p in db.tbl_markalar
                                         where p.onay == true
                                         select p.ad).ToList();
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return L;
                        }

                        public static Dictionary<int, string> Kategoriler(int DilID, int KategoriID)
                        {
                            Dictionary<int, string> DKategoriler = new Dictionary<int, string>();
                            Dictionary<int, string> DUstKategori;
                            Dictionary<int, string> DBirlesmisKategoriler = new Dictionary<int, string>();

#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    DKategoriler = (from p in db.tbl_kategoriler
                                                    where p.dil_id == DilID && p.kategori_id == KategoriID && p.onay == true
                                                    orderby p.sira ascending
                                                    select new
                                                    {
                                                        p.id,
                                                        p.ad
                                                    }).ToDictionary(t => t.id, t => t.ad);

                                    if (KategoriID > 0)
                                    {
                                        DUstKategori = new Dictionary<int, string>() { { 0, Uygulama.SabitlerText(39) } };

                                        if (Uygulama.UstKategori(DilID, KategoriID).Select(t => t.Key).FirstOrDefault() != 0)
                                        {
                                            DUstKategori.Add(Uygulama.UstKategori(DilID, KategoriID).Select(t => t.Key).FirstOrDefault(), Uygulama.UstKategori(DilID, KategoriID).Select(t => t.Value).FirstOrDefault());
                                        }

                                        DBirlesmisKategoriler = new Dictionary<int, string>(DUstKategori);

                                        foreach (var i in DKategoriler)
                                        {
                                            DBirlesmisKategoriler.Add(i.Key, i.Value);
                                        }
                                    }
                                    else
                                    {
                                        DBirlesmisKategoriler = new Dictionary<int, string>(DKategoriler);
                                    }
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return DBirlesmisKategoriler;
                        }
                    }

                    public class Urun
                    {
                        public static Objeler.Tanimlar.Urun Bilgiler(int UrunID)
                        {
                            Objeler.Tanimlar.Urun U = new Objeler.Tanimlar.Urun();

                            #region Tanımlar
                            int MarkaIDKount;
                            int MarkaID;

                            int KategoriIDKount;
                            int KategoriID;
                            #endregion

#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    #region SQL
                                    var SQL = (from p in db.tbl_urunler
                                               where p.id == UrunID
                                               let kod = db.tbl_kodlar.Where(k => k.id == p.kod_id).Select(x => x.kod).Distinct().FirstOrDefault()
                                               select new
                                               {
                                                   kod,
                                                   p.ad,
                                                   p.on_aciklama
                                               }).FirstOrDefault();
                                    #endregion

                                    #region Marka ID
                                    MarkaIDKount = (from p in db.tbl_urunler_markalar
                                                    where p.urun_id == UrunID
                                                    select p.marka_id).Count();

                                    if (MarkaIDKount > 1)
                                    {
                                        #region Ana Markayı Al
                                        MarkaID = (from p in db.tbl_urunler_markalar
                                                   where p.ana == true && p.urun_id == UrunID
                                                   select p.marka_id).FirstOrDefault();
                                        #endregion

                                        #region Ana Marka Verilmemişse Bir MArka Al
                                        if (MarkaID == 0)
                                        {
                                            MarkaID = (from p in db.tbl_urunler_markalar
                                                       where p.urun_id == UrunID
                                                       select p.marka_id).FirstOrDefault();
                                        }
                                        #endregion
                                    }
                                    else
                                    {
                                        MarkaID = (from p in db.tbl_urunler_markalar
                                                   where p.urun_id == UrunID
                                                   select p.marka_id).FirstOrDefault();
                                    }
                                    #endregion

                                    #region Kategori ID
                                    KategoriIDKount = (from p in db.tbl_urunler_kategoriler
                                                       where p.urun_id == UrunID
                                                       select p.kategori_id).Count();

                                    if (KategoriIDKount > 1)
                                    {
                                        #region Ana Kategoriyi Al
                                        KategoriID = (from p in db.tbl_urunler_kategoriler
                                                      where p.ana == true && p.urun_id == UrunID
                                                      select p.kategori_id).FirstOrDefault();
                                        #endregion

                                        #region Ana Kategori Verilmemişse Bir Kategori Al
                                        if (KategoriID == 0)
                                        {
                                            KategoriID = (from p in db.tbl_urunler_kategoriler
                                                          where p.urun_id == UrunID
                                                          select p.kategori_id).FirstOrDefault();
                                        }
                                        #endregion
                                    }
                                    else
                                    {
                                        KategoriID = (from p in db.tbl_urunler_kategoriler
                                                      where p.urun_id == UrunID
                                                      select p.kategori_id).FirstOrDefault();
                                    }
                                    #endregion

                                    #region Objeye Çevir
                                    U.ad = SQL.ad;
                                    U.kategori_id = KategoriID;
                                    U.kod = SQL.kod;
                                    U.marka_id = MarkaID;
                                    U.on_aciklama = SQL.on_aciklama;
                                    #endregion
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return U;
                        }

                        public static List<string> Etiketler(int UrunID)
                        {
                            List<string> L = new List<string>();

#if DEBUG
                            try
                            {
#endif
                                int DilID = Dil.ID();

                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    L = (from p in db.tbl_urunler_etiketler
                                         from k in db.tbl_etiketler
                                         where p.urun_id == UrunID && k.id == p.etiket_id && k.onay == true && k.dil_id == DilID
                                         select k.ad).Distinct().ToList();
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return L;
                        }

                        public static List<string> Markalar(int UrunID)
                        {
                            List<string> L = new List<string>();

#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    L = (from p in db.tbl_urunler_markalar
                                         from k in db.tbl_markalar
                                         where p.urun_id == UrunID && k.id == p.marka_id && k.onay == true
                                         select k.ad).ToList();
                                    if (L.Count == 0)
                                    {
                                        L.Add(Uygulama.SabitlerText(40));
                                    }
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return L;
                        }

                        public static Dictionary<int, string> Resimler(int UrunID)
                        {
                            Dictionary<int, string> D = new Dictionary<int, string>();

#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    int DilID = Dil.ID();
                                    int? ResimKategoriID = (from p in db.tbl_urunler
                                                            where p.id == UrunID && p.dil_id == DilID
                                                            select p.resim_kategori_id).FirstOrDefault();

                                    if (ResimKategoriID != null)
                                    {
                                        D = (from p in db.tbl_dosyalar_kategoriler
                                             from k in db.tbl_dosyalar
                                             where p.kategori_id == ResimKategoriID && k.id == p.dosya_id && k.onay == true && k.tip == (int)Sabitler.Dosya.Resim
                                             select new
                                             {
                                                 k.id,
                                                 k.ad
                                             }).ToDictionary(t => t.id, t => t.ad);
                                    }
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return D;
                        }

                        public static Dictionary<int, string> Videolar(int UrunID)
                        {
                            Dictionary<int, string> D = new Dictionary<int, string>();

#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    int DilID = Dil.ID();
                                    int? VideoKategoriID = (from p in db.tbl_urunler
                                                            where p.id == UrunID && p.dil_id == DilID
                                                            select p.video_kategori_id).FirstOrDefault();

                                    if (VideoKategoriID != null)
                                    {
                                        D = (from p in db.tbl_dosyalar_kategoriler
                                             from k in db.tbl_dosyalar
                                             where p.kategori_id == VideoKategoriID && k.id == p.dosya_id && k.onay == true && k.tip == (int)Sabitler.Dosya.Video
                                             select new
                                             {
                                                 k.id,
                                                 k.url
                                             }).ToDictionary(t => t.id, t => t.url);
                                    }
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            }
#endif

                            return D;
                        }
                    }
                }
            }

            public class Admin
            {
                public class Genel
                {
                    public static string SifreOlustur(string str)
                    {
#if DEBUG
                        try
                        {
#endif
                            return FormsAuthentication.HashPasswordForStoringInConfigFile(FormsAuthentication.HashPasswordForStoringInConfigFile(FormsAuthentication.HashPasswordForStoringInConfigFile(str + "- Fatih ÜNAL", "sha1"), "md5"), "md5");
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return str;
                        }
#endif
                    }

                    /*
                     * Edit FU 06.09.2012 01:10 - LocalMode olayı eklendi.
                     */
                    public static bool SessionKontrol()
                    {
#if DEBUG
                        try
                        {
#endif
                            if (!Class.Fonksiyonlar.Firma.Ayar().Select(p => p.mode).FirstOrDefault())
                            {
                                int index = -1;

                                index = Objeler.Listeler.Admin.FindIndex(delegate(Objeler.Tanimlar.Admin p)
                                {
                                    return (p.SessionID == HttpContext.Current.Session.SessionID);
                                });

                                if (index != -1)
                                {
                                    return true;
                                }
                                else
                                {
                                    return false;
                                }
                            }
                            else
                            {
                                return true;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return false;
                        }
#endif
                    }

                    public static int AdminID()
                    {
#if DEBUG
                        try
                        {
#endif
                            int index = -1;

                            index = Objeler.Listeler.Admin.FindIndex(delegate(Objeler.Tanimlar.Admin p)
                            {
                                return (p.SessionID == HttpContext.Current.Session.SessionID);
                            });

                            if (index != -1)
                            {
                                return Objeler.Listeler.Admin[index].ID;
                            }
                            else
                            {
                                return -1;
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                            return -1;
                        }
#endif
                    }
                }

                public class Log
                {
                    public static void Oturum(int AdminID, int Islem, int KullaniciTip)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_giris_cikislar tal = new tbl_giris_cikislar();

                                #region Kullanıcı Tipi Kullanıcı İse
                                if (KullaniciTip == (int)Sabitler.KullaniciTip.Kullanici)
                                {
                                    tal.tip = true;
                                }
                                #endregion

                                tal.admin_id = AdminID;
                                tal.islem = Islem;

                                db.AddTotbl_giris_cikislar(tal);
                                db.SaveChanges();

                                #region ALL HTTP Al
#if DEBUG
                                try
                                {
#endif
                                    AllHttp(((EntityObject)(tal)).EntityKey.EntitySetName.ToString(), tal.id);
#if DEBUG
                                }
                                catch (Exception ex)
                                {
                                    Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                }
#endif
                                #endregion
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    public static void Hatalar(int? AdminID, string KullaniciAdi, int Islem, int KullaniciTip)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_giris_cikislar_hatalar tah = new tbl_giris_cikislar_hatalar();

                                #region Kullanıcı Tipi Kullanıcı İse
                                if (KullaniciTip == (int)Sabitler.KullaniciTip.Kullanici)
                                {
                                    tah.tip = true;
                                }
                                #endregion

                                tah.admin_id = AdminID;
                                tah.kullanici_adi = KullaniciAdi;
                                tah.islem = Islem;
                                db.AddTotbl_giris_cikislar_hatalar(tah);
                                db.SaveChanges();

                                #region ALL HTTP Al
#if DEBUG
                                try
                                {
#endif
                                    AllHttp(((EntityObject)(tah)).EntityKey.EntitySetName.ToString(), tah.id);
#if DEBUG
                                }
                                catch (Exception ex)
                                {
                                    Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                }
#endif
                                #endregion
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    public static void Islemler(int AdminID, string TabloAdi, int KayitID, int Islem)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_islemler tai = new tbl_islemler();
                                tai.admin_id = AdminID;
                                tai.tablo = TabloAdi;
                                tai.kayit_id = KayitID;
                                tai.islem = Islem;
                                db.AddTotbl_islemler(tai);
                                db.SaveChanges();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }

                    public static void AllHttp(string TabloAdi, int KayitID)
                    {
#if DEBUG
                        try
                        {
#endif
                            using (BaglantiCumlesi db = new BaglantiCumlesi())
                            {
                                tbl_all_http ta = new tbl_all_http();

                                #region Tablo Adı ve Kayıt ID
                                ta.tablo = TabloAdi;
                                ta.kayit_id = KayitID;
                                #endregion
                                #region Request Server Variables
                                ta.ALL_HTTP = HttpContext.Current.Request.ServerVariables["ALL_HTTP"];
                                ta.ALL_RAW = HttpContext.Current.Request.ServerVariables["ALL_RAW"];
                                ta.APPL_MD_PATH = HttpContext.Current.Request.ServerVariables["APPL_MD_PATH"];
                                ta.APPL_PHYSICAL_PATH = HttpContext.Current.Request.ServerVariables["APPL_PHYSICAL_PATH"];
                                ta.AUTH_TYPE = HttpContext.Current.Request.ServerVariables["AUTH_TYPE"];
                                ta.AUTH_USER = HttpContext.Current.Request.ServerVariables["AUTH_USER"];
                                ta.AUTH_PASSWORD = HttpContext.Current.Request.ServerVariables["AUTH_PASSWORD"];
                                ta.LOGON_USER = HttpContext.Current.Request.ServerVariables["LOGON_USER"];
                                ta.REMOTE_USER = HttpContext.Current.Request.ServerVariables["REMOTE_USER"];
                                ta.CERT_COOKIE = HttpContext.Current.Request.ServerVariables["CERT_COOKIE"];
                                ta.CERT_FLAGS = HttpContext.Current.Request.ServerVariables["CERT_FLAGS"];
                                ta.CERT_ISSUER = HttpContext.Current.Request.ServerVariables["CERT_ISSUER"];
                                ta.CERT_KEYSIZE = HttpContext.Current.Request.ServerVariables["CERT_KEYSIZE"];
                                ta.CERT_SECRETKEYSIZE = HttpContext.Current.Request.ServerVariables["CERT_SECRETKEYSIZE"];
                                ta.CERT_SERIALNUMBER = HttpContext.Current.Request.ServerVariables["CERT_SERIALNUMBER"];
                                ta.CERT_SERVER_ISSUER = HttpContext.Current.Request.ServerVariables["CERT_SERVER_ISSUER"];
                                ta.CERT_SERVER_SUBJECT = HttpContext.Current.Request.ServerVariables["CERT_SERVER_SUBJECT"];
                                ta.CERT_SUBJECT = HttpContext.Current.Request.ServerVariables["CERT_SUBJECT"];
                                ta.CONTENT_LENGTH = HttpContext.Current.Request.ServerVariables["CONTENT_LENGTH"];
                                ta.CONTENT_TYPE = HttpContext.Current.Request.ServerVariables["CONTENT_TYPE"];
                                ta.GATEWAY_INTERFACE = HttpContext.Current.Request.ServerVariables["GATEWAY_INTERFACE"];
                                ta.HTTPS = HttpContext.Current.Request.ServerVariables["HTTPS"];
                                ta.HTTPS_KEYSIZE = HttpContext.Current.Request.ServerVariables["HTTPS_KEYSIZE"];
                                ta.HTTPS_SECRETKEYSIZE = HttpContext.Current.Request.ServerVariables["HTTPS_SECRETKEYSIZE"];
                                ta.HTTPS_SERVER_ISSUER = HttpContext.Current.Request.ServerVariables["HTTPS_SERVER_ISSUER"];
                                ta.HTTPS_SERVER_SUBJECT = HttpContext.Current.Request.ServerVariables["HTTPS_SERVER_SUBJECT"];
                                ta.INSTANCE_ID = HttpContext.Current.Request.ServerVariables["INSTANCE_ID"];
                                ta.INSTANCE_META_PATH = HttpContext.Current.Request.ServerVariables["INSTANCE_META_PATH"];
                                ta.LOCAL_ADDR = HttpContext.Current.Request.ServerVariables["LOCAL_ADDR"];
                                ta.PATH_INFO = HttpContext.Current.Request.ServerVariables["PATH_INFO"];
                                ta.PATH_TRANSLATED = HttpContext.Current.Request.ServerVariables["PATH_TRANSLATED"];
                                ta.QUERY_STRING = HttpContext.Current.Request.ServerVariables["QUERY_STRING"];
                                ta.REMOTE_ADDR = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                                ta.REMOTE_HOST = HttpContext.Current.Request.ServerVariables["REMOTE_HOST"];
                                ta.REMOTE_PORT = HttpContext.Current.Request.ServerVariables["REMOTE_PORT"];
                                ta.REQUEST_METHOD = HttpContext.Current.Request.ServerVariables["REQUEST_METHOD"];
                                ta.SCRIPT_NAME = HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"];
                                ta.SERVER_NAME = HttpContext.Current.Request.ServerVariables["SERVER_NAME"];
                                ta.SERVER_PORT = HttpContext.Current.Request.ServerVariables["SERVER_PORT"];
                                ta.SERVER_PORT_SECURE = HttpContext.Current.Request.ServerVariables["SERVER_PORT_SECURE"];
                                ta.SERVER_PROTOCOL = HttpContext.Current.Request.ServerVariables["SERVER_PROTOCOL"];
                                ta.SERVER_SOFTWARE = HttpContext.Current.Request.ServerVariables["SERVER_SOFTWARE"];
                                ta.URL = HttpContext.Current.Request.ServerVariables["URL"];
                                ta.HTTP_CONNECTION = HttpContext.Current.Request.ServerVariables["HTTP_CONNECTION"];
                                ta.HTTP_ACCEPT = HttpContext.Current.Request.ServerVariables["HTTP_ACCEPT"];
                                ta.HTTP_ACCEPT_CHARSET = HttpContext.Current.Request.ServerVariables["HTTP_ACCEPT_CHARSET"];
                                ta.HTTP_ACCEPT_ENCODING = HttpContext.Current.Request.ServerVariables["HTTP_ACCEPT_ENCODING"];
                                ta.HTTP_ACCEPT_LANGUAGE = HttpContext.Current.Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"];
                                ta.HTTP_COOKIE = HttpContext.Current.Request.ServerVariables["HTTP_COOKIE"];
                                ta.HTTP_HOST = HttpContext.Current.Request.ServerVariables["HTTP_HOST"];
                                ta.HTTP_USER_AGENT = HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"];
                                #endregion
                                #region Coğrafi Bilgiler
                                Dictionary<string, string> D = new Dictionary<string, string>(Fonksiyonlar.Genel.CografiBilgiler(HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString()));

                                if (D.Count > 0)
                                {
#if DEBUG
                                    try
                                    {
#endif
                                        if (D.Where(x => x.Key == "Status").Select(x => x.Value).FirstOrDefault().ToUpper() == "OK")
                                        {
                                            ta.ULKE = D.Where(x => x.Key == "CountryName").Select(x => x.Value).FirstOrDefault();
                                            ta.ULKE_KOD = D.Where(x => x.Key == "CountryCode").Select(x => x.Value).FirstOrDefault();
                                            ta.IL = D.Where(x => x.Key == "City").Select(x => x.Value).FirstOrDefault();
                                            ta.LAT = decimal.Parse(D.Where(x => x.Key == "Latitude").Select(x => x.Value).FirstOrDefault());
                                            ta.LON = decimal.Parse(D.Where(x => x.Key == "Longitude").Select(x => x.Value).FirstOrDefault());
                                        }
#if DEBUG
                                    }
                                    catch
                                    {
                                    }
#endif
                                }
                                #endregion

                                db.AddTotbl_all_http(ta);
                                db.SaveChanges();
                            }
#if DEBUG
                        }
                        catch (Exception ex)
                        {
                            Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                        }
#endif
                    }
                }

                public class Kullanici
                {
                    public class Kontroller
                    {
                        public static bool KullaniciAdi(string _KullaniciAdi)
                        {
#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from p in db.tbl_adminler
                                               where p.kullanici_adi == _KullaniciAdi.Trim()
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
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return false;
                            }
#endif
                        }

                        public static bool Onay(string KullaniciAdi)
                        {
#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from p in db.tbl_adminler
                                               where p.kullanici_adi == KullaniciAdi.Trim() && p.onay == true
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
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return false;
                            }
#endif
                        }

                        public static bool Root(int AdminID)
                        {
#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from p in db.tbl_adminler
                                               where p.id == AdminID && p.root == true
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
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return false;
                            }
#endif
                        }

                        public static bool Sifre(string KullaniciAdi, string Sifre)
                        {
#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from p in db.tbl_adminler
                                               where p.kullanici_adi == KullaniciAdi.Trim() && p.sifre == Sifre.Trim()
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
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return false;
                            }
#endif
                        }
                    }

                    public class Cagir
                    {
                        public static int ID(string KullaniciAdi)
                        {
#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from p in db.tbl_adminler
                                               where p.kullanici_adi == KullaniciAdi.Trim()
                                               select p.id);

                                    if (SQL.Any())
                                    {
                                        return SQL.FirstOrDefault();
                                    }
                                    else
                                    {
                                        return -1;
                                    }
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return -1;
                            }
#endif
                        }

                        public static string AdSoyad(int ID)
                        {
#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from p in db.tbl_adminler
                                               where p.id == ID
                                               select p.ad_soyad);

                                    if (SQL.Any())
                                    {
                                        return SQL.FirstOrDefault();
                                    }
                                    else
                                    {
                                        return null;
                                    }
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return null;
                            }
#endif
                        }

                        public static string KullaniciAdi(int ID)
                        {
#if DEBUG
                            try
                            {
#endif
                                using (BaglantiCumlesi db = new BaglantiCumlesi())
                                {
                                    var SQL = (from p in db.tbl_adminler
                                               where p.id == ID
                                               select p.kullanici_adi);

                                    if (SQL.Any())
                                    {
                                        return SQL.FirstOrDefault();
                                    }
                                    else
                                    {
                                        return null;
                                    }
                                }
#if DEBUG
                            }
                            catch (Exception ex)
                            {
                                Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                                return null;
                            }
#endif
                        }
                    }
                }
            }
        }
    }
}