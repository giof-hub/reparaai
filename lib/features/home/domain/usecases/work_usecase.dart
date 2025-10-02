import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/features/home/domain/entities/work_entity.dart';

abstract class WorkUseCase {
  Future<ResponseApp<Exception, List<WorkEntity>>> listWorks();
}
