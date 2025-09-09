import 'package:reparaai/core/extensions/map_extensions.dart';

class ItemMenuNavigationEntity {
  String nomeMenu;
  String urlMenu;
  bool? menuSeguro;
  String? identificadorMenuSeguro;

  ItemMenuNavigationEntity({
    required this.nomeMenu,
    required this.urlMenu,
    this.menuSeguro,
    this.identificadorMenuSeguro,
  });

  bool get isRotaFlutter => urlMenu.trim().startsWith("reparaai://module_flutter") && urlMenu.contains("route=");

  String? getPathFlutter() {
    if (isRotaFlutter) {
      Uri uriRota = Uri.parse(urlMenu);
      var rota = uriRota.queryParameters.getValueOrDefault(key: "route", def: "");
      return rota;
    }
    return null;
  }
}
