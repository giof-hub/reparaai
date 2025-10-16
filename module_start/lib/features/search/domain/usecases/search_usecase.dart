import 'package:core/features/app/data/models/response_app.dart';
import 'package:module_start/features/search/domain/entities/search_entity.dart';

abstract class SearchUseCase {
  Future<ResponseApp<Exception, List<SearchEntity>>> listService();
}
