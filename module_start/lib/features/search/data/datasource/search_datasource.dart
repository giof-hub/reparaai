import 'package:core/features/app/data/models/data_model.dart';

abstract class SearchDatasource {
  
  Future<DataModel> listService();
}
