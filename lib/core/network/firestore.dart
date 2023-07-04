import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuntium/config/constants.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
final topicsCollection = firestore.collection(FirestoreConstants.topics);
