import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';

import 'package:nuntium/core/error_handler/response_code.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/favorite_topic/data/data_source/remote_topics_data_source.dart';
import 'package:nuntium/features/favorite_topic/data/mapper/topics_response_mapper.dart';
import 'package:nuntium/features/favorite_topic/domain/entity/topics_entites.dart';

abstract class TopicsRepository {
  Future<Either<Failure, TopicsEntity>> topics();
}

class TopicsRepositoryImplement implements TopicsRepository {
  final RemoteTopicsDataSource _remoteTopicsDataSource;
  final NetworkInfo _networkInfo;

  TopicsRepositoryImplement(
    this._remoteTopicsDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, TopicsEntity>> topics() async {
    if (await _networkInfo.isConnected) {
      final topics = await _remoteTopicsDataSource.topics();
      return Right(topics.toDomain());

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
