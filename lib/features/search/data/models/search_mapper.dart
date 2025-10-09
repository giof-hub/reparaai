import 'package:reparaai/core/data/models/data_model.dart';
import 'package:reparaai/core/data/models/remote_data_source_model.dart';
import 'package:reparaai/core/extensions/map_extensions.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';

class SearchMapper {
  SearchMapper._();

  static ServiceEntity fromDataModel(DataModel dataModel) {
    Map<String, dynamic> json = Map();
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    return fromMap(json);
  }

  static List<ServiceEntity> fromListaDataModel(DataModel dataModel) {
    List<dynamic> json = [];
    List<ServiceEntity> lista = [];
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    for (Map<String, dynamic> item in json) {
      lista.add(fromMap(item));
    }
    return lista;
  }

  static ServiceEntity fromMap(Map<String, dynamic> map) {
    String name = map.getValueOrDefault(key: "name", def: "");
    String pathImage = map.getValueOrDefault(key: "pathImage", def: "");
    num avaliation = map.getValueOrDefault(key: "avaliation", def: 0);
    String description = map.getValueOrDefault(key: "description", def: "");

    return ServiceEntity(
      name: name,
      pathName: pathImage,
      avaliation: avaliation,
      description: description
    );
  }
}
