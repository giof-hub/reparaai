import 'package:flutter/services.dart';
import 'package:reparaai/core/data/models/data_model.dart';
import 'package:reparaai/core/data/models/remote_data_source_model.dart';
import 'package:reparaai/features/home/data/datasource/category_datasource.dart';
import 'dart:convert';

class CategoryDatasourceImpl implements CategoryDatasource {
  @override
  Future<DataModel> listCategories() async {
    Map headers = {'Content-Type': 'application/json'};

    await Future.delayed(Duration(seconds: 5));

    List<dynamic> categories = await getMockListCategories();

    return RemoteDataSourceModel<List<dynamic>>(
      body: categories,
      headers: headers,
      status: 200,
    );
  }

  Future<List<dynamic>> getMockListCategories() async {
    String categories = await rootBundle.loadString('assets/mocks/categories.json');

    return json.decode(categories);
  }
}
