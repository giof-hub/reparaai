import 'package:core/core.dart';
import '../work_datasource.dart';
import 'dart:convert';

class WorkDatasourceImpl implements WorkDatasource {
  
  @override
  Future<DataModel> listWorks() async {
    Map headers = {
      'Content-Type': 'application/json'
    };

    await Future.delayed(Duration(seconds: 1));

    return RemoteDataSourceModel<List<dynamic>>(
      body: getMockListWork(),
      headers: headers,
      status: 200,
    );
  }

  List<dynamic> getMockListWork() {
    String jsonString = '''
      [{"name": "Encanador","pathImage": "assets/eletricista.png"}, {"name": "Eletricista","pathImage": "assets/encanador.png"}]
    ''';

    return json.decode(jsonString);
  }
}
