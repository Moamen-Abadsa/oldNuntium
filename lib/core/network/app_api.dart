import 'package:dio/dio.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/config/request_constants.dart';
import 'package:nuntium/features/home/data/response/home_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(
    Dio dio, {
    String baseUrl,
  }) = _AppApi;

  @POST(RequestConstants.home)
  Future<HomeResopnse> home(
    @Field(ApiConstants.page) int? page,
    @Field(ApiConstants.pageSize) int? pageSize,
  );
}
