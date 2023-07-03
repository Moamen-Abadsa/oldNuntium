import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

abstract class BaseInUseCase<In> {
  FutureOr<void> execute(In input);
}
