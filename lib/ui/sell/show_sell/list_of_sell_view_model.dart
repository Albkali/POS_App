import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/data/models/sell/res_specified_contact.dart';
import 'package:pos/data/models/sell/show_sell/res_show_sell.dart';
import 'package:pos/data/models/sell/show_sell/res_update_return_sell.dart';
import 'package:pos/repository/sell_repo.dart';
import 'package:pos/widgets/loading_dialog.dart';

class ListOfSellViewModel with ChangeNotifier {
  final SellRepo sellRepo;

  ListOfSellViewModel({required this.sellRepo});


  List<User> userList = [];

  List<SellItem> reversedSellItemList = [];
  List<SellItem> sellItemList = [];
  List<SellItem> reversedFilterList = [];
  List<SellItem> filterList = [];
  List<SpecifiedUser> specifiedContactList = [];

  List<SellItem>? get selllist => sellItemList;
  String? paymentUrl;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _registrationErrorMessage = '';

  String get registrationErrorMessage => _registrationErrorMessage;

  updateRegistrationErrorMessage(String message) {
    _registrationErrorMessage = message;
    notifyListeners();
  }

  Future<ResponseModel> sellList() async {
    _isLoading = true;
    notifyListeners();

    ApiResponse? apiResponse = await sellRepo.getListSell();
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      ResShowSell data = ResShowSell.fromJson(apiResponse.response!.data);
      print('Your total data ${data.data.length}');
      for (var item in data.data) {
        reversedSellItemList.add(item);
      }
      sellItemList = reversedSellItemList.reversed.toList();
      print('Your total sellitemlist ${sellItemList.length}');
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> filterSellList(
      {String? locationId,
      String? paymentStatus,
      String? contactId,
      String? ShippingStatus,
      String? IsSubscribed,
      String? startDate,
      String? endDate}) async {
    _isLoading = true;
    notifyListeners();

    ApiResponse? apiResponse = await sellRepo.getFilterListSell(
        locationId,
        paymentStatus,
        contactId,
        ShippingStatus,
        IsSubscribed,
        startDate,
        endDate);
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      ResShowSell data = ResShowSell.fromJson(apiResponse.response!.data);
      print('Your total data ${data.data.length}');
      filterList.clear();
      sellItemList.clear();
      reversedSellItemList.clear();
      for (var item in data.data) {
        reversedFilterList.add(item);
        sellItemList = reversedSellItemList.reversed.toList();
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> addPayment({required String sellID,required String payment}) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse? apiResponse = await sellRepo.updateReturnSell(sellId: '$sellID',pendingPayment:payment );
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      ResUpdateReturnSell data = ResUpdateReturnSell.fromJson(apiResponse.response!.data);
      paymentUrl = data.invoiceUrl;
      print('Your total data is 31 ${data.type}');
      print('Your total data is 32${data.transactionDate}');
      print('Your total data is 33 ${data.invoiceUrl}');

      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> getSpecifiedContact({required String contactId,required BuildContext context}) async {
    ApiResponse? apiResponse = await sellRepo.getSpecifiedContact(contactId: contactId);
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
        hideLoadingDialog(context: context);
       ResSpecifiedContact data = ResSpecifiedContact.fromJson(apiResponse.response!.data);
       specifiedContactList = data.data;
      responseModel = ResponseModel(true, 'successful');
    }
      else {
      hideLoadingDialog(context: context);
      String errorMessage;
      if (apiResponse.error is String)
      {
        errorMessage = apiResponse.error.toString();
      }
      else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

}
