using System;

namespace SHOP.ascx
{
    public partial class odeme_paypal : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_paypal_ode_Click(object sender, EventArgs e)
        {
            Response.Redirect(SHOPClass.Odemeler.Paypal.Adres(1, "Deneme ürün", "SER-001"), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}