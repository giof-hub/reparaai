import 'package:reparaai/core/domain/entities/basic_auth_entity.dart';

class AuthEntity {
  BasicAuthEntity? basicAuth;

  bool get isBasic => basicAuth != null;
}