import 'package:json_annotation/json_annotation.dart';

import 'package:nuntium/config/constants.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  @JsonKey(name: ApiConstants.author)
  String? author;

  @JsonKey(name: ApiConstants.publishedAt)
  String? publishedAt;

  @JsonKey(name: ApiConstants.content)
  String? content;

  @JsonKey(name: ApiConstants.urlToImage)
  String? imageUrl;

  @JsonKey(name: ApiConstants.url)
  String? url;

  @JsonKey(name: ApiConstants.description)
  String? description;

  @JsonKey(name: ApiConstants.title)
  String? title;

  ArticleResponse({
    required this.author,
    required this.publishedAt,
    required this.content,
    required this.imageUrl,
    required this.url,
    required this.description,
    required this.title,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
