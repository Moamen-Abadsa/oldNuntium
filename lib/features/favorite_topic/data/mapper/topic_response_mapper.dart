import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuntium/features/favorite_topic/domain/entity/topic_entity.dart';

extension TopicResopnseMapper on QueryDocumentSnapshot<Map<String, dynamic>> {
  TopicEntity topicDocToDomain() {
    return TopicEntity(
      name: id,
    );
  }
}
