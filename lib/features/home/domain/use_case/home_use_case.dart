import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';

import '../../data/repository/home_repository.dart';
import '../entity/home_entity.dart';


class HomeUseCase implements BaseOutUseCase<HomeEntity> {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<Either<Failure, HomeEntity>> execute() async {
    return await _homeRepository.home();
  }
}
