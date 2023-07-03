import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nuntium/features/auth/data/request/login_request.dart';

abstract class RemoteLoginDataSource {
  Future<void> login(LoginRequest loginRequest);
}

class RemoteLoginDataSourceImplement implements RemoteLoginDataSource {
  @override
  Future<void> login(LoginRequest loginRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email!,
        password: loginRequest.password!,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }
}
