import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/core/domain/entities/response_entity.dart';
import 'package:reparaai/features/home/data/datasource/work_datasource.dart';
import 'package:reparaai/features/home/data/models/work_mapper.dart';
import 'package:reparaai/features/home/domain/entities/work_entity.dart';
import 'package:reparaai/features/home/domain/repositories/work_repository.dart';

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
