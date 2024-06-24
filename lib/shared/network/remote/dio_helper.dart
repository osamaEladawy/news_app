import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
//https://newsapi.org/
// v2/top-headlines?
// country=eg
// &category=business
// &apiKey=5d9b02d51b0446f3b5095e818afbdb1e
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String? url,
    Map<String, dynamic>? query,
  }) async {
    return await dio?.get(
      url!,
      queryParameters: query,
    );
  }
}
