class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? confirmationPassword;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmationPassword,
  });
}
