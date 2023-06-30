import 'package:nuntium/core/extensions/extensions.dart';
import 'package:nuntium/features/auth/data/response/register_response.dart';
import 'package:nuntium/features/auth/domain/model/register.dart';

extension RegisterMapper on RegisterResponse {
  toDomain() {
    return Register(status: status.onNull());
  }
}
