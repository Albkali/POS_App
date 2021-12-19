import 'package:flutter/foundation.dart';
import 'package:pos/data/models/auth/res_login.dart';
import 'package:pos/data/models/contact/req_contact.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';

import 'package:pos/repository/auth_repo.dart';
import 'package:pos/repository/contect_repo.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';

class ContactProvider with ChangeNotifier {
  late final ContactRepo contactRepo;

  ContactProvider({required this.contactRepo});

  // for registration section
  bool _isLoading = false;

  bool get isLoading => _isLoading;




  Future<ResponseModel> addContact(ReqContact  contact) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse? apiResponse = await contactRepo.createCotact(data:contact);
    ResponseModel responseModel;
    if (apiResponse!.response != null && apiResponse.response!.statusCode == 200) {
      ResLogin data =  ResLogin.fromJson(apiResponse.response!.data);
      setString(PrefKeyConstants.TOKEN,data.accessToken );
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
}
