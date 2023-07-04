import 'package:firebase_auth/firebase_auth.dart';
import 'package:nuntium/features/auth/data/request/login_request.dart';
import 'package:nuntium/features/auth/data/response/login_response.dart';

abstract class RemoteLoginDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class RemoteLoginDataSourceImplement implements RemoteLoginDataSource {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return LoginResponse(
      userCredential: await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email!,
        password: loginRequest.password!,
      ),
    );
  }
}
