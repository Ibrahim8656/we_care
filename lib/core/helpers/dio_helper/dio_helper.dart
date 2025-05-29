import 'package:dio/dio.dart';
import 'package:we_care/features/Checkout/data/ApisKeys.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions( headers: {
      'Content-Type': 'application/json',
      'lang': 'en',
    }));
  }

  

  static Future<Response> postdata({
  required String Url,
  String? token,
  dynamic data,
  String? Content_Type
}) async {
  dio.options.headers = {
    'Authorization': token,
    'Content-Type': Content_Type,
    'lang': 'en',
  };
  return dio.post(Url, data: data);
}
  static Future<Response> getData({required String url}) async {
    dio.options.headers = {'apikey': API_key};
    try {
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
