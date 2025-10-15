import 'package:core/features/app/data/models/response_app.dart';

class ResponseEntity<E, T> extends ResponseApp<E, T> {
  bool success = false;
  E? error;
  T? result;
  dynamic response;

  ResponseEntity.success({required this.result, this.response}) {
    this.success = true;
  }

  ResponseEntity.error({required this.error, this.response}) {
    this.success = false;
  }

  @override
  getError() {
    return error;
  }

  @override
  getResult() {
    return result;
  }

  @override
  bool isSuccess() {
    return success && result != null;
  }

  @override
  void process({required Function(T?) result, required Function(E?) error}) {
    if (getError() != null) {
      error.call(getError());
    }
    if (getResult() != null) {
      result.call(getResult());
    }
  }
}