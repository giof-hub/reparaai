import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/core/presentation/widgets/appbar.dart';
import 'package:reparaai/features/search/presentation/controllers/search_controller.dart';
import 'package:reparaai/features/search/presentation/widgets/search_card.dart';
import 'package:reparaai/features/search/presentation/widgets/search_works.dart';

class SearchPage extends StatefulWidget {
  static const String nameRoute = "search";

  final SearchReparaiController controller;

  const SearchPage({required this.controller, super.key});

  @override
  _searchPageState createState() => _searchPageState(controller);
}

class _searchPageState
    extends BasePageState<SearchPage, SearchReparaiController> {
  final TextEditingController _searchController = TextEditingController();

  _searchPageState(super.controller);

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(8.0),
            child: Column(
              children: <Widget>[
                CardSearch(),
                Padding(padding: EdgeInsetsGeometry.only(top: 10)),
                Observer(
                  builder: (context) {
                    return SearchWorks(entity: controller.services ?? []);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
