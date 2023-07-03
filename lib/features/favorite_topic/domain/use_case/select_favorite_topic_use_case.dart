import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';
import 'package:nuntium/features/favorite_topic/data/repository/favorite_topic_repository.dart';
import 'package:nuntium/features/favorite_topic/data/request/favorite_topic_request.dart';

class SelectFavoriteTopicUseCaseInput {
  String topic;

  SelectFavoriteTopicUseCaseInput({
    required this.topic,
  });
}

class SelectFavoriteTopicUseCase implements BaseInUseCase<SelectFavoriteTopicUseCaseInput> {
  final FavoriteTopicRepository _favoriteTopicRepository;

  SelectFavoriteTopicUseCase(this._favoriteTopicRepository);

  @override
  Future<Either<Failure, void>> execute(
    SelectFavoriteTopicUseCaseInput selectFavoriteTopicUseCaseInput,
  ) async {
    return await _favoriteTopicRepository.selectFavoriteTopic(
      SelectFavoriteTopicRequest(),
    );
  }
}
