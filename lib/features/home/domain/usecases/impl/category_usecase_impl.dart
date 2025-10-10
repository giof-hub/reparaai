import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/features/home/domain/entities/category_entity.dart';
import 'package:reparaai/features/home/domain/repositories/category_repository.dart';
import 'package:reparaai/features/home/domain/usecases/category_usecase.dart';

class CategoryUsecaseImpl implements CategoryUsecase {
  final CategoryRepository _repository;

  CategoryUsecaseImpl(this._repository);

  @override
  Future<ResponseApp<Exception, List<CategoryEntity>>> listCategories() {
    return _repository.listCategories();
  }
}
