import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:module_design_system/presentation/widget/app_bar_reparaai.dart';
import 'package:module_start/features/search/domain/entities/search_details_arguments.dart';
import 'package:module_start/features/search/presentation/controllers/search_detail_controller.dart';
import 'package:module_start/features/search/presentation/widgets/search_bottom_widget.dart';
import 'package:module_start/features/search/presentation/widgets/search_detail_card_widget.dart';

class SearchDetailsPage extends StatefulWidget {
  static const String nameRoute = "searchDetails";

  final SearchDetailController controller;

  final SearchDetailsArguments arguments;

  const SearchDetailsPage({required this.controller, required this.arguments});

  @override
  _SearchDetailsPageState createState() =>
      _SearchDetailsPageState(controller, false);
}

class _SearchDetailsPageState
    extends BasePageState<SearchDetailsPage, SearchDetailController> {
  _SearchDetailsPageState(super.controller, super.hasAuthenticate);

  @override
  void initState() {
    super.initState();
    controller.init(widget.arguments);
  }

  @override
  void dispose() {
    super.dispose();
    controller.clean();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReparaai(title: widget.arguments.serviceSelected!.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchDetailCard(
              pathName: widget.arguments.serviceSelected!.pathName,
              description: widget.arguments.serviceSelected!.description,
            ),
            SearchBottom(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
