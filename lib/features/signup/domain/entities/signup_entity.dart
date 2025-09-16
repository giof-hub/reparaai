class SignupEntity {
  String fullName;
  int accountType;
  String document;
  String email;
  String password;

  SignupEntity({
    required this.fullName, 
    required this.accountType,
    required this.document,
    required this.email,
    required this.password
  });

  SignupEntity.empty({
    this.fullName = "", 
    this.accountType = 0,
    this.document = "",
    this.email = "",
    this.password = ""
  });
}
