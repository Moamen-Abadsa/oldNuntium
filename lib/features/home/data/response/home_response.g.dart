// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResopnse _$HomeResopnseFromJson(Map<String, dynamic> json) => HomeResopnse(
      status: json['status'] as String,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] == null
          ? null
          : SourceResponse.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeResopnseToJson(HomeResopnse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'source': instance.source,
      'articles': instance.articles,
    };
