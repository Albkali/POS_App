import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/utils/constants/api_end_points.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';

class AuthRepo {
  final DioClient dioClient;

  AuthRepo({
    required this.dioClient,
  });

  Future<ApiResponse?> login(
      {required String email, required String password}) async {
    try {
      Response response = await dioClient.post(
        // ApiEndPoints.apiLogin,
        'https://erpx.shajan-sa.com/oauth/token',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
        data: {
          "grant_type": "password",
          "username": email,
          "password": password,
          "client_id": getString(PrefKeyConstants.clientId),
          "client_secret": getString(PrefKeyConstants.secretKey)
        },
        // data: {"grant_type": "password", "username": 'adminuser', "password": 'adminuser',"client_id":"3","client_secret":getString(PrefKeyConstants.SECRET_KEY),},
        // data: {"grant_type": "password", "username": email, "password": password,"client_id":"3","client_secret":"rn7okUr0GnJsjQxn1Ea6Ecwsos8vn5LqKElUz2g0",},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse?> baseUrl({required String id}) async {
    var formData = FormData.fromMap({'id': id});
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiGetBaseUrl,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}