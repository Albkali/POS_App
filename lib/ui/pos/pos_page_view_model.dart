import 'package:flutter/material.dart';
import 'package:pos/data/models/pos/ResLogedUserDetils.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/pos/res_business_location.dart';
import 'package:pos/data/models/pos/res_pos.dart';
import 'package:pos/data/models/pos/res_product_pos.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/data/models/sell/closesell/res_before_close.dart';
import 'package:pos/data/models/sell/create_sell/req_create_sell.dart';
import 'package:pos/data/models/sell/create_sell/res_create_sell.dart';
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
  String selectId = '1';
  String invoiceUrl = '';
  ResBeforeClose? userData;

  bool isShowMyAppartment = false;
  bool isShowWithinRadius = false;
  int isSelectedIndex = 0;
  List<User> usersList = [];
  List<Items> productsList = [];
  List<Items> cartItemList = [];
  List<Location> locationList = [];
  List<ItemDetails> registerDetails = [];

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
    print("DATA IS${data.toJson()}");

    notifyListeners();
    isLoading = true;

    ApiResponse? apiResponse =
        await posRepo.register(data: data, isClosed: isClosed);

    ResponseModel responseModel;
    if (apiResponse!.response != null &&
            apiResponse.response!.statusCode == 201 ||
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      ResPos data = ResPos.fromJson(apiResponse.response!.data);
      setString(PrefKeyConstants.customerID, data.data.id.toString());
      responseModel = ResponseModel(true, 'successful');
      Navigator.pop(context);
      isLoading = false;
    } else {
      hideLoadingDialog(context: context);
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        print('Your error is ${apiResponse.error}');
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
      print(errorMessage);
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> productList() async {
    notifyListeners();

    ApiResponse? apiResponse = await posRepo.fetchItem();
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      productsList.clear();
      ResProductPos data = ResProductPos.fromJson(apiResponse.response!.data);
      for (var item in data.data) {
        productsList.add(item);
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
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> createSell(
      ReqCreateSell sell, BuildContext context) async {
    notifyListeners();
    isLoading = true;
    ApiResponse? apiResponse = await posRepo.createSell(sell);
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      if (apiResponse.response?.data[0]['original'] == null) {
        ResCreateSell data =
            ResCreateSell.fromJson(apiResponse.response!.data[0]);
        invoiceUrl = data.invoiceUrl;
        print('Your total data ${data.invoiceUrl}');
        ToastUtils.showCustomToast(
            context, 'Sell added successfully', 'success');
        responseModel = ResponseModel(true, 'successful');
      } else {
        ToastUtils.showCustomToast(
            context,
            apiResponse.response?.data[0]['original']['error']['message'],
            'warning');
        responseModel = ResponseModel(false, 'successful');
      }
      // for (var item in data.data) {
      //   productsList.add(item);
      // }
      // print('Your total product  ${data.invoiceUrl}');

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

  Future<ResponseModel> UserDetails() async {
    // notifyListeners();
    ApiResponse? apiResponse = await posRepo.fetchRegister(
        registerId: '${getString(PrefKeyConstants.customerID)}');
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      registerDetails.clear();
      ResLogedUserDetils data =
          await ResLogedUserDetils.fromJson(apiResponse.response!.data);
      registerDetails = await data.data;
      AppConstant.status = registerDetails[0].status;
      print("HELLO STAUS${registerDetails[0].status}");
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
      print(errorMessage);
      responseModel = ResponseModel(false, errorMessage);
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> beforeClose(
      String cashId, String locationId, BuildContext context) async {
    notifyListeners();
    isLoading = true;

    ApiResponse? apiResponse = await posRepo.beforeCloseRegister(
        locationId: locationId, cashId: cashId);

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
        print('Your error is ${apiResponse.error}');
        errorMessage = apiResponse.error.errors[0].message;
      }
      responseModel = ResponseModel(false, errorMessage);
      isLoading = false;
    }
    notifyListeners();
    return responseModel;
  }
}
