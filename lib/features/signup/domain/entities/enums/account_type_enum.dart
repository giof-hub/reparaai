enum AccountTypeEnum {
  FISICA(code: 1, description: 'Pessoa Física', document: 'CPF'),
  JURIDICA(code: 2, description: 'Pessoa Jurídica', document: 'CNPJ');

  final int code;
  final String description;
  final String document;

  const AccountTypeEnum({
    required this.code,
    required this.description,
    required this.document
  });
}