import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';
import 'package:nuntium/features/favorite_topic/data/repository/favorite_topic_repository.dart';

class SelectFavoriteTopicUseCaseInput {
  List<String> topics;

  SelectFavoriteTopicUseCaseInput({required this.topics});
}

class SelectFavoriteTopicUseCase implements BaseInUseCase<SelectFavoriteTopicUseCaseInput> {
  final FavoriteTopicRepository _favoriteTopicRepository;

  SelectFavoriteTopicUseCase(this._favoriteTopicRepository);

  @override
  Future<Either<Failure, void>> execute(
    SelectFavoriteTopicUseCaseInput selectFavoriteTopicUseCaseInput,
  ) async {
    return await _favoriteTopicRepository.selectFavoriteTopic();
  }
}
