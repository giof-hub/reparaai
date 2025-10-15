class BasicAuthEntity {
  final String login;
  final String password;

  const BasicAuthEntity({required this.login, required this.password});

  BasicAuthEntity.empty({
    this.login = "",
    this.password = ""
  });
}
