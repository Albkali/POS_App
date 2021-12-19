import 'package:dio/dio.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;


  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var _locale = sharedPreferences.getString(PrefKeyConstants.LANGUAGE_CODE);
  
    options.headers['lang'] = _locale;
    print("--> ${options.method} ${options.path}");
    print("Headers: ${options.headers['lang']}");
    print("<-- END HTTP");

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    print(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }

    print("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print("ERROR[${err.response!.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
