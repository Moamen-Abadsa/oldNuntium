import 'package:json_annotation/json_annotation.dart';
import 'package:nuntium/config/constants.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: ApiConstants.message)
  String? message;
}
