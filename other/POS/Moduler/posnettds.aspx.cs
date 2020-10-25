using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using _PosnetDotNetTDSOOSModule;

namespace Moduler {

    /*
    * Authorization - Provizyon
    * AuthRev - Provizyon İptal
    * Capture - Finansallaştırma
    * Capture Rev - Finansallaştırma İptal
    * Sale - Satış
    * Sale With Point - Satış + Puan Kullanım
    * Sale Rev - Satış İptal
    * Return - İade
    * Return Rev - İade İptal
    * Point Inquiry - Puan Sorgulama
    * Point Usage - Puan Kullanım
    * Point Reverse - Puan Kullanım İptal
    * Point Return - Puan İade
    * VFT Inquiry - VFT Sorgulama
    * VFT Sale - VFT Satis
    * VFT Sale Rev - VFT Iptal
    * KOI Inquiry - Joker Vadaa Sorgulama
     */

    public partial class posnettds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            C_PosnetOOSTDS CPTDS = new C_PosnetOOSTDS();

            string custName = "Test TEST"; //Request.Form.Get("custName");
            string xid = "YKB_0000120814020200"; // Request.Form.Get("XID");

            string ccno = "5400637500005263";  //Request.Form.Get("ccno");
            string expdate = "0607"; //Request.Form.Get("expdate");
            string cvv = "XXX"; //Request.Form.Get("cvv");

            string amount = "5696"; //Request.Form.Get("amount");
            string currencyCode = "TL";  //Request.Form.Get("currency");
            string instalment = "00"; //Request.Form.Get("instalment");
            string tranType = "Sale"; //Request.Form.Get("tranType");
            string vftCode = "K001"; //Request.Form.Get("vftCode");

            //this.imageField.OnClientClick = "submitFormEx(formName, " + posnettds_config.OPEN_NEW_WINDOW + ", 'YKBWindow');";

            CPTDS.SetMid(posnettds_config.MERCHANT_ID);
            CPTDS.SetTid(posnettds_config.TERMINAL_ID);
            CPTDS.SetPosnetID(posnettds_config.POSNET_ID);
            CPTDS.SetKey(posnettds_config.ENCKEY);

            this.amount.Text = posnettds_util.CurrencyFormat(amount, currencyCode, true);
            this.instNumber.Text = instalment;
            this.XID.Text = xid;

            if (posnettds_config.USE_OOS_PAGE)
            {
                if ((!CPTDS.CreateTranRequestDatas(custName, amount, currencyCode, instalment, xid, tranType,"","","")))
                {
                    Response.Write("Posnet Data 'ları olusturulamadi (" + CPTDS.GetResponseText() + ")<br>");
                    Response.Write("Error Code : " + CPTDS.GetResponseCode());
                    Response.End();
                }

            }
            else
            {
                if ((!CPTDS.CreateTranRequestDatas(custName, amount, currencyCode, instalment, xid, tranType, ccno, expdate, cvv)))
                {
                    Response.Write("Posnet Data 'ları olusturulamadi (" + CPTDS.GetResponseText() + ")<br>");
                    Response.Write("Error Code : " + CPTDS.GetResponseCode());
                    Response.End();
                }
            }

            //Hidden fields
            this.mid.Value = posnettds_config.MERCHANT_ID;
            this.posnetID.Value = posnettds_config.POSNET_ID;
            this.posnetData.Value = CPTDS.GetPosnetData();
            this.posnetData2.Value = CPTDS.GetPosnetData2();
            this.digest.Value = CPTDS.GetSign();
            this.vftCode.Value = vftCode;
            this.merchantReturnURL.Value = posnettds_util.GetReturnURL(Request);
            this.openANewWindow.Value = posnettds_config.OPEN_NEW_WINDOW;
        }
    }
}