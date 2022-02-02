import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/sell/create_sell/req_create_sell.dart';
import 'package:pos/utils/constants/api_end_points.dart';
import 'package:pos/utils/constants/app_constants.dart';

class PosRepo {
  final DioClient dioClient;
  PosRepo({
    required this.dioClient,
  });

  Future<ApiResponse?> register(
      {required ReqPos data, required bool isClosed}) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiCashRegister,
        data: isClosed == false
            ? {
                "location_id": data.locationId,
                "initial_amount": data.initialAmount,
                "created_at": data.createdAt,
                "status": data.status
              }
            : {
                "location_id": data.locationId,
                "closed_at": data.closedAt,
                "status": data.status,
                "cash_register_id": data.cashRegisterId,
                "closing_amount": data.closingAmount,
                "total_card_slips": data.totalCardSlips,
                "total_cheques": data.totalCheques,
                "closing_note": data.closingNote,
                "transaction_ids": data.transactionIds
              },
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchUser() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiCustomerList,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchItem() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiProductList,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),

        // queryParameters: {"location_id":getString(PrefKeyConstants.locationId)}
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> createSell(ReqCreateSell sell) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiCreateSell,
        data: sell,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
  Future<ApiResponse?> createSellError(ReqCreateSell sell) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiCreateSell,
        data: sell,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchBusiness() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiLocationList,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchRegister({required String registerId}) async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiLUserList + '/' + registerId,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
  Future <ApiResponse?> beforeCloseRegister({
     required String cashId,  required String locationId}) async
  {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiCashRegister,
        data: {
          'location_id': locationId,
          'cash_register_id': cashId,
          'status': 'before_close',
        },
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchTax() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiTaxList,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstant.token}'
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}
