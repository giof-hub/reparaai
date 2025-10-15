import 'package:core/features/app/data/models/response_app.dart';
import '../entities/work_entity.dart';

abstract class WorkUseCase {
  Future<ResponseApp<Exception, List<WorkEntity>>> listWorks();
}
