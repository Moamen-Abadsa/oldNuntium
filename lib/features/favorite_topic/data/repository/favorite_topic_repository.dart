import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/error_handler/response_code.dart';

import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/favorite_topic/data/data_source/local_favorite_topic_data_source.dart';

abstract class FavoriteTopicRepository {
  Future<Either<Failure, void>> selectFavoriteTopic();
}

class FavoriteTopicRepositoryImplement implements FavoriteTopicRepository {
  final LocalFavoriteTopicDataSource _remoteFavoriteTopicDataSource;
  final NetworkInfo _networkInfo;

  FavoriteTopicRepositoryImplement(
    this._remoteFavoriteTopicDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, void>> selectFavoriteTopic(
      // SelectFavoriteTopicRequest selectFavoriteTopicRequest,
      ) async {
    return Left(
      Failure(
        ResponseCode.NO_INTERNET_CONNECTION.value,
        ManagerStrings.noInternetConnection,
      ),
    );
    //   if (await _networkInfo.isConnected) {
    //     await _remoteFavoriteTopicDataSource.selectFavoriteTopic(
    //       SelectFavoriteTopicRequest(),
    //     );
    //     return const Right(null);
    //   } else {
    //     return Left(
    //       Failure(
    //         ResponseCode.NO_INTERNET_CONNECTION.value,
    //         ManagerStrings.noInternetConnection,
    //       ),
    //     );
    // }
  }
}
