import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/features/auth/data/request/login_request.dart';
import 'package:nuntium/features/auth/domain/model/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}
