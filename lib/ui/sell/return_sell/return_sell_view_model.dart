import 'package:flutter/material.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/response_model.dart';
import 'package:pos/data/models/sell/returnsell/req_add_return_sell.dart';
import 'package:pos/data/models/sell/returnsell/res_add_return_sell.dart';
import 'package:pos/repository/sell_repo.dart';
class ReturnSellViewModel extends ChangeNotifier{
  final SellRepo sellRepo;

  ReturnSellViewModel({required this.sellRepo});

  String selectrange = 'Fixed';
  bool _isLoading = false;


  changeVal(){
    notifyListeners();
  }

  Future<ResponseModel> addReturnSell({required ReqAddReturnSell req}) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse? apiResponse = await sellRepo.addSellReturn(req: req);
    ResponseModel responseModel;
    if (apiResponse!.response != null &&
        apiResponse.response!.statusCode == 200) {
      ResAddSellReturn data =
          ResAddSellReturn.fromJson(apiResponse.response!.data);
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
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}