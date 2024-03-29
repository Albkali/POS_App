import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/data/models/sell/returnsell/req_add_return_sell.dart';
import 'package:pos/utils/constants/api_end_points.dart';
import 'package:pos/utils/constants/app_constants.dart';

class SellRepo{
  final DioClient dioClient;
  SellRepo({required this.dioClient});



  Future<ApiResponse?> getListSell() async {
    try {
      Response response = await dioClient.get(
          ApiEndPoints.apiBaseUrl + ApiEndPoints.apiListOfSell
          // ApiEndPoints.apiListOfSell
          ,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Accept': 'application/json',
            'Authorization': 'Bearer ${AppConstant.token}'
          }),
          queryParameters: {
            'per_page': "-1",
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
  Future<ApiResponse?> updateReturnSell({required String sellId,required String pendingPayment}) async {

    try {
      Response response = await dioClient.put(
        ApiEndPoints.apiBaseUrl +
            ApiEndPoints.apiUpdateReturnSell +
            Uri.encodeFull('/$sellId'),
        data: {
          'payments': [
            {"amount": pendingPayment, "method": "cash"}
          ]
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

  Future<ApiResponse?> getFilterListSell(
      String? locationId,
      String? paymentStatus,
      String? contactId,
      String? shippingStatus,
      String? isSubscribed,
      String? startDate,
      String? endDate) async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiBaseUrl + ApiEndPoints.apiListOfSell,
        queryParameters: {
          'per_page': '-1',
          'location_id': '$locationId',
          'payment_status': '$paymentStatus',
          'contact_id': '$contactId',
          'shipping_status': '$shippingStatus',
          'only_subscriptions': '$isSubscribed',
          'start_date': '$startDate',
          'end_date': '$endDate'
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
  Future<ApiResponse?> addSellReturn({required ReqAddReturnSell req}) async {

    try {
      Response response = await dioClient.post(
          ApiEndPoints.apiBaseUrl + ApiEndPoints.apiAddSellReturn,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Accept': 'application/json',
            'Authorization': 'Bearer ${AppConstant.token}'
          }),
          queryParameters: req.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
  Future<ApiResponse?> getSpecifiedContact({required String contactId}) async {
    try {
      Response response = await dioClient.get(
        ApiEndPoints.apiBaseUrl +
            ApiEndPoints.apiSpecifiedContact +
            '/$contactId',
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
