import 'package:get/get.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/features/home/domain/mapper/home_entity_mapper.dart';

import '../../domain/use_case/home_use_case.dart';
import '../model/article.dart';

class HomeController extends GetxController {
   final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final HomeUseCase _homeUseCase = instance<HomeUseCase>();

  int page = 1;

  List<Article> articles = [];

  @override
  void onInit() {
    super.onInit();
    home();
  }


  bool changeColor({required bool isChecked}) {
    isChecked = !isChecked;
    update();
    return isChecked;
  }


  Future<void> home() async {
    (await _homeUseCase.execute(
      HomeUseCaseInput(
        page: page,
        pageSize: ApiConstants.homeaPgeSizeValue,
      ),
    ))
        .fold(
      (l) {
        Get.rawSnackbar(message: l.message);
      },
      (r) {
        articles = r.toPresentation().articles;
      },
    );
  }
}
