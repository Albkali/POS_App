import 'package:dio/dio.dart';
import 'package:pos/data/datasource/remote/dio/dio_client.dart';
import 'package:pos/data/models/response/base/api_response.dart';
import 'package:pos/utils/constants/api_end_points.dart';

class SellRepo{
  final DioClient dioClient;
  SellRepo({required this.dioClient,});



  Future<ApiResponse?> getListSell() async {
    try {
      Response response = await dioClient.get(ApiEndPoints.apiListOfSell,);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }

}