using System.Web;
using System.Text.RegularExpressions;

public class posnettds_util{

    public static string GetReturnURL (HttpRequest request){
    
        string url;
        Regex  regEx;

        string  domainName = request.ServerVariables["SERVER_NAME"];
        url = request.ServerVariables["URL"];

        string  protocol = "http";

        if  (request.ServerVariables["HTTPS"] == "on") {
            protocol = "https";
        }

        
        string  port = "";
        if  (((protocol != "https") && (request.ServerVariables["SERVER_PORT"] != "80")) 
            || ((protocol == "https") && (request.ServerVariables["SERVER_PORT"] != "443"))) {
            port = ":" + request.ServerVariables["SERVER_PORT"];
         }

        url = protocol + "://" + domainName + port + url;

        regEx = new Regex(".aspx", RegexOptions.IgnoreCase);
        return regEx.Replace(url, "_resp.aspx");
    }
    
    public static double  ConvertYTLToYKR( string amount ) {
        if (amount!=null && amount.Length > 0){
            return  double.Parse(amount.Replace(".", "")) * 100;
        }else {
            return 0;
        }
    }

    public static string GetCurrencyText(string currencyCode)
    {

        if (currencyCode == "YT" || currencyCode == "TL")
        {
            return "TL";
        }
        else if (currencyCode == "US")
        {
            return "USD";
        }
        else if (currencyCode == "EU")
        {
            return "EUR";
        }
        else
        {
            return "";
        }
    }

    /**
     * 
     * 
     * 
     */

    public static string CurrencyFormat(string amount, string currencyCode, bool addCurrency)
    {

        if (amount == null || amount == "")
        {
            return "";
        }

        if (amount == "-1")
        {
            return "";
        }
        else
        {
            if (amount.Length == 2)
            {
                amount = "0" + amount;
            }
            else if (amount.Length < 2)
            {
                amount = "00" + amount; 
            }
            
            
            if (currencyCode == "YT" || currencyCode == "TL" || currencyCode == "US" || currencyCode == "EU")
            {
                string currencyFormat = amount.Substring(0, amount.Length - 2) + "," + amount.Substring(amount.Length-2, 2);
                if (addCurrency)
                {
                    return currencyFormat + " " + GetCurrencyText(currencyCode);
                }
                else
                {
                    return currencyFormat;
                }
            }
            else
            {
                return amount;
            }
        }
    }

    public static bool  ThreeDSecureCheck(string threeDMdStatus ) {
       

        if (!posnettds_config.TD_SECURE_CHECK)
        {
            return true;
        }
        else {
            string[] strArray = posnettds_config.TD_SECURE_CHECK_MASK.Split(':');           
            for ( int i = 0 ; i <   strArray.Length ; i++){
                if ( strArray[i] == threeDMdStatus) {
                    return true;
                }
            }
            return false;
        }
       }
};
