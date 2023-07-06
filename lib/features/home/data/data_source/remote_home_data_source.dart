import 'package:nuntium/core/network/app_api.dart';

import '../request/home_request.dart';
import '../response/home_response.dart';

abstract class RemoteHomeDataSource {
  Future<HomeResopnse> home(HomeRequest homeRequest);
}

class RemoteHomeDataSourceImplement implements RemoteHomeDataSource {
  final AppApi _appApi;

  RemoteHomeDataSourceImplement(
    this._appApi,
  );
  @override
  Future<HomeResopnse> home(HomeRequest homeRequest) async {
    return await _appApi.home(
      homeRequest.page,
      homeRequest.pageSize,
      homeRequest.country,
      homeRequest.category,
      homeRequest.sources,
      homeRequest.search,
    );
  }
}
