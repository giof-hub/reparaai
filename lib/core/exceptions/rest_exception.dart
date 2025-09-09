class RestException implements Exception {
  final dynamic resultError;
  final int codeResult;
  final String? url;
  final String? messageError;

  RestException({
    required this.resultError,
    required this.codeResult,
    required this.url,
    this.messageError,
  });

  @override
  String toString() {
    return 'RestException: {\n'
        '  resultError: $resultError,\n'
        '  codeResult: $codeResult,\n'
        '  url: $url,\n'
        '  messageError: $messageError\n'
        '}';
  }
}
