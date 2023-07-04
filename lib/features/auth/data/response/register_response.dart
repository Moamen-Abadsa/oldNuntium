import 'package:firebase_auth/firebase_auth.dart';

class RegisterResponse {
  UserCredential userCredential;
  
  RegisterResponse({
    required this.userCredential,
  });
}
