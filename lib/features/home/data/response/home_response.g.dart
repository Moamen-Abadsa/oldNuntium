// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResopnse _$HomeResopnseFromJson(Map<String, dynamic> json) => HomeResopnse(
      status: SourceResponse.fromJson(json['status'] as Map<String, dynamic>),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] as String,
    );

Map<String, dynamic> _$HomeResopnseToJson(HomeResopnse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'source': instance.source,
      'articles': instance.articles,
    };
