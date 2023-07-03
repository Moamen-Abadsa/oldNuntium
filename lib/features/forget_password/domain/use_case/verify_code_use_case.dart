import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';
import 'package:nuntium/features/forget_password/data/repository/verify_code_repository.dart';
import 'package:nuntium/features/forget_password/data/request/verify_code_request.dart';

class VerifyCodeUseCaseInput {
  String verificationCode;

  VerifyCodeUseCaseInput({
    required this.verificationCode,
  });
}

class VerifyCodeUseCase implements BaseInUseCase<VerifyCodeUseCaseInput> {
  final VerifyCodeRepository _verifyCodeRepository;

  VerifyCodeUseCase(this._verifyCodeRepository);

  @override
  Future<Either<Failure, void>> execute(VerifyCodeUseCaseInput input) async {
    return await _verifyCodeRepository.verifyCode(
      VerifyCodeRequest(
        verificationCode: input.verificationCode,
      ),
    );
  }
}
