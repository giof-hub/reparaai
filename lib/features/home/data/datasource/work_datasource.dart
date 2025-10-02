import 'package:reparaai/core/data/models/data_model.dart';

abstract class WorkDatasource {
  
  Future<DataModel> listWorks();
}
