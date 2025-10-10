import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/core/domain/entities/response_entity.dart';
import 'package:reparaai/features/home/data/datasource/category_datasource.dart';
import 'package:reparaai/features/home/data/models/category_mapper.dart';
import 'package:reparaai/features/home/domain/entities/category_entity.dart';
import 'package:reparaai/features/home/domain/repositories/category_repository.dart';

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
