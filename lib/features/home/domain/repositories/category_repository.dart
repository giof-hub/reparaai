import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/features/home/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<ResponseApp<Exception, List<CategoryEntity>>> listCategories();
}
