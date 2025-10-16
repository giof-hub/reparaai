import 'package:core/core.dart';
import 'package:module_start/features/search/data/datasource/search_datasource.dart';
import 'package:module_start/features/search/domain/entities/search_entity.dart';
import 'package:module_start/features/search/domain/repositories/search_repository.dart';
import 'package:module_start/features/search/data/models/search_mapper.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource _datasource;

  SearchRepositoryImpl(this._datasource);

  @override
  Future<ResponseApp<Exception, List<SearchEntity>>> listService() async {
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
