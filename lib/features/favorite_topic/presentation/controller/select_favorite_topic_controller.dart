import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/select_favorite_topic_use_case.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/topics_use_case.dart';
import 'package:nuntium/features/favorite_topic/presentation/models/favourite_topic.dart';

class SelectFavoriteTopicController extends GetxController {
  late final _selectFavoriteTopicUseCase =
      instance<SelectFavoriteTopicUseCase>();
  late final _topicsUseCase = instance<TopicsUseCase>();

  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  List<FavouriteTopic> topics = [];

  late final bool sport;
  late final bool gaming;
  late final bool history;
  late final bool politics;
  late final bool nature;
  late final bool life;
  late final bool food;
  late final bool fashion;
  late final bool animals;
  late final bool art;

  Future<void> initializeVars() async {
    sport =
        _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.sports);
    gaming =
        _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.gaming);
    history =
        _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.history);
    nature =
        _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.nature);
    politics =
        _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.politics);
    life = _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.life);
    food = _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.food);
    fashion =
        _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.fashion);
    animals =
        _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.animals);
    art = _appSettingsSharedPreferences.getTopicSelected(ManagerStrings.art);
  }

  Future<void> initializeTopics() async {
    topics.clear();
    topics.addAll([
      FavouriteTopic(name: ManagerStrings.sports, isSelected: sport),
      FavouriteTopic(name: ManagerStrings.gaming, isSelected: gaming),
      FavouriteTopic(name: ManagerStrings.nature, isSelected: nature),
      FavouriteTopic(name: ManagerStrings.history, isSelected: history),
      FavouriteTopic(name: ManagerStrings.politics, isSelected: politics),
      FavouriteTopic(name: ManagerStrings.life, isSelected: life),
      FavouriteTopic(name: ManagerStrings.food, isSelected: food),
      FavouriteTopic(name: ManagerStrings.fashion, isSelected: fashion),
      FavouriteTopic(name: ManagerStrings.animals, isSelected: animals),
      FavouriteTopic(name: ManagerStrings.art, isSelected: art)
    ]);
    update();
  }

  Future<void> selectTopic(String name) async {
    bool isSelected = _appSettingsSharedPreferences.getTopicSelected(name);
    _appSettingsSharedPreferences.setTopicSelected(name, !isSelected);
    await initializeVars();
    await initializeTopics();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await initializeVars();
    await initializeTopics();

    // fetchTopics();
  }

// Future<void> selectFavoriteTopic() async {
//   (await _selectFavoriteTopicUseCase.execute(
//     //Todo enter the ids of the selected topics here
//     SelectFavoriteTopicUseCaseInput(topics: []),
//   ))
//       .fold(
//     // Todo: حالة الفشل
//     (l) => null,
//     //Todo: حالة النجاح
//     (r) => null,
//   );
// }

// Future<void> fetchTopics() async {
//   (await _topicsUseCase.execute()).fold(
//     // Todo: حالة الفشل
//     (l) => null,
//
//     //Todo: حالة النجاح
//     (r) => topics = r.toPresentation(),
//   );
// }
}
