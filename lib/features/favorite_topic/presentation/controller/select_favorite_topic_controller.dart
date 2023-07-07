import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/features/favorite_topic/domain/mapper/topics_entity_mapper.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/select_favorite_topic_use_case.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/topics_use_case.dart';
import 'package:nuntium/features/favorite_topic/presentation/models/topic.dart';
import 'package:nuntium/routes/routes.dart';

class SelectFavoriteTopicController extends GetxController {
  late final _selectFavoriteTopicUseCase = instance<SelectFavoriteTopicUseCase>();
  late final _topicsUseCase = instance<TopicsUseCase>();

  List<Topic> topics = [];

  List<Topic> get selectedTopics {
    return topics.where((topic) => topic.isSelected).toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchTopics();
  }

  Future<void> selectFavoriteTopic() async {
    (await _selectFavoriteTopicUseCase.execute(
      SelectFavoriteTopicUseCaseInput(
        topics: selectedTopics.map((e) => e.name).toList(),
      ),
    ))
        .fold(
      (l) => Get.rawSnackbar(message: l.message),
      (r) => Get.toNamed(Routes.mainView),
    );
  }

  Future<void> fetchTopics() async {
    (await _topicsUseCase.execute()).fold(
      (l) => Get.rawSnackbar(message: l.message),
      (r) {
        topics = r.toPresentation();
        update();
      },
    );
  }

  onTopicPressed(int index) {
    topics[index].isSelected = !topics[index].isSelected;

    update();
  }

  void onNextPressed() {
    selectFavoriteTopic();
  }
}
