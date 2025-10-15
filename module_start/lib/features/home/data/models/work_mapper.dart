import 'package:core/features/app/data/models/data_model.dart';
import 'package:core/features/app/data/models/remote_data_source_model.dart';
import 'package:core/extensions/map_extensions.dart';
import '../../domain/entities/work_entity.dart';

class WorkMapper {
  WorkMapper._();

    static WorkEntity fromDataModel(DataModel dataModel) {
    Map<String, dynamic> json = Map();
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    return fromMap(json);
  }

  static List<WorkEntity> fromListaDataModel(DataModel dataModel) {
    List<dynamic> json = [];
    List<WorkEntity> lista = [];
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    for (Map<String, dynamic> item in json) {
      lista.add(fromMap(item));
    }
    return lista;
  }

  static WorkEntity fromMap(Map<String, dynamic> map) {
    String name = map.getValueOrDefault(key: "name", def: "");
    String pathImage = map.getValueOrDefault(key: "pathImage", def: "");
    
    return WorkEntity(
      name: name,
      pathImage: pathImage 
    );
  }
}
