import 'package:dio/dio.dart';

class ApiHelper {
  static late final Dio dio;
  static intia() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required Map<String, dynamic> query, required String path}) async {
    return await dio.get(path, queryParameters: query);
  }
}
