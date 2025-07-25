import 'package:dio/dio.dart';
import 'package:gallery_app/core/api_service/api_constance.dart';

abstract class ApiService {
  static Dio dio = Dio(BaseOptions(baseUrl: ApiConstance.baseUrl));

  static Map<String, String> getHeaders()  {
    return {
      "Authorization":
          "LHCXie33Q67d5HBQLEuiB9Hc05zwf2AvU4EQgonSPROI4LDSEzZAOPzQ",
    };
  }

  static Future get(String endPoint, {Map<String, dynamic>? data}) async {
    var response = await dio.get(
      endPoint,
      queryParameters: data,
      options: Options(headers: getHeaders()),
    );
    return response.data;
  }
}
