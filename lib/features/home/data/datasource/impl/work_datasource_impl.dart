import 'package:reparaai/core/data/models/data_model.dart';
import 'package:reparaai/core/data/models/remote_data_source_model.dart';
import 'package:reparaai/features/home/data/datasource/work_datasource.dart';
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
      [{"name": "Eletricista","pathImage": "assets/eletricista.png"}, {"name": "Eletricista","pathImage": "assets/eletricista.png"}]
    ''';

    return json.decode(jsonString);
  }
}
