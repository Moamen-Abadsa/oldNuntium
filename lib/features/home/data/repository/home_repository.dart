import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';

import 'package:nuntium/core/error_handler/response_code.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/home/data/mapper/home_response_mapper.dart';

import '../../domain/entity/home_entity.dart';
import '../data_source/remote_home_data_source.dart';
import '../request/home_request.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> home(HomeRequest homeRequest);
}

class HomeRepositoryImplement implements HomeRepository {
  final RemoteHomeDataSource _remoteHomeDataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImplement(
    this._remoteHomeDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, HomeEntity>> home(HomeRequest homeRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final home = await _remoteHomeDataSource.home(homeRequest);
        return Right(home.toDomain());
      } on Exception catch (e) {
        e.printError();
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
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
