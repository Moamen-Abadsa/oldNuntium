import 'package:firebase_auth/firebase_auth.dart';
import 'package:nuntium/features/auth/data/request/register_request.dart';

import '../response/register_response.dart';

abstract class RemoteRegisterDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
}

class RemoteRegisterDataSourceImplement implements RemoteRegisterDataSource {
  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return RegisterResponse(
      userCredential: await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerRequest.email!,
        password: registerRequest.password!,
      ),
    );
  }
}
