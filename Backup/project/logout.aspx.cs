using System;
using System.Linq;

namespace SHOP
{
    public partial class logout : System.Web.UI.Page
    {
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
            //HY 02.11.2012 15:18 kullanıcı için oluşturduğumuz objeyi siliyoruz
            #region bunu kullanıcı sisteme girince yapacaksın. boş obje ile id sini ekliyoruz.
            if (!SHOPObjeler.Listeler.Sistem.Keys.Contains(SHOPClass.Fonksiyonlar.Kullanici.Genel.ID()))
            {
                SHOPObjeler.Listeler.Sistem.Add(SHOPClass.Fonksiyonlar.Kullanici.Genel.ID(), new SHOPObjeler.Tanimlar.Sistem());
            }
            #endregion

            int index = -1;
            index = SHOPObjeler.Listeler.Kullanici.FindIndex(delegate(SHOPObjeler.Tanimlar.Kullanici p)
            {
                return (p.SessionID == Session.SessionID);
            });
            if (index != -1)
            {
                SHOPObjeler.Listeler.Kullanici.RemoveAt(index);
            }

            Response.Redirect("/", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}