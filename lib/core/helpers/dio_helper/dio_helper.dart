import 'package:dio/dio.dart';
import 'package:we_care/core/strings/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: supabaseurl,
      receiveDataWhenStatusError: true,
      connectTimeout:Duration(
        seconds:  20 * 1000),
      receiveTimeout: Duration(
        seconds:  20 * 1000),
      sendTimeout: Duration(
        seconds:  20 * 1000),
    ));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
 
    String? contentType,
  }) async {
    dio!.options.headers = {
       'apikey':API_key,
      // 'Authorization': 'Bearer $API_key',
      'Content-Type': contentType ?? 'application/json',
    };
    return await dio!.post(supabaseurl+url,data: query);
  }


  
  static Future<Response>getData({
    required String url})async{
        dio!.options.headers = {
       'apikey':API_key,};
     try{
      Response response= await dio!.get(url);
     return response;
     }catch(e){
       rethrow;
     }
    }
}