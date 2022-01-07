import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/sell/create_sell/req_create_sell.dart';
import 'package:pos/utils/constants/api_end_points.dart';

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
                "closing_amount": data.closingAmount,
                "status": data.status
              },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchUser() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiCustomerList,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchItem() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiProductList,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> createSell(ReqCreateSell sell) async {
    try {
      Response response =
          await dioClient.post(ApiEndPoints.apiCreateSell, data:sell
      //     {
      //   "sells": [
      //     {
      //       "location_id": 1,
      //       "contact_id": 1,
      //       "discount_amount": 10,
      //       "discount_type": "fixed",
      //       "products": [
      //         {
      //           "product_id": 1,
      //           "quantity": 1,
      //           "variation_id": 1,
      //           "unit_price": 437.5
      //         }
      //       ],
      //       "payments": [
      //         {"amount": 1200.13, "method": "cash"}
      //       ]
      //     }
      //   ]
      // }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchBusiness() async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiLocationList,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> fetchRegister({required String registerId}) async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiLUserList + '/' ,queryParameters: {'cash_register': '$registerId'}
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }
}
