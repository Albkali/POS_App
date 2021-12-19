import 'package:flutter/foundation.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/data/models/sell/show_sell/res_show_sell.dart';
import 'package:pos/repository/sell_repo.dart';

class SellListProvider with ChangeNotifier {
  final SellRepo sellRepo;

  SellListProvider({required this.sellRepo});


  List<SellItem> sellItemList = [];

  List<SellItem>? get selllist => sellItemList;

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
    if (apiResponse!.response != null && apiResponse.response!.statusCode == 200) {
      ResShowSell data =  ResShowSell.fromJson(apiResponse.response!.data);
      print('Your total data ${data.data.length}');
      for (var item in data.data) {

        sellItemList.add(item);
      }
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





}
