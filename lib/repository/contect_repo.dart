import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/contact/req_contact.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/utils/constants/api_end_points.dart';

class ContactRepo
{
  final DioClient dioClient;

  ContactRepo({
    required this.dioClient,
  });
  Future<ApiResponse?> createCotact({
    required ReqContact data,
  }) async {
    try {
      Response response = await dioClient.post(ApiEndPoints.apiCreateContact, data: {
        "type": "business",
        "supplier_business_name": data.supplierBusinessName,
        "first_name": data.firstName,
        "mobile": data.mobile
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}
