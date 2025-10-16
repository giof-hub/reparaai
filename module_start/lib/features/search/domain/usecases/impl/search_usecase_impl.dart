import 'package:core/features/app/data/models/response_app.dart';
import 'package:module_start/features/search/domain/entities/search_entity.dart';
import 'package:module_start/features/search/domain/repositories/search_repository.dart';
import 'package:module_start/features/search/domain/usecases/search_usecase.dart';

class SearchUsecaseImpl implements SearchUseCase {
  final SearchRepository _repository;

  SearchUsecaseImpl(this._repository);

  @override
  Future<ResponseApp<Exception, List<SearchEntity>>> listService() {
    return _repository.listService();
  }
}
