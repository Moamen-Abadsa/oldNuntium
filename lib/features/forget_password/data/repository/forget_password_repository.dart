import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';

import 'package:nuntium/core/error_handler/response_code.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/forget_password/data/data_source/remote_forget_password_data_source.dart';
import 'package:nuntium/features/forget_password/data/request/forget_password_request.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, void>> forgetPassword(ForgetPasswordRequest forgetPasswordRequest);
}

class ForgetPasswordRepositoryImplement implements ForgetPasswordRepository {
  final RemoteForgetPasswordDataSource _remoteForgetPasswordDataSource;
  final NetworkInfo _networkInfo;

  ForgetPasswordRepositoryImplement(
    this._remoteForgetPasswordDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, void>> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteForgetPasswordDataSource.forgetPassword(forgetPasswordRequest);
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }

      return const Right(null);
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ManagerStrings.noInternetConnection,
        ),
      );
    }
  }
}
