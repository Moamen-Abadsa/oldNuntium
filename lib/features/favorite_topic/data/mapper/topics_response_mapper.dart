import 'package:nuntium/features/favorite_topic/data/mapper/topic_response_mapper.dart';
import 'package:nuntium/features/favorite_topic/data/response/topics_response.dart';
import 'package:nuntium/features/favorite_topic/domain/entity/topics_entites.dart';

extension TopicsResopnseMapper on TopicsResopnse {
  TopicsEntity toDomain() {
    return TopicsEntity(
        topics: topics.docs
            .map(
              (document) => document.topicDocToDomain(),
            )
            .toList());
  }
}
