using System;

namespace SHOP.ascx
{
    public partial class solblok : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class.Fonksiyonlar.Uygulama.Bloklar.Blok("sol", solbloklar);
        }
    }
}