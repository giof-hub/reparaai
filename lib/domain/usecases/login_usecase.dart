import 'package:reparaai/domain/entities/login_entity.dart';

abstract class LoginUsecase {
  void signin(LoginEntity login);
}
