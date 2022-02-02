import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pos/utils/constants/app_constants.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';

import 'logging_interceptor.dart';

class DioClient {
  Dio? dio;
  String? token;
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  // final SharedPreferences sharedPreferences;

  DioClient(
    this.baseUrl,
    Dio dioC,
    this.token, {
    required this.loggingInterceptor,
  }) {
    // token = AppConstant.token;
    // token = AppConstant.token;
    token = AppConstant.token ?? getString(PrefKeyConstants.token);
    print('Your token is $token');
    dio = Dio();
    // dio = dioC ?? Dio();
    dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    dio!.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(String uri, {
     Map<String, dynamic>? queryParameters,
     Options? options,
     CancelToken? cancelToken,
     ProgressCallback? onReceiveProgress,
  }) async {
    try {
      print("URL IS ${uri}");
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String uri, {
    data,
     Map<String, dynamic>? queryParameters,
     Options ?options,
     CancelToken? cancelToken,
     ProgressCallback? onSendProgress,
     ProgressCallback? onReceiveProgress,
  }) async {
    try {
      print("URL IS ${uri}");
      print("DATA IS ${data}");
      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String uri, {
    data,
     Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
