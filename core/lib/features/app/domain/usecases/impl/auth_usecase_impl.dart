import 'package:core/core.dart';

class AuthUsecaseImpl implements AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecaseImpl(this.authRepository);

  @override
  Future<void> authenticate(AuthEntity auth) {
    throw UnimplementedError();
  }

  @override
  Future<bool> isAuthenticated() {
    return authRepository.isAuthenticated();
  }
}
