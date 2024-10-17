import 'package:dio/dio.dart';
import 'package:quote_app_block/data/api/constant.dart';

class Config {
  static Dio getDio() {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    Dio dio = Dio(options);
    dio.interceptors.add(
        LogInterceptor(requestHeader: true, responseBody: true, error: true));
    return dio;
  }
}
// config