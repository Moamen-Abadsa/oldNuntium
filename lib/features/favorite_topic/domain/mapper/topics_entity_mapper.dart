import 'package:nuntium/features/favorite_topic/domain/entity/topics_entites.dart';
import 'package:nuntium/features/favorite_topic/domain/mapper/topic_entity_mapper.dart';
import 'package:nuntium/features/favorite_topic/presentation/models/topic.dart';

extension TopicsEntityMapper on TopicsEntity {
  List<Topic> toPresentation() {
    return topics
        .map(
          (topicEntity) =>topicEntity.toPresentation(),
        )
        .toList();
  }
}
