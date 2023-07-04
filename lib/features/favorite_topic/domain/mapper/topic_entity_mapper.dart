import 'package:nuntium/features/favorite_topic/domain/entity/topic_entity.dart';
import 'package:nuntium/features/favorite_topic/presentation/models/topic.dart';

extension TopicEntityMapper on TopicEntity {
  Topic toPresentation() {
    return Topic(name: name);
  }
}
