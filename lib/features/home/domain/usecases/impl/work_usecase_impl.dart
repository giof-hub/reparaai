import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/features/home/domain/entities/work_entity.dart';
import 'package:reparaai/features/home/domain/repositories/work_repository.dart';
import 'package:reparaai/features/home/domain/usecases/work_usecase.dart';

class WorkUsecaseImpl implements WorkUseCase {
  final WorkRepository _repository;

  WorkUsecaseImpl(this._repository);

  @override
  Future<ResponseApp<Exception, List<WorkEntity>>> listWorks() {
    return _repository.listWorks();
  }
}
