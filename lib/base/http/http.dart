import 'package:dio/dio.dart';

typedef Success = void Function(dynamic json);
typedef Fail = void Function(String reason, int code);
typedef After = void Function(String reason, int code);

class Http {
  static Dio _dio;
  static Http http = Http();
  getInstance() {
    return http;
  }

  Http() {
    if (_dio == null) {
      _dio = createDio();
    }
  }

  Dio createDio() {
    var dio = Dio(BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      baseUrl: "https://douban.uieee.com/",
      responseType: ResponseType.json,
    ));
    return dio;
  }

  static Future<void> get(String url, Map<String, dynamic> params,
      {Success success, Fail fail, After after}) {
    _dio.get(url, queryParameters: params).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      ;
      if (after != null) {
        after(response.statusMessage, response.statusCode);
      }
    });
    return Future.value();
  }
}
