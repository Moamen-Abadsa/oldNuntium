import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/features/auth/data/request/register_request.dart';
import 'package:nuntium/features/auth/domain/model/register.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest);
}
