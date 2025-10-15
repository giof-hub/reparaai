import 'package:core/core.dart';
import '../../entities/category_entity.dart';
import '../../repositories/category_repository.dart';
import '../category_usecase.dart';

class CategoryUsecaseImpl implements CategoryUsecase {
  final CategoryRepository _repository;

  CategoryUsecaseImpl(this._repository);

  @override
  Future<ResponseApp<Exception, List<CategoryEntity>>> listCategories() {
    return _repository.listCategories();
  }
}
