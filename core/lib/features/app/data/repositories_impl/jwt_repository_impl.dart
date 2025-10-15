import 'package:libraries/libraries.dart';
import 'package:core/features/app/domain/repositories/jwt_repository.dart';

class JwtRepositoryImpl implements JwtRepository {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<void> saveToken(String key, String token) async {
    await _storage.write(key: key, value: token);
  }

  @override
  Future<String?> getToken(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> deleteToken(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<bool> isValidToken(String token) async {
    final parts = token.split('.');
    if (parts.length != 3) {
      return false;
    }

    return Jwt.isExpired(token);
  }
}
