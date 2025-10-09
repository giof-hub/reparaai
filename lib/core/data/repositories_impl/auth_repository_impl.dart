import 'package:reparaai/core/domain/repositories/auth_repository.dart';
import 'package:reparaai/core/domain/repositories/jwt_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final JwtRepository jwtRepository;

  AuthRepositoryImpl(this.jwtRepository);

  @override
  Future<bool> isAuthenticated() async {
    var token = await jwtRepository.getToken('token');

    return jwtRepository.isValidToken(token ?? "");
  }
}
