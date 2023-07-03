import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nuntium/features/auth/data/request/register_request.dart';

abstract class RemoteRegisterDataSource {
  Future<void> register(RegisterRequest registerRequest);
}

class RemoteRegisterDataSourceImplement implements RemoteRegisterDataSource {
  @override
  Future<void> register(RegisterRequest registerRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerRequest.email!,
        password: registerRequest.password!,
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
