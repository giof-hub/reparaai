import 'package:core/features/app/data/models/response_app.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<ResponseApp<Exception, List<CategoryEntity>>> listCategories();
}
