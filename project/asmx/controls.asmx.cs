using System;
using System.Web.Script.Services;
using System.Web.Services;

namespace SHOP.asmx
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.None)]
    [ScriptService]
    [Serializable]
    public class controls : System.Web.Services.WebService
    {
        [WebMethod]
        public bool TestBankPurchase(int BankaID, int? Taksit)
        {
            try
            {
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
