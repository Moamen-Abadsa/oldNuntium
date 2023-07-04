import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';

import 'package:nuntium/core/error_handler/response_code.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/favorite_topic/data/data_source/remote_favorite_topic_data_source.dart';
import 'package:nuntium/features/favorite_topic/data/request/favorite_topic_request.dart';

abstract class FavoriteTopicRepository {
  Future<Either<Failure, void>> selectFavoriteTopic(SelectFavoriteTopicRequest verifyCode);
}

class FavoriteTopicRepositoryImplement implements FavoriteTopicRepository {
  final RemoteFavoriteTopicDataSource _remoteFavoriteTopicDataSource;
  final NetworkInfo _networkInfo;

  FavoriteTopicRepositoryImplement(
    this._remoteFavoriteTopicDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, void>> selectFavoriteTopic(
      SelectFavoriteTopicRequest selectFavoriteTopicRequest) async {
    if (await _networkInfo.isConnected) {
      await _remoteFavoriteTopicDataSource.selectFavoriteTopic(
        SelectFavoriteTopicRequest(),
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
