import 'package:dartz/dartz.dart';
import 'package:nuntium/core/error_handler/error_handler.dart';
import 'package:nuntium/core/use_case/base_usecase.dart';
import 'package:nuntium/features/auth/data/request/register_request.dart';
import 'package:nuntium/features/auth/data/repository/register_repository.dart';

class RegisterUseCaseInput {
  String? name;
  String? email;
  String? password;
  String? confirmationPassword;

  RegisterUseCaseInput({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmationPassword,
  });
}

class RegisterUseCase implements BaseInUseCase<RegisterUseCaseInput> {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  @override
  Future<Either<Failure, void>> execute(RegisterUseCaseInput input) async {
    return await _registerRepository.register(
      RegisterRequest(
        name: input.name,
        email: input.email,
        password: input.password,
        confirmationPassword: input.confirmationPassword,
      ),
    );
  }
}
