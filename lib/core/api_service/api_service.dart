import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.pexels.com/v1/')
abstract class ApiService {
  factory ApiService() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.pexels.com/v1/',
      headers: getHeaders(), // define below
    ));
    return _ApiService(dio);
  }

  @GET("{endPoint}")
  Future<dynamic> getRequest(
      @Path("endPoint") String endPoint,
      @Queries() Map<String, dynamic>? queryParams,
      );
}

Map<String, String> getHeaders() {
  return {
    'Authorization': 'LHCXie33Q67d5HBQLEuiB9Hc05zwf2AvU4EQgonSPROI4LDSEzZAOPzQ',
    'Accept': 'application/json',
  };
}