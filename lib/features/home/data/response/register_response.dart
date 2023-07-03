import 'package:json_annotation/json_annotation.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/core/base_response/base_response.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends BaseResponse {
  @JsonKey(name: ApiConstants.status)
  bool? status;

  RegisterResponse(this.status);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
