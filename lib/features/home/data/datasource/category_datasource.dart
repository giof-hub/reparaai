import 'package:reparaai/core/data/models/data_model.dart';

abstract class CategoryDatasource {
  Future<DataModel> listCategories();
}
