import 'package:core/features/app/domain/entities/basic_auth_entity.dart';

class AuthEntity {
  BasicAuthEntity? basicAuth;

  bool get isBasic => basicAuth != null;
}