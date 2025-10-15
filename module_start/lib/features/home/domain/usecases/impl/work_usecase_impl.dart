import 'package:core/features/app/data/models/response_app.dart';
import '../../entities/work_entity.dart';
import '../../repositories/work_repository.dart';
import '../work_usecase.dart';

class WorkUsecaseImpl implements WorkUseCase {
  final WorkRepository _repository;

  WorkUsecaseImpl(this._repository);

  @override
  Future<ResponseApp<Exception, List<WorkEntity>>> listWorks() {
    return _repository.listWorks();
  }
}
