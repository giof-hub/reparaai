import 'package:core/core.dart';
import '../../domain/entities/category_entity.dart';


class CategoryMapper {
  CategoryMapper._();

  static CategoryEntity fromDataModel(DataModel dataModel) {
    Map<String, dynamic> json = Map();
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    return fromMap(json);
  }

  static List<CategoryEntity> fromListaDataModel(DataModel dataModel) {
    List<dynamic> json = [];
    List<CategoryEntity> lista = [];
    if (dataModel is RemoteDataSourceModel) {
      json = dataModel.body;
    }

    for (Map<String, dynamic> item in json) {
      lista.add(fromMap(item));
    }
    return lista;
  }

  static CategoryEntity fromMap(Map<String, dynamic> map) {
    String icon = map.getValueOrDefault(key: "icon", def: "");
    String label = map.getValueOrDefault(key: "label", def: "");

    return CategoryEntity(icon: icon, label: label);
  }
}
