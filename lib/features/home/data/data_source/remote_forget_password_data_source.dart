import 'package:firebase_auth/firebase_auth.dart';
import 'package:nuntium/features/forget_password/data/request/forget_password_request.dart';

abstract class RemoteForgetPasswordDataSource {
  Future<void> forgetPassword(ForgetPasswordRequest forgetPasswordRequest);
}

class RemoteForgetPasswordDataSourceImplement implements RemoteForgetPasswordDataSource {
  @override
  Future<void> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: forgetPasswordRequest.email!,
    );
  }
}
