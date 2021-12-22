import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/utils/constants/api_end_points.dart';

class PosRepo {
  final DioClient dioClient;
  PosRepo({
    required this.dioClient,
  });

  Future<ApiResponse?> register(
      {required ReqPos data, required bool isClosed,}) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiCashRegister,
        data: isClosed == false? {
          "location_id": data.locationId,
          "initial_amount": data.initialAmount,
          "created_at": data.createdAt,
          "status": data.status
        } : {
          "location_id": data.locationId,
          "closing_amount": data.closingAmount,
          "status": data.status
        },
        // data: data
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
        ApiEndPoints.apiCashRegister,
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
        ApiEndPoints.apiCashRegister,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }
}
