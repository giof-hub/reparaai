import 'package:core/core.dart';
import '../datasource/work_datasource.dart';
import '../models/work_mapper.dart';
import '../../domain/entities/work_entity.dart';
import '../../domain/repositories/work_repository.dart';

class WorkRepositoryImpl implements WorkRepository {
  final WorkDatasource _datasource;

  WorkRepositoryImpl(this._datasource);

  @override
  Future<ResponseApp<Exception, List<WorkEntity>>> listWorks() async {
    try {
      var dataRemote = await _datasource.listWorks();

      var works = WorkMapper.fromListaDataModel(dataRemote);

      return ResponseEntity.success(result: works);
    } catch (error) {
      // return ResponseEntity.error(error: error);
      return ResponseEntity.success(result: []);
    }
  }
}
