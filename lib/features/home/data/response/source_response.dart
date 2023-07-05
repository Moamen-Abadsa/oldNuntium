import 'package:json_annotation/json_annotation.dart';

import 'package:nuntium/config/constants.dart';

part 'source_response.g.dart';

@JsonSerializable()
class SourceResponse {
  @JsonKey(name: ApiConstants.id)
  String id;

  @JsonKey(name: ApiConstants.name)
  String name;

  SourceResponse({
    required this.id,
    required this.name,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) => _$SourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}
