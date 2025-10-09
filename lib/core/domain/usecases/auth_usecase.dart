import 'package:reparaai/core/domain/entities/auth_entity.dart';

abstract class AuthUsecase {
  Future<void> authenticate(AuthEntity auth);

  Future<bool> isAuthenticated();
}
