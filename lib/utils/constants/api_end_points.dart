/* API End Points Constants*/

import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';

class  ApiEndPoints{
    static String BASE_URL = "https://erpx.shajan-sa.com/" ;
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
}

