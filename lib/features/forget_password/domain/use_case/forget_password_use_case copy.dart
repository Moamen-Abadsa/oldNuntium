import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';
import 'package:nuntium/features/forget_password/data/repository/forget_password_repository%20copy.dart';
import 'package:nuntium/features/forget_password/data/request/forget_password_request.dart';

class ForgetPasswordUseCaseInput {
  String email;

  ForgetPasswordUseCaseInput({
    required this.email,
  });
}

class ForgetPasswordUseCase implements BaseInUseCase<ForgetPasswordUseCaseInput> {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ForgetPasswordUseCase(this._forgetPasswordRepository);

  @override
  Future<Either<Failure, void>> execute(ForgetPasswordUseCaseInput input) async {
    return await _forgetPasswordRepository.forgetPassword(
      ForgetPasswordRequest(
        email: input.email,
      ),
    );
  }
}
