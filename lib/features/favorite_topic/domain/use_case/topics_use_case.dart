import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';
import 'package:nuntium/features/favorite_topic/data/repository/topics_repository.dart';
import 'package:nuntium/features/favorite_topic/domain/entity/topics_entites.dart';


class TopicsUseCase implements BaseOutUseCase<TopicsEntity> {
  final TopicsRepository _topicsRepository;

  TopicsUseCase(this._topicsRepository);

  @override
  Future<Either<Failure, TopicsEntity>> execute() async {
    return await _topicsRepository.topics();
  }
}
