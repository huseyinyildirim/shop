using System;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using MySQLDataModel;

namespace SHOP.asmx
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.None)]
    [ScriptService]
    [Serializable]
    public class GetTexts : WebService
    {
        int DilID = Class.Fonksiyonlar.Dil.ID();

        [WebMethod]
        public string GetText(int ID)
        {
            string Sonuc = null;

            try
            {
                using (BaglantiCumlesi db = new BaglantiCumlesi())
                {
                    //SELECT s.dil_id,d.dil,s.sabitler_id,s.text,t.sayfa FROM tbl_textler s, tbl_sbt_sabit t, tbl_diller d WHERE t.xml=1 AND s.sabitler_id=t.id AND s.dil_id=d.id

                    var SQL = (from s in db.tbl_textler
                               from t in db.tbl_sbt_sabit
                               from d in db.tbl_diller
                               from k in db.tbl_sbt_ulke
                               where t.xml == true && s.sabitler_id == t.id && s.dil_id == DilID && s.onay == true && s.dil_id == d.id && d.ulke_id == k.id && t.id == ID
                               orderby s.sabitler_id ascending
                               select new
                               {
                                   s.text
                               });

                    if (SQL.Any())
                    {
                        Sonuc = SQL.Select(p => p.text).FirstOrDefault();
                    }
                }
            }
            catch (Exception Ex)
            {
                Sonuc = Ex.Message;
            }

            return Sonuc;
        }
    }
}
