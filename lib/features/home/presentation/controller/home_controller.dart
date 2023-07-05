import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/features/home/domain/mapper/home_entity_mapper.dart';
import 'package:nuntium/features/home/domain/use_case/home_use_case.dart';
import 'package:nuntium/features/home/presentation/model/atricle.dart';

class HomeController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  final HomeUseCase _homeUseCase = instance<HomeUseCase>();

  List<Article> articles = [];

  @override
  void onInit() {
    super.onInit();
    home();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool changeColor({required bool isChecked}) {
    isChecked = !isChecked;
    update();
    return isChecked;
  }

  Future<void> home() async {
    (await _homeUseCase.execute()).fold(
      (l) {
        Get.rawSnackbar(message: l.message);
      },
      (r) {
        articles = r.toPresentation().articles;
      },
    );
  }
}
