import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/features/auth/data/request/register_request.dart';

import 'dart:ffi';

import 'package:nuntium/config/constants.dart';
import 'package:nuntium/core/error_handler/response_code.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/features/auth/data/data_source/remote_register_data_source.dart';

abstract class RegisterRepository {
  Future<Either<Failure, void>> register(RegisterRequest registerRequest);
}

class RegisterRepositoryImpl implements RegisterRepository {
  final RemoteRegisterDataSource _dataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, void>> register(RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        await _dataSource.register(registerRequest);
        // ignore: void_checks
        return const Right(Void);
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }
}
