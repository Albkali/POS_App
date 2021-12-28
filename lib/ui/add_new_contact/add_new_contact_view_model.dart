import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pos/data/models/auth/res_login.dart';
import 'package:pos/data/models/contact/req_contact.dart';
import 'package:pos/data/models/contact/res_contact.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/repository/contect_repo.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/widgets/loading_dialog.dart';

class AddNewContactViewModel with ChangeNotifier {
  late final ContactRepo contactRepo;

  AddNewContactViewModel({required this.contactRepo});



  Future<ResponseModel> addContact(ReqContact contact,BuildContext context) async {
    print('Enter your name is --->2 ');
    notifyListeners();
    print('Enter your name is --->3 ');
    ApiResponse? apiResponse = await contactRepo.createCotact(data: contact);
    print('Enter your name is ---4 ');
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 201)
    {
      hideLoadingDialog(context: context);
      print('Enter your name is --->5 ');
      ResContact data = ResContact.fromJson(apiResponse.response!.data);
      responseModel = ResponseModel(true, 'successful');
      Navigator.pop(context);
    } else {
      hideLoadingDialog(context: context);
      print('Enter your name is --->6 ');
      print('Enter your name is --->8 ${apiResponse.error} ');
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print('Enter your name is --->7 ${errorMessage}');
      responseModel = ResponseModel(false, errorMessage);
    }

    notifyListeners();
    return responseModel;
  }
}
