import 'package:reparaai/core/data/models/data_model.dart';
import 'package:reparaai/core/data/models/remote_data_source_model.dart';
import 'dart:convert';

import 'package:reparaai/features/search/data/datasource/search_datasource.dart';

class ServiceDatasourceImpl implements ServiceDatasource {
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
        {"name": "Conserto de Eletrodomésticos", "pathImage": "assets/eletrodomestico.png", "avaliation": 4.5, "description": ["Reparos em todos os equipamentos residencial", "TESTE"]},
        {"name": "Chaveiro", "pathImage": "assets/chaveiro.png", "avaliation": 3.5, "description": ["Arrumo/abro qualquer tipo de coisa"]},
        {"name": "mercenaria", "pathImage": "assets/mercenaria.png", "avaliation": 5, "description": ["Faço qualquer tipo de moveis"]}
      ]
    ''';

    return json.decode(jsonString);
  }
}
