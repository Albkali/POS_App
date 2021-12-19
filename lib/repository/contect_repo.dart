import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/contact/req_contact.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/utils/constants/api_end_points.dart';

class ContactRepo{
  final DioClient dioClient;

  ContactRepo({required this.dioClient,});
  Future<ApiResponse?> createCotact({required ReqContact data,}) async {
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiCreateContact,
        data: {"grant_type": "password", "username": 'adminuser', "password": 'adminuser',"client_id":"3","client_secret":"rn7okUr0GnJsjQxn1Ea6Ecwsos8vn5LqKElUz2g0",},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

}