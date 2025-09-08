import 'dart:convert';

class ItemNavigation {
  String name;
  String route;
  Object? args;

  ItemNavigation({required this.name, required this.route, this.args});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'route': route,
      'args':
          args is Map ||
              args is List ||
              args is String ||
              args is num ||
              args is bool ||
              args == null
          ? args
          : args.toString(),
    };
  }

  String toJson() => jsonEncode(toMap());
}
