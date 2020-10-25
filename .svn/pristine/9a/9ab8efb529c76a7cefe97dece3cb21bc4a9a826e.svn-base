using System;
using System.Linq;

namespace SHOP
{
    public partial class Test : System.Web.UI.Page
    {
        int KullaniciID { get; set; }
        SHOPObjeler.Tanimlar.Sistem Sistem { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            int KullaniciID = 1;

            //bunu kullanıcı sisteme girince yapacaksın. boş obje ile id sini ekliyoruz.
            if (!SHOPObjeler.Listeler.Sistem.Keys.Contains(KullaniciID))
            {
                SHOPObjeler.Listeler.Sistem.Add(KullaniciID, new SHOPObjeler.Tanimlar.Sistem());
            }

            //ObjeSetle();
        }

        protected void ObjeSetle()
        {
            Sistem = (from p in SHOPObjeler.Listeler.Sistem
                      where p.Key == KullaniciID
                      select p.Value).Cast<SHOPObjeler.Tanimlar.Sistem>().ToList()[0];
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ObjeSetle();
            SHOPObjeler.Tanimlar.Sepet Sepet = new SHOPObjeler.Tanimlar.Sepet();
            Sepet.Toplam = 1000;
            Sistem.Sepet = Sepet;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ObjeSetle();
            Response.Write(Sistem.Sepet.Toplam.ToString());
        }
    }
}