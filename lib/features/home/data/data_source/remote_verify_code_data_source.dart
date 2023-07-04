import 'package:firebase_auth/firebase_auth.dart';
import 'package:nuntium/features/forget_password/data/request/verify_code_request.dart';

abstract class RemoteVerifyCodeDataSource {
  Future<void> verifyCode(VerifyCodeRequest verifyCodeRequest);
}

class RemoteForgetPasswordDataSourceImplement implements RemoteVerifyCodeDataSource {
  @override
  Future<void> verifyCode(VerifyCodeRequest verifyCodeRequest) async {
    await FirebaseAuth.instance.verifyPasswordResetCode(
      verifyCodeRequest.verificationCode!,
    );
  }
}
