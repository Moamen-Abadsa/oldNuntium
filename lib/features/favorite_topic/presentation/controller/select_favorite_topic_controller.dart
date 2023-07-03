import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/select_favorite_topic_use_case.dart';

class SelectFavoriteTopicController extends GetxController {
  late final _selectFavoriteTopicUseCase = instance<SelectFavoriteTopicUseCase>();

  Future<void> selectFavoriteTopic() async {
    (await _selectFavoriteTopicUseCase.execute(
      SelectFavoriteTopicUseCaseInput(topic: ''),
    ))
        .fold(
      // Todo: حالة الفشل
      (l) => null,
      //Todo: حالة النجاح
      (r) => null,
    );
  }
}
