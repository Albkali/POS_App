import 'package:flutter/material.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/pos/res_business_location.dart';
import 'package:pos/data/models/pos/res_error_open_register.dart';
import 'package:pos/data/models/pos/res_loged_user_detils.dart';
import 'package:pos/data/models/pos/res_pos.dart';
import 'package:pos/data/models/pos/res_product_pos.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/data/models/sell/closesell/res_before_close.dart';
import 'package:pos/data/models/sell/create_sell/req_create_sell.dart';
import 'package:pos/data/models/sell/create_sell/res_create_sell.dart';
import 'package:pos/data/models/tax/res_list_of_tax.dart';
import 'package:pos/repository/pos_repo.dart';
import 'package:pos/utils/constants/app_constants.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/widgets/loading_dialog.dart';

class PosPageViewModel with ChangeNotifier {
  PosRepo posRepo;

  PosPageViewModel({required this.posRepo});

  bool isLoading = false;
  String selectrange = 'Fixed';
  String selectTax = 'None';

  String selectId = '1';
  String invoiceUrl = '';
  ResBeforeClose? userData;
  bool isShowMyAppartment = false;
  bool isShowWithinRadius = false;
  int isSelectedIndex = 0;
  List<User> usersList = [];
  List<Taxes> taxesList = [];
  List<Items> productsList = [];
  List<Items> cartItemList = [];
  List<Location> locationList = [];
  List<ItemDetails> registerDetails = [];
  List<String> skuList = [];

  void addCounter(Items item) {
    item.itemCounter++;
    notifyListeners();
  }

  void removeCounter(Items item) {
    if (item.itemCounter != 1) {
      item.itemCounter--;
    }
    notifyListeners();
  }

  Future<ResponseModel> openRegister(
      ReqPos data, BuildContext context, bool isClosed) async {

    notifyListeners();
    isLoading = true;

    ApiResponse? apiResponse =
        await posRepo.register(data: data, isClosed: isClosed);

    ResponseModel responseModel;
    if (apiResponse!.response != null &&
            apiResponse.response!.statusCode == 201 ||
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      if (apiResponse.response?.data['status'] == 'error') {
        ResOpenRegError data =
            ResOpenRegError.fromJson(apiResponse.response!.data);
        setString(PrefKeyConstants.customerID, data.cashRegisterId);
        responseModel = ResponseModel(true, 'successful');
        Navigator.pop(context);
      } else {
        ResPos data = ResPos.fromJson(apiResponse.response!.data);
        setString(PrefKeyConstants.customerID, data.data.id.toString());
        responseModel = ResponseModel(true, 'successful');
        Navigator.pop(context);
      }
      isLoading = false;
    }
    else
      {
      hideLoadingDialog(context: context);
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      }
      else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
      isLoading = false;
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> userList() async {
    notifyListeners();

    ApiResponse? apiResponse = await posRepo.fetchUser();
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      usersList.clear();
      ResUsersPos data = ResUsersPos.fromJson(apiResponse.response!.data);
      for (var item in data.data) {
        usersList.add(item);
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> productList({required BuildContext context}) async {
    notifyListeners();

    ApiResponse? apiResponse = await posRepo.fetchItem();
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      // hideLoadingDialog(context: context);
      productsList.clear();
      skuList.clear();
      ResProductPos data = ResProductPos.fromJson(apiResponse.response!.data);
      for (var item in data.data) {
        productsList.add(item);
        skuList.add(item.sku);
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      // hideLoadingDialog(context: context);
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> createSell(
      ReqCreateSell sell, BuildContext context) async {
    notifyListeners();
    isLoading = true;
    ApiResponse? apiResponse = await posRepo.createSell(sell);
    ResponseModel responseModel;
    if(apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      if(apiResponse.response?.data[0]['original'] == null )
      {
        ResCreateSell data =
            ResCreateSell.fromJson(apiResponse.response!.data[0]);
        invoiceUrl = data.invoiceUrl;
        ToastUtils.showCustomToast(
            context, 'Sell added successfully', 'success');
        responseModel = ResponseModel(true, 'successful');
      }
      else
        {
          ToastUtils.showCustomToast(
            context,
            apiResponse.response?.data[0]['original']['error']['message'],
            'warning');
        responseModel = ResponseModel(false, 'successful');
      }
      isLoading = false;
    }
    else {
      hideLoadingDialog(context: context);
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
      isLoading = false;
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> userDetails({required BuildContext context}) async {
    // notifyListeners();
    ApiResponse? apiResponse = await posRepo.fetchRegister(
        registerId: getString(PrefKeyConstants.customerID));
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      registerDetails.clear();
      ResLogedUserDetils data =
          await ResLogedUserDetils.fromJson(apiResponse.response!.data);
      registerDetails = await data.data;
      AppConstant.status = registerDetails[0].status;
      responseModel = ResponseModel(true, 'successful');
    } else
      {
        hideLoadingDialog(context: context);
        String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> businessList() async {
    notifyListeners();

    ApiResponse? apiResponse = await posRepo.fetchBusiness();
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      locationList.clear();
      ResBusinessLocation data =
          ResBusinessLocation.fromJson(apiResponse.response!.data);
      for (var item in data.data) {
        locationList.add(item);
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> beforeClose(
      String cashId,String locationId, BuildContext context) async {
    notifyListeners();
    isLoading = true;

    ApiResponse? apiResponse =
    await posRepo.beforeCloseRegister(locationId: locationId,cashId: cashId);

    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      ResBeforeClose data = ResBeforeClose.fromJson(apiResponse.response?.data);
      userData = data;
      responseModel = ResponseModel(true, 'successful');
      isLoading = false;
    } else {
      hideLoadingDialog(context: context);
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
      isLoading = false;
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> taxList({required BuildContext context}) async {
    notifyListeners();

    ApiResponse? apiResponse = await posRepo.fetchTax();
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      taxesList.clear();
      ResListTax data = ResListTax.fromJson(apiResponse.response!.data);
      for (var item in data.data) {
        taxesList.add(item);
        print("LIST IS$taxesList");
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      hideLoadingDialog(context: context);
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    return responseModel;
  }
}
