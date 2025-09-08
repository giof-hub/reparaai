class SignupEntity {
  String login;
  String password;

  SignupEntity({required this.login, required this.password});

  SignupEntity.empty({this.login = "", this.password = ""});
}
