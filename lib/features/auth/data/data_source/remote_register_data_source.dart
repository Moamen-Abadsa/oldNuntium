import 'package:nuntium/core/network/app_api.dart';
import 'package:nuntium/features/auth/data/request/register_request.dart';
import 'package:nuntium/features/auth/data/response/register_response.dart';

abstract class RemoteRegisterDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}

class RemoteRegisterDataSourceImplement implements RemoteRegisterDataSource {
  final AppApi _appApi;

  RemoteRegisterDataSourceImplement(this._appApi);

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _appApi.register(
      registerRequest.name,
      registerRequest.email,
      registerRequest.password,
      registerRequest.confirmationPassword,
    );
  }
}
