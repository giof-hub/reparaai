import 'package:core/features/app/domain/entities/enums/abstract_enum.dart';

enum DocumentTypeEnum implements AbstractEnum {
  RG(code: 1, description: 'Carteira de identidade (RG)', path: 'assets/rg.png'),
  CNH(code: 2, description: 'Carteira de motorista (CNH)', path: 'assets/cnh.png');

  final int code;
  final String description;
  final String path;

  const DocumentTypeEnum({
    required this.code,
    required this.description,
    required this.path
  });
}