// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) =>
    ArticleResponse(
      author: json['author'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
      imageUrl: json['urlToImage'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'author': instance.author,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
      'urlToImage': instance.imageUrl,
      'url': instance.url,
      'description': instance.description,
      'title': instance.title,
    };
