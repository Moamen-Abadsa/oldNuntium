import 'package:cloud_firestore/cloud_firestore.dart';

class TopicsResopnse {
  QuerySnapshot<Map<String, dynamic>> topics;

  TopicsResopnse({
    required this.topics,
  });
}
