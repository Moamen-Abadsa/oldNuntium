import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';
import 'package:nuntium/features/auth/data/request/login_request.dart';
import 'package:nuntium/features/auth/domain/model/login_model.dart';
import 'package:nuntium/features/auth/data/repository/login_repository.dart';

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput({
    required this.email,
    required this.password,
  });
}

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Login> {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<Either<Failure, Login>> execute(LoginUseCaseInput input) async {
    return await _loginRepository.login(
      LoginRequest(
        email: input.email,
        password: input.password,
      ),
    );
  }
}
