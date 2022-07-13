import 'package:dio/dio.dart';

class Http {
  static const String baseUrl = "https://www.wanandroid.com/";

  static Http? _instance;

  late Dio dio;

  factory Http() => _getInstance();

  static _getInstance() {
    _instance ??= Http._();
    return _instance;
  }

  Http._() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
    );
    dio = Dio(options)
    ..interceptors.add(LogInterceptor());
  }
}
