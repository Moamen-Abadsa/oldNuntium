import 'package:nuntium/config/constants.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: Constants.baseURL)
abstract class AppApi {
  // factory AppApi(Dio dio, {String baseUrl}) = _AppApi;
}
