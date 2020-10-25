using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHOP
{
    public partial class test_sozlesme2 : System.Web.UI.Page
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
            lit_1.Text = Class.Fonksiyonlar.Uygulama.SabitlerText(236);
        }
    }
}