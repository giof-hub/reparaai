import 'package:core/core.dart';
import '../datasource/category_datasource.dart';
import '../models/category_mapper.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource _datasource;

  CategoryRepositoryImpl(this._datasource);

  @override
  Future<ResponseApp<Exception, List<CategoryEntity>>> listCategories() async {
    try {
      var dataRemote = await _datasource.listCategories();

      var categories = CategoryMapper.fromListaDataModel(dataRemote);

      return ResponseEntity.success(result: categories);
    } catch (error) {
      // return ResponseEntity.error(error: error);
      return ResponseEntity.success(result: []);
    }
  }
}
