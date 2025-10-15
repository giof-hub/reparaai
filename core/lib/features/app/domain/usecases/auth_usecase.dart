import 'package:core/core.dart';

abstract class AuthUsecase {
  Future<void> authenticate(AuthEntity auth);

  Future<bool> isAuthenticated();
}
