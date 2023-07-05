import 'package:firebase_auth/firebase_auth.dart';

class LoginResponse {
  UserCredential userCredential;
  
  LoginResponse({
    required this.userCredential,
  });
}
