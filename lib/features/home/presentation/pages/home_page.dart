import 'package:flutter/material.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/core/presentation/widgets/appbar.dart';
import 'package:reparaai/features/home/domain/entities/category_entity.dart';
import 'package:reparaai/features/home/presentation/controllers/home_controller.dart';
import 'package:reparaai/features/home/presentation/widgets/card_button.dart';

import 'package:reparaai/features/home/presentation/widgets/card_home.dart';
import 'package:reparaai/features/home/presentation/widgets/navigator_bar.dart';
import 'package:reparaai/features/home/presentation/widgets/service_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reparaai/features/home/presentation/widgets/service_card.dart';

class HomePage extends StatefulWidget {
  static const String nameRoute = "home";

  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  _HomePageState createState() => _HomePageState(controller, true);
}

class _HomePageState extends BasePageState<HomePage, HomeController> {
  final TextEditingController _searchController = TextEditingController();

  _HomePageState(super.controller, super.hasAuthenticate);

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                cardHome(),
                Padding(padding: EdgeInsets.only(top: 20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(4)),
                      ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          CategoryEntity category = CategoryEntity.empty();
                          return ServiceButton(
                            icon: IconData(int.parse(category.icon), fontFamily: 'MaterialIcons'),
                            label: category.label,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CardButton(action: () => controller.signIn()),
                ),
                Observer(
                  builder: (context) {
                    return ServiceCard(works: controller.works ?? []);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (context) {
          return NavigatorBar(widget.controller);
        },
      ),
    );
  }
}
