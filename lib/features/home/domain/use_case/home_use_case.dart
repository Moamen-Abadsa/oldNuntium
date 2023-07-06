import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';

import '../../data/repository/home_repository.dart';
import '../../data/request/home_request.dart';
import '../entity/home_entity.dart';

class HomeUseCaseInput {
  int? page;
  String? country;
  String? category;
  String? sources;
  String? search;

  HomeUseCaseInput({
    required this.page,
    this.country,
    this.category,
    this.sources,
    this.search,
  });
}

class HomeUseCase implements BaseUseCase<HomeUseCaseInput, HomeEntity> {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<Either<Failure, HomeEntity>> execute(HomeUseCaseInput input) async {
    return await _homeRepository.home(
      HomeRequest(
        page: input.page,
        category: input.category,
        country: input.country,
        search: input.search,
        sources: input.sources,
      ),
    );
  }
}
