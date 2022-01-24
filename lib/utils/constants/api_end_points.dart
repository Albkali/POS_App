/* API End Points Constants*/

class  ApiEndPoints{
    static String apiBaseUrl = "https://erpx.shajan-sa.com/";

  // static String BASE_URL = "https://${getString(PrefKeyConstants.BASE_URL)}/" ;
  // ?'https://erpx.shajan-sa.com/';

  static const String apiLogin = "oauth/token";
  static const String apiCreateSell = "connector/api/sell";
  static const String apiListOfSell = "connector/api/sell";
  static const String apiContact = "connector/api/contactapi";
  static const String apiCreateContact = "connector/api/contactapi";
  static const String apiSellReturn = "connector/api/list-sell-return";
  static const String apiAddSellReturn = "connector/api/sell-return";
  static const String apiCashRegister = "connector/api/cash-register";
  static const String apiCustomerList = "connector/api/contactapi";
  static const String apiProductList = "connector/api/product";
  static const String apiLocationList = "connector/api/business-location";
  static const String apiLUserList = "connector/api/cash-register";
  static const String apiUpdateReturnSell = "connector/api/sell";
  static const String apiSpecifiedContact = "/connector/api/contactapi";
  static const String apiGetBaseUrl = "baseurl.php";
  static const String apiTaxList = "connector/api/tax";
}

