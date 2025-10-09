import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';
import 'package:reparaai/features/search/domain/repositories/search_repository.dart';
import 'package:reparaai/features/search/domain/usecases/search_usecase.dart';

class ServiceUsecaseImpl implements ServiceUsecase {
  final ServiceRepository _repository;

  ServiceUsecaseImpl(this._repository);

  @override
  Future<ResponseApp<Exception, List<ServiceEntity>>> listService() {
    return _repository.listService();
  }
}
