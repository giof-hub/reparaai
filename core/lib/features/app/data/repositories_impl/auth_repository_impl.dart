import 'package:core/features/app/domain/repositories/auth_repository.dart';
import 'package:core/features/app/domain/repositories/jwt_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final JwtRepository jwtRepository;

  AuthRepositoryImpl(this.jwtRepository);

  @override
  Future<bool> isAuthenticated() async {
    var token = await jwtRepository.getToken('token');

    return jwtRepository.isValidToken(token ?? "");
  }
}
