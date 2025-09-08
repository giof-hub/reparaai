import 'dart:convert';

import 'package:reparaai/app/item_navigation.dart';
import 'package:reparaai/config/resolver.dart';
import 'package:reparaai/config/routes.dart';

class Provider {
  List<ItemNavigation> get _listFeaturesWithParam => [];

  Set<ItemNavigation> get listFeatures {
    var fullListFeatures = Routes.values.map((route) {
      return ItemNavigation(
        name: "${route.nameFeature} / ${route.name}",
        route: route.getPath(),
      );
    }).toList();

    fullListFeatures.removeWhere((f) => _listFeaturesWithParam.contains(f));
    fullListFeatures.addAll(_listFeaturesWithParam);

    return fullListFeatures.toSet();
  }

  String get argsInit {
    final list = listFeatures.map((feature) => feature.toJson()).toList();

    return jsonEncode({"listFeatures": list, "idModule": Resolver.idModule});
  }
}
