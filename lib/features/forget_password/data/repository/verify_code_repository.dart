import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';

import 'package:nuntium/core/error_handler/response_code.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/forget_password/data/data_source/remote_forget_password_data_source.dart';
import 'package:nuntium/features/forget_password/data/request/verify_code_request%20copy.dart';

abstract class VerifyCodeRepository {
  Future<Either<Failure, void>> verifyCode(VerifyCodeRequest verifyCode);
}

class VerifyCodeRepositoryImplement implements VerifyCodeRepository {
  final RemoteVerifyCodeDataSource _remoteVerifyCodeDataSource;
  final NetworkInfo _networkInfo;

  VerifyCodeRepositoryImplement(
    this._remoteVerifyCodeDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, void>> verifyCode(VerifyCodeRequest verifyCodeRequest) async {
    if (await _networkInfo.isConnected) {
      await _remoteVerifyCodeDataSource.verifyCode(
        verifyCodeRequest,
      );
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
