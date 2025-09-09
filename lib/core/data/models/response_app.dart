import 'package:reparaai/core/exceptions/untreated_error_exception.dart';

abstract class ResponseApp<E, T> {
  bool isSuccess();

  E? getError();

  T? getResult();

  void process({required Function(T?) result, required Function(E?) error});

  bool hasResult() {
    var result = getResult();

    bool isNull = result == null;

    bool isList = result is List;

    if (!isNull && isList) {
      return result.isEmpty;
    }

    return !isNull;
  }

  bool isUntreated() {
    var error = getError();

    return error is UntreatedErrorException;
  }


}
