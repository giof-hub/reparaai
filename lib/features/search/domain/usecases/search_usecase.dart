import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';

abstract class ServiceUsecase {
  Future<ResponseApp<Exception, List<ServiceEntity>>> listService();
}
