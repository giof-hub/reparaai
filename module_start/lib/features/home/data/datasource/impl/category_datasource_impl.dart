import 'package:flutter/services.dart';
import 'package:core/core.dart';
import '../category_datasource.dart';
import 'dart:convert';

class CategoryDatasourceImpl implements CategoryDatasource {
  @override
  Future<DataModel> listCategories() async {
    Map headers = {'Content-Type': 'application/json'};

    await Future.delayed(Duration(seconds: 1));

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
