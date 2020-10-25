using System;
using System.Collections.Generic;
using System.Linq;
using Ext.Net;
using MySQLDataModel;

namespace SHOP.admin
{
    public partial class panel : System.Web.UI.Page
    {
        public class FlatData
        {
            public string Text { get; set; }
            public int Id { get; set; }
            public int ParentId { get; set; }
        }

        public class DeepNodeData
        {
            public int Depth { get; set; }
            public string Text { get; set; }
            public IEnumerable<DeepNodeData> Children { get; set; }
        }

        FlatData[] elements = new FlatData[]
{
   new FlatData {Id = 1, Text = "A"},
   new FlatData {Id = 2, Text = "B"},
   new FlatData {Id = 3, ParentId = 1, Text = "C"},
   new FlatData {Id = 4, ParentId = 1, Text = "D"},
   new FlatData {Id = 5, ParentId = 2, Text = "E"}
};

        protected void Page_Load(object sender, EventArgs e)
        {
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
                DateTime Giris;

                #region Son Giriş Zamanı Al
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    int PID = Class.Fonksiyonlar.Admin.Genel.AdminID();
                    var SQL = (from p in db.tbl_islemler
                               where p.admin_id == PID
                               orderby p.tarih descending
                               select p.tarih).Skip(2).AsEnumerable().Take(1);

                    Giris = SQL.Select(x => x.Value).FirstOrDefault();
                }
                #endregion

                #region Son Giriş Zamanından Beri Geçen Zamanı Hesapla
                DateTime Simdi = DateTime.Now;

                string sonuc = null;

                double gun = (Simdi - Giris).TotalDays;
                double saat = (Simdi.Hour - Giris.Hour);
                double dakika = (Simdi.Minute - Giris.Minute);

                if ((int)gun >= 1)
                {
                    sonuc = sonuc + ((int)gun).ToString() + " gün ";
                }

                if ((int)saat >= 1)
                {
                    sonuc = sonuc + ((int)saat).ToString() + " saat ";
                }

                sonuc = sonuc + ((int)dakika).ToString() + " dak. önce ";
                #endregion

                #region Son Giriş Bilgileri
                LinkButton1.Text = "Son Giriş : " + Giris.ToString() + " - " + sonuc;
                #endregion

                #region Yardım sayfası
                LinkButton4.Text = "Yardım";
                LinkButton4.NavigateUrl = "http://yardim.zirvedns.com";
                LinkButton4.Target = "_blank";
                #endregion

                #region Site önizleme
                LinkButton5.Text = "Site Önizleme";
                LinkButton5.NavigateUrl = "/";
                LinkButton5.Target = "_blank";
                #endregion

                #region Hoşgeldin Olayı
                Label1.Text = "Hoşgeldin  Sn. (" + Class.Fonksiyonlar.Admin.Kullanici.Cagir.KullaniciAdi(Class.Fonksiyonlar.Admin.Genel.AdminID()) + ") " + Class.Fonksiyonlar.Admin.Kullanici.Cagir.AdSoyad(Class.Fonksiyonlar.Admin.Genel.AdminID());
                #endregion

                #region Shop mu, vitrin mi?
                if (!Class.Fonksiyonlar.Firma.Ayar().Select(p => p.type).FirstOrDefault())
                {
                    LabelShop.Text = "VİTRİN";
                    LabelShop.Icon = Icon.CartError;
                }
                else
                {
                    LabelShop.Text = "SHOP";
                    LabelShop.Icon = Icon.Cart;
                }
                #endregion

                //Button -> Button.Menu -> Menu -> ComponentMenui -> ComponentMenui.Component -> 
                //Container -> Container.is -> MenuPanel -> MenuPanel.Menu -> MenuPanel.Menu.is -> 
                //Menui -> MenuSeparator 

                //<ext:Button ID="Button2" runat="server" Text="Products">
                //<Menu>
                //<ext:Menu ID="Menu1" runat="server" ShowSeparator="false">
                //<is>
                //<ext:ComponentMenui ID="ComponentMenui1" runat="server" Shift="false">
                //<Component>
                //<ext:Container ID="Container1" runat="server" AutoWidth="true" AutoHeight="true"
                //AnchorVertical="100%" Layout="ColumnLayout">
                //<is>
                //<ext:MenuPanel ID="MenuPanel2" runat="server" Title="Laptop" Margins="10 10 10 10">
                //<Menu ID="Menu3" runat="server" ShowSeparator="false">
                //<is>
                //<ext:Menui ID="Menui1" runat="server" Text="Navigation Link" Icon="PackageGreen" /> 
                //<ext:MenuSeparator ID="MenuSeparator1" runat="server" /> 

                /*
                //Katman 0
                Ext.Net.Button B = new Ext.Net.Button();
                B.ID = "Button2";
                B.Text = "Products";

                Ext.Net.Menu M = new Ext.Net.Menu();
                M.ID = "Menu1";
                M.ShowSeparator = false;

                Ext.Net.ComponentMenuItem CMI = new Ext.Net.ComponentMenuItem();
                CMI.ID = "ComponentMenui1";
                CMI.Shift = false;

                Ext.Net.Container C = new Ext.Net.Container();
                C.ID = "Container1";
                C.AutoWidth = true;
                C.AutoHeight = true;
                C.AnchorVertical = "100%";
                C.Layout = "ColumnLayout";
 
                //Katman 1
                Ext.Net.MenuPanel MP = new Ext.Net.MenuPanel();
                MP.ID = "MenuPanel2";
                MP.Title = "Laptop";
                MP.Margins = "10 10 10 10";
                MP.Menu.ID = "Menu3";
                MP.Menu.ShowSeparator = false;

                #region Child Menu
                //Katman 1-1
                Ext.Net.MenuItem MI = new Ext.Net.MenuItem();
                MI.ID = "Menui1";
                MI.Text = "Navigation Link";
                MI.Icon = Ext.Net.Icon.PackageGreen;
                #endregion

                #region Separator
                Ext.Net.MenuSeparator MS = new Ext.Net.MenuSeparator();
                MS.ID = "MenuSeparator1";
                #endregion

                MP.Menu.Items.Add(MI);
                MP.Menu.Items.Add(MS);
                C.Items.Add(MP);
                CMI.Component.Add(C);
                M.Items.Add(CMI);
                B.Menu.Add(M);
                MenuToolbar.Items.Add(B);
                */

                #region Icon Register Olayı
                if (!IsPostBack)
                {
                    ResourceManager1.RegisterIcon(Ext.Net.Icon.Cup);
                    ResourceManager1.RegisterIcon(Ext.Net.Icon.StarGold);
                }
                #endregion

                OnlineDurumlari();

                Test();
            }
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

        protected void OnlineDurumlari()
        {
            #region Online Kullanıcılar
            LinkButton2.Text = "Online Kullanıcı : " + Objeler.Listeler.Dil.Count;
            #endregion

            #region Online Yöneticiler
            LinkButton3.Text = "Online Yönetici : " + Objeler.Listeler.Admin.Count;
            #endregion
        }

        [DirectMethod]
        public void DM_CikisYap()
        {
            Viewport1.Hide();

            #region Admin Logla
            Class.Fonksiyonlar.Admin.Log.Oturum(Class.Fonksiyonlar.Admin.Genel.AdminID(), (int)Class.Sabitler.AdminLog.Oturum.Cikis, (int)Class.Sabitler.KullaniciTip.Admin);
            #endregion

            #region Admin Session Sil
            int index = -1;
            index = Objeler.Listeler.Admin.FindIndex(delegate(Objeler.Tanimlar.Admin p)
            {
                return (p.SessionID == Session.SessionID);
            });
            if (index != -1)
            {
                Objeler.Listeler.Admin.RemoveAt(index);
            }
            #endregion

            Class.Fonksiyonlar.ExtJS.YukleyerekYonlendir("default.aspx?rnd=" + (DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond), "Çıkış yapılıyor...");
        }

        protected void Test()
        {
            using (BaglantiCumlesi db = new BaglantiCumlesi())
            {
                try
                {
                    #region Layer 0
                    List<tbl_sbt_menu> Layer0 = (from p in db.tbl_sbt_menu
                                                 where p.menu_id == 0
                                                 select p).ToList<tbl_sbt_menu>();

                    if (Layer0.Any())
                    {
                        #region Create Null Instance
                        Ext.Net.Menu M = null;
                        Ext.Net.ComponentMenuItem CMI = null;
                        Ext.Net.Container C = null;
                        Ext.Net.MenuPanel MP = null;
                        Ext.Net.MenuItem MI = null;
                        Ext.Net.MenuSeparator MS = null;
                        #endregion

                        #region Layer 0 Loop
                        foreach (var i in Layer0)
                        {
                            #region Button
                            Ext.Net.Button B = new Ext.Net.Button();
                            B.ID = "Button" + i.id;
                            B.Text = i.ad;
                            #endregion

                            #region Layer 1
                            List<tbl_sbt_menu> Layer1 = (from p in db.tbl_sbt_menu
                                                         where p.menu_id == i.id
                                                         select p).ToList<tbl_sbt_menu>();

                            if (Layer1.Any())
                            {
                                #region Menu
                                M = new Ext.Net.Menu();
                                M.ID = "Menu" + i.id;
                                M.ShowSeparator = false;
                                #endregion

                                #region Component Menu i
                                CMI = new Ext.Net.ComponentMenuItem();
                                CMI.ID = "ComponentMenuItem" + i.id;
                                CMI.Shift = false;
                                #endregion

                                #region Container
                                C = new Ext.Net.Container();
                                C.ID = "Container" + i.id;
                                C.AutoWidth = true;
                                C.AutoHeight = true;
                                C.AnchorVertical = "100%";
                                C.Layout = "ColumnLayout";
                                #endregion

                                #region Layer 1 Loop
                                foreach (var t in Layer1)
                                {
                                    #region MenuPanel
                                    MP = new Ext.Net.MenuPanel();
                                    MP.ID = "MenuPanel" + t.id;
                                    MP.Title = t.ad;
                                    MP.Margins = "10 10 10 10";
                                    MP.Menu.ID = "Menu" + t.id;
                                    MP.Menu.ShowSeparator = false;
                                    #endregion

                                    #region Layer 2
                                    List<tbl_sbt_menu> Layer2 = (from p in db.tbl_sbt_menu
                                                                 where p.menu_id == t.id
                                                                 select p).ToList<tbl_sbt_menu>();

                                    if (Layer2.Any())
                                    {
                                        int LastID = Layer2[Layer2.Count - 1].id;

                                        #region Layer 2 Loop
                                        foreach (var y in Layer2)
                                        {
                                            #region Menu i
                                            MI = new Ext.Net.MenuItem();
                                            MI.ID = "MenuItem" + y.id;
                                            MI.Text = y.ad;

                                            #region URL Check
                                            if (!string.IsNullOrEmpty(y.url))
                                            {
                                                MI.Icon = Ext.Net.Icon.StarGold;
                                                MI.Listeners.Click.Handler = "TabEkle(TabPanel1, '" + MI.ID + "', '" + y.url + "', '" + MP.ID + "', '" + y.ad + "')";
                                            }
                                            else
                                            {
                                                MI.Icon = Ext.Net.Icon.StarHalfGrey;
                                                MI.Disabled = true;
                                            }
                                            #endregion

                                            #endregion

                                            if (y.id != LastID)
                                            {
                                                #region Menu Separator
                                                MS = new Ext.Net.MenuSeparator();
                                                MS.ID = "MenuSeparator" + y.id;
                                                #endregion
                                            }

                                            #region Adding
                                            MP.Menu.Items.Add(MI);
                                            #endregion

                                            if (y.id != LastID)
                                            {
                                                #region Adding
                                                MP.Menu.Items.Add(MS);
                                                #endregion
                                            }
                                        }
                                        #endregion
                                    }
                                    #endregion

                                    #region Adding
                                    C.Items.Add(MP);
                                    #endregion
                                }
                                #endregion

                                #region Adding
                                CMI.Component.Add(C);
                                M.Items.Add(CMI);
                                B.Menu.Add(M);
                                #endregion
                            }
                            else
                            {
                                B.StandOut = true;
                            }
                            #endregion

                            #region Adding
                            MenuToolbar.Items.Add(B);
                            #endregion
                        }
                        #endregion
                    }
                    #endregion
                }
                catch
                {

                }

                /*
                try
                {
                    //http://www.superstarcoders.com/blogs/posts/recursive-hierarchical-joins-in-c-sharp-and-linq.aspx

                    IEnumerable<DeepNodeData> nodes = elements.RecursiveJoin(
                        element => element.Id,
                        element => element.ParentId,
                        (FlatData element, int index, int depth, IEnumerable<DeepNodeData> children) =>
                        {
                            return new DeepNodeData()
                            {
                                Text = element.Text,
                                Children = children,
                                Depth = depth
                            };
                        });

                    foreach (var i in nodes)
                    {

                    }

                    var q = (from p in db.tbl_sbt_menu
                             select new
                             {
                                 ParentID = p.menu_id,
                                 child = from c in db.tbl_sbt_menu
                                         where c.menu_id == p.id
                                         select new
                                             {
                                                 ChildID = c.id,
                                                 ParentID = c.menu_id
                                             }
                             });

                    //var abc = q.Select(p=>p.child).fir

                }
                catch
                {

                }
                */
            }
        }

    }
}