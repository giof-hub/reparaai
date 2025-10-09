import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/core/domain/entities/response_entity.dart';
import 'package:reparaai/features/search/data/datasource/search_datasource.dart';
import 'package:reparaai/features/search/data/models/search_mapper.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';
import 'package:reparaai/features/search/domain/repositories/search_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceDatasource _datasource;

  ServiceRepositoryImpl(this._datasource);

  @override
  Future<ResponseApp<Exception, List<ServiceEntity>>> listService() async {
    try {
      var dataRemote = await _datasource.listService();

      var services = SearchMapper.fromListaDataModel(dataRemote);

      return ResponseEntity.success(result: services);
    } catch (error) {
      // return ResponseEntity.error(error: error);
      return ResponseEntity.success(result: []);
    }
  }
}
