import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/utils/constants/api_end_points.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';

class AuthRepo{
  final DioClient dioClient;

  AuthRepo({required this.dioClient,});
  Future<ApiResponse?> login({required String email,required String password}) async {
    print('Your secret key is ${getString(PrefKeyConstants.SECRET_KEY)}');
    print('Your secret key is ${getString(PrefKeyConstants.BASE_URL)}');
    try {
      Response response = await dioClient.post(
        ApiEndPoints.apiLogin,
        options: Options(
          headers: {
            'Content-Type':'application/json',
            'Accept':'application/json',
          }
        ),
        data: {"grant_type": "password", "username": email, "password": password,"client_id":"7","client_secret":"ZYMkfnWTklyC4sbHzmpgo3lbchuQEM3QKrw3osXS",},
        // data: {"grant_type": "password", "username": 'adminuser', "password": 'adminuser',"client_id":"3","client_secret":getString(PrefKeyConstants.SECRET_KEY),},
        // data: {"grant_type": "password", "username": email, "password": password,"client_id":"3","client_secret":"rn7okUr0GnJsjQxn1Ea6Ecwsos8vn5LqKElUz2g0",},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

}