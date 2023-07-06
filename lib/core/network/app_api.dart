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

  @GET(RequestConstants.home)
  Future<HomeResopnse> home(
    @Query(ApiConstants.page) int? page,
    @Query(ApiConstants.pageSize) int? pageSize,
    @Query(ApiConstants.country) String? country,
    @Query(ApiConstants.category) String? category,
    @Query(ApiConstants.sources) String? sources,
    @Query(ApiConstants.search) String? search,
  );
}
