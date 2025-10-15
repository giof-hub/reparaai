import 'package:core/features/app/data/models/data_model.dart';

class RemoteDataSourceModel<T> extends DataModel{
  T? body;
  Map headers;
  int status;

  RemoteDataSourceModel({
    this.body,
    required this.headers,
    required this.status,
  });
}
