import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/features/favorite_topic/domain/mapper/topics_entity_mapper.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/select_favorite_topic_use_case.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/topics_use_case.dart';
import 'package:nuntium/features/favorite_topic/presentation/models/topic.dart';

class CategoriesController extends GetxController {
  late final _selectFavoriteTopicUseCase = instance<SelectFavoriteTopicUseCase>();
  late final _topicsUseCase = instance<TopicsUseCase>();

  List<Topic> topics = [];

  @override
  void onInit() {
    super.onInit();
    fetchTopics();
  }

  Future<void> selectFavoriteTopic() async {
    (await _selectFavoriteTopicUseCase.execute(
      //Todo enter the ids of the selected topics here
      SelectFavoriteTopicUseCaseInput(topics: []),
    ))
        .fold(
      // Todo: حالة الفشل
      (l) => null,
      //Todo: حالة النجاح
      (r) => null,
    );
  }

  Future<void> fetchTopics() async {
    (await _topicsUseCase.execute()).fold(
      // Todo: حالة الفشل
      (l) => null,

      //Todo: حالة النجاح
      (r) => topics = r.toPresentation(),
    );
  }
}
