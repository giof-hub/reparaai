class LoginEntity {
  String login;
  String password;

  LoginEntity({required this.login, required this.password});

  LoginEntity.empty({this.login = "", this.password = ""});

  


}
