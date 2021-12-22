import 'package:flutter/material.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/pos/res_pos.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/repository/pos_repo.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/widgets/loading_dialog.dart';

class  PosPageViewModel with ChangeNotifier{
  PosRepo posRepo;

  PosPageViewModel({required this.posRepo});


  bool isShowMyAppartment = false;
  bool isShowWithinRadius = false;
  int isSelectedIndex = 0;
  dynamic scannedItems = [];
  List<User> usersList = [];
  List<User> productsList = [];


  int counter = 0;
  void addCounter() {
    counter++;
    notifyListeners();
  }

  void removeCounter() {
    if (counter != 0) counter--;
    notifyListeners();
  }

  final list_items = [1, 2, 3];


  Future<ResponseModel> openRegister(ReqPos data,BuildContext context,bool isClosed ) async {
    notifyListeners();
    ApiResponse? apiResponse = await posRepo.register(data:data ,isClosed: isClosed,  );
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 201) {
      hideLoadingDialog(context: context);
      ResPos data = ResPos.fromJson(apiResponse.response!.data);
      responseModel = ResponseModel(true, 'successful');
      if(isClosed == false){
        ToastUtils.showCustomToast(context, 'Register open successful', 'success');
      } else {
        ToastUtils.showCustomToast(context, 'Register close successful', 'success');
      }
      Navigator.pop(context);
    } else {
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

  Future<ResponseModel> userList() async {
    notifyListeners();

    ApiResponse? apiResponse = await posRepo.fetchUser();
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      ResUsersPos data = ResUsersPos.fromJson(apiResponse.response!.data);
      print('Your total data ${data.data.length}');
      for (var item in data.data) {
        usersList.add(item);
      }
      print('Your total sellitemlist ${usersList.length}');

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
      ResUsersPos data = ResUsersPos.fromJson(apiResponse.response!.data);
      print('Your total data ${data.data.length}');
      for (var item in data.data) {
        productsList.add(item);
      }
      print('Your total sellitemlist ${productsList.length}');

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
}