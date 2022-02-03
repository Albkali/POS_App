import 'package:flutter/cupertino.dart';
import 'package:pos/data/models/contact/req_contact.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/repository/contect_repo.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/widgets/loading_dialog.dart';

class AddNewContactViewModel with ChangeNotifier {
  late final ContactRepo contactRepo;

  AddNewContactViewModel({required this.contactRepo});

  Future<ResponseModel> addContact(ReqContact contact,BuildContext context) async {
    notifyListeners();
    ApiResponse? apiResponse = await contactRepo.createCotact(data: contact);
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 201) {
      hideLoadingDialog(context: context);
      responseModel = ResponseModel(true, 'successful');
      Navigator.pop(context);
    } else {
      hideLoadingDialog(context: context);
      String errorMessage;
      ToastUtils.showCustomToast(
          context, "The given data was invalid", "warning");
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
