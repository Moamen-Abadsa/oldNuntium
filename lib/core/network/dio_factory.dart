import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nuntium/config/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      ApiConstants.authorization: 'Bearer ${ApiConstants.API_KEY}',
    };
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(seconds: ApiConstants.receiveTimeOutDuration),
      sendTimeout: const Duration(seconds: ApiConstants.sendTimeOutDuration),
    );
    InterceptorsWrapper interceptorsWrapper =
        InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
      return handler.next(options);
    });
    dio.interceptors.add(interceptorsWrapper);
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          requestHeader: true,
        ),
      );
    }
    return dio;
  }
}
