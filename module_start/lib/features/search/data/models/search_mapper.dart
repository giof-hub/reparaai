import 'package:core/core.dart';
import 'package:module_start/features/search/domain/entities/search_entity.dart';

class SearchMapper {
  SearchMapper._();

  static SearchEntity fromDataModel(DataModel dataModel) {
    Map<String, dynamic> json = Map();
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    return fromMap(json);
  }

  static List<SearchEntity> fromListaDataModel(DataModel dataModel) {
    List<dynamic> json = [];
    List<SearchEntity> lista = [];
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    for (Map<String, dynamic> item in json) {
      lista.add(fromMap(item));
    }
    return lista;
  }

  static SearchEntity fromMap(Map<String, dynamic> map) {
    String name = map.getValueOrDefault(key: "name", def: "");
    String pathImage = map.getValueOrDefault(key: "pathImage", def: "");
    num avaliation = map.getValueOrDefault(key: "avaliation", def: 0);
    List<String> description = List.from(map.getValueOrDefault(key: "description", def: []));

    return SearchEntity(
      name: name,
      pathName: pathImage,
      avaliation: avaliation,
      description: description,
    );
  }
}
