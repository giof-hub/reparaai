
import 'dart:convert';

import 'package:core/core.dart';
import 'package:module_start/features/search/data/datasource/search_datasource.dart';

class SearchDatasourceImpl implements SearchDatasource {
  @override
  Future<DataModel> listService() async {
    Map headers = {'Content-Type': 'application/json'};

    await Future.delayed(Duration(seconds: 1));

    return RemoteDataSourceModel<List<dynamic>>(
      body: getMockListService(),
      headers: headers,
      status: 200,
    );
  }

  List<dynamic> getMockListService() {
    String jsonString = '''
      [
        {"name": "Conserto de Eletrodomésticos", "pathImage": "assets/images/eletrodomestico.png", "avaliation": 4.5, "description": ["Reparos em todos os equipamentos residencial", "TESTE"]},
        {"name": "Chaveiro", "pathImage": "assets/images/chaveiro.png", "avaliation": 3.5, "description": ["Arrumo/abro qualquer tipo de coisa"]},
        {"name": "mercenaria", "pathImage": "assets/images/mercenaria.png", "avaliation": 5, "description": ["Faço qualquer tipo de moveis"]}
      ]
    ''';

    return json.decode(jsonString);
  }
}
