import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flutter_arg_demo/http/api.dart';

typedef Success = void Function(dynamic json);
typedef Fail = void Function(String reason, int code);
typedef After = void Function();

class Http {
  static Dio _dio;
  static Http https = Http();

  static Http getInstance() {
    return https;
  }

  Http() {
    if (_dio == null) {
      _dio = createDio();
    }
  }

  Dio createDio() {
    var dio = Dio(BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      sendTimeout: 10000,
      baseUrl: Api.BASE_URL,
      responseType: ResponseType.json,
    ));
    dio.interceptors.add(DioLogInterceptor());
    return dio;
  }

  Future<void> get(String uri, Map<String, dynamic> params,
      {Success success, Fail fail, After after}) {
    _dio.get(uri, queryParameters: params).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    });
    return Future.value();
  }

  Future<void> get2(String uri, String content, int page,
      {Success success, Fail fail, After after}) {
    print(uri + '$content' '/' '$page' '/' '10');
    _dio.get((uri + '$content' '/' '$page' '/' '10'), queryParameters: {}).then(
        (response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    });
    return Future.value();
  }
}
