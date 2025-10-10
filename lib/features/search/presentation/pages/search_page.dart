import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/core/presentation/widgets/appbar.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';
import 'package:reparaai/features/search/presentation/controllers/search_controller.dart';
import 'package:reparaai/features/search/presentation/widgets/search_card.dart';
import 'package:reparaai/features/search/presentation/widgets/search_works.dart';

class SearchPage extends StatefulWidget {
  static const String nameRoute = "search";

  final SearchReparaiController controller;

  const SearchPage({required this.controller, super.key});

  @override
  _SearchPageState createState() => _SearchPageState(controller, false);
}

class _SearchPageState
    extends BasePageState<SearchPage, SearchReparaiController> {
  final TextEditingController _searchController = TextEditingController();

  _SearchPageState(super.controller, super.hasAuthenticate);

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
    controller.clean();
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
                    // return SearchWorks(
                    //   entity: controller.services ?? [],
                    //   action: () => controller.redirectToSearchDetails(),
                    // );
                    return ListView.builder(
                      itemCount: (controller.services ?? []).length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        List<ServiceEntity> services =
                            controller.services ?? [];
                        return SearchWorks(
                          work: services[index],
                          action: () => controller.redirectToSearchDetails(
                            services[index],
                          ),
                        );
                      },
                    );
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
