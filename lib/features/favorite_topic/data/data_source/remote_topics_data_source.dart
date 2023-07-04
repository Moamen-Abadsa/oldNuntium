import 'package:nuntium/core/network/firestore.dart';
import 'package:nuntium/features/favorite_topic/data/response/topics_response.dart';

abstract class RemoteTopicsDataSource {
  Future<TopicsResopnse> topics();
}

class RemoteTopicsDataSourceImplement implements RemoteTopicsDataSource {

  @override
  Future<TopicsResopnse> topics() async {
    return TopicsResopnse(
      topics: (await topicsCollection.get()),
    );
  }
}
