import 'package:dio/dio.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/config/request_constants.dart';
import 'package:nuntium/features/auth/data/response/register_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(
    Dio dio, {
    String baseUrl,
  }) = _AppApi;
  // @POST(RequestConstants.loginRequest)
  // Future<LoginResponse> login(@Field(RequestConstants.email) String email,
  //     @Field(RequestConstants.password) String password);


}
