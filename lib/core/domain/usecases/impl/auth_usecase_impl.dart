import 'package:reparaai/core/domain/entities/auth_entity.dart';
import 'package:reparaai/core/domain/repositories/auth_repository.dart';
import 'package:reparaai/core/domain/usecases/auth_usecase.dart';

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
