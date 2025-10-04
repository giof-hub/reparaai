import 'package:reparaai/core/data/models/data_model.dart';

abstract class ServiceDatasource {
  
  Future<DataModel> listService();
}
