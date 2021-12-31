import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pos/data/models/auth/res_login.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/repository/auth_repo.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/widgets/loading_dialog.dart';

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

  Future<ResponseModel> login(String email, String password,BuildContext context) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    ApiResponse? apiResponse =
        await authRepo.login(email: email, password: password);
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      hideLoadingDialog(context: context);
      ResLogin data = ResLogin.fromJson(apiResponse.response!.data);
      setString(PrefKeyConstants.TOKEN, data.accessToken);
      responseModel = ResponseModel(true, 'successful');
      ToastUtils.showCustomToast(context, 'Login successfully', 'success');

    } else {
      hideLoadingDialog(context: context);
      String errorMessage;
      ToastUtils.showCustomToast(context, 'Invalid User', 'warning');
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      _loginErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
