import 'package:core/features/app/data/models/response_app.dart';
import '../entities/category_entity.dart';

abstract class CategoryUsecase {
  Future<ResponseApp<Exception, List<CategoryEntity>>> listCategories();
}
