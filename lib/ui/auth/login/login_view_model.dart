import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos/data/models/auth/res_base_url_page.dart';
import 'package:pos/data/models/auth/res_login.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/repository/auth_repo.dart';
import 'package:pos/utils/constants/app_constants.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/widgets/loading_dialog.dart';

import 'login_page.dart';

class LoginViewModel with ChangeNotifier {
  late final AuthRepo authRepo;

  LoginViewModel({required this.authRepo});

  // for registration section
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _registrationErrorMessage = '';

  String get registrationErrorMessage => _registrationErrorMessage;

  updateRegistrationErrorMessage(String message) {
    _registrationErrorMessage = message;
    notifyListeners();
  }

  // for login section
  String _loginErrorMessage = '';

  String get loginErrorMessage => _loginErrorMessage;

  Future<ResponseModel> login(
      String email, String password, BuildContext context) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    print("HELLO EMAILO$email");
    print("HELLO PASSWORD$password");
    print("HELLO CLIENT ID ${getString(PrefKeyConstants.clientId)} ");
    print("HELLO CLIENT SECRET IS ${getString(PrefKeyConstants.secretKey)}");
    ApiResponse? apiResponse =
        await authRepo.login(email: email, password: password);
    print("API RES CODE${apiResponse?.response?.statusCode}");
    print("API RES HASCODE${apiResponse?.response.hashCode}");

    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      ResLogin data = ResLogin.fromJson(apiResponse.response!.data);
      setString(PrefKeyConstants.token, data.accessToken);
      AppConstant.token = data.accessToken;
      responseModel = ResponseModel(true, 'successful');
      ToastUtils.showCustomToast(context, 'Login successfully', 'success');
    } else {
      print("HELLLO 6");
      print("HELLLO 7${apiResponse.error}");
      hideLoadingDialog(context: context);
      String errorMessage;
      ToastUtils.showCustomToast(context, 'Invalid User', 'warning');
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      _loginErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> baseUrl(String id, BuildContext context) async {
    notifyListeners();
    ApiResponse? apiResponse = await authRepo.baseUrl(id: id);
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      var xyz = jsonDecode(apiResponse.response?.data);
      if (xyz['status'] == true) {
        ResBaseUrl data =
            ResBaseUrl.fromJson(jsonDecode(apiResponse.response!.data));
        await setString(PrefKeyConstants.secretKey, data.data.clientSecret);
        await setString(PrefKeyConstants.baseUrl, data.data.baseUrl);
        await setString(PrefKeyConstants.clientId, data.data.clientId);
        // ApiEndPoints.apiBaseUrl =  data.data.baseUrl;
        print("HELLO CLIENT SECRET ${getString(PrefKeyConstants.secretKey)}");
        print("HELLO CLIENT SECRET ${getString(PrefKeyConstants.baseUrl)}");
        print("HELLO CLIENT SECRET ${getString(PrefKeyConstants.clientId)}");
        responseModel = ResponseModel(true, 'successful');
        ToastUtils.showCustomToast(context, 'ADDED successfully', 'success');
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const LoginPage();
        }));
      } else {
        responseModel = ResponseModel(true, 'successful');
        ToastUtils.showCustomToast(context, 'Invalid Subdomain', 'warning');
      }
    } else {
      hideLoadingDialog(context: context);
      String errorMessage;
      ToastUtils.showCustomToast(context, 'Invalid User', 'warning');
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
}
