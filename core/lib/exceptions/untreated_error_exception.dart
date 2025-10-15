import 'package:core/exceptions/rest_exception.dart';

class UntreatedErrorException implements Exception {
  dynamic error;
  dynamic exceptionAnterior;
  String? idErro;
  StackTrace? trace;

  UntreatedErrorException({required this.error, this.exceptionAnterior, this.idErro, this.trace});

  String getMensagem() {
    switch (error.runtimeType) {
      case RestException:
        var restError = (error as RestException);
        var msgError = restError.messageError;
        var msgRetorno = "$msgError\nCódigo: $idErro";
        
        return msgRetorno;
    }
    var msgRetorno =
        "Ocorreu um erro inesperado, tente novamente mais tarde.\n"
        "Código: $idErro";
    return msgRetorno;
  }

  @override
  String toString() {
    return 'ErroNaoTratadoException: {\n'
        '  error: $error,\n'
        '  exceptionAnterior: $exceptionAnterior,\n'
        '  idErro: $idErro\n'
        '}';
  }
}