using System;
using System.Linq;

namespace SHOP
{
    public partial class Test2 : System.Web.UI.Page
    {
        int KullaniciID { get; set; }
        SHOPObjeler.Tanimlar.Sistem S { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            KullaniciID = 1;
            ObjeSetle();
        }

        protected void ObjeSetle()
        {
            S = (from p in SHOPObjeler.Listeler.Sistem
                 where p.Key == KullaniciID
                 select p.Value).Cast<SHOPObjeler.Tanimlar.Sistem>().ToList()[0];
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ObjeSetle();
            Response.Write(S.Sepet.Toplam.ToString());
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ObjeSetle();

            SHOPObjeler.Tanimlar.Sepet Sepet = new SHOPObjeler.Tanimlar.Sepet();
            Sepet = S.Sepet;
            Sepet.Toplam = 2000;

            S.Sepet = Sepet;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ObjeSetle();
            Response.Write(S.Sepet.Toplam.ToString());
        }
    }
}