import 'package:nuntium/core/network/app_api.dart';

import '../response/home_response.dart';

abstract class RemoteHomeDataSource {
  Future<HomeResopnse> home();
}

class RemoteHomeDataSourceImplement implements RemoteHomeDataSource {
  final AppApi _appApi;

  RemoteHomeDataSourceImplement(
    this._appApi,
  );
  @override
  Future<HomeResopnse> home() async {
    return await _appApi.home();
  }
}
