import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:libraries/libraries.dart';
import '../../domain/entities/category_entity.dart';
import '../controllers/home_controller.dart';
import '../widgets/card_button.dart';

import '../widgets/card_home.dart';
import '../widgets/navigator_bar.dart';
import '../widgets/service_button.dart';
import '../widgets/service_card.dart';

class HomePage extends StatefulWidget {
  static const String nameRoute = "home";

  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  _HomePageState createState() => _HomePageState(controller, false);
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
                Observer(
                  builder: (context) {
                    return ContainerFutureWidget(
                      controller: controller,
                      observer: controller.categoriesFuture,
                      status: controller.categoriesFuture!.status,
                      onResult: (result) {
                        List<CategoryEntity> categories = result;

                        return ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            CategoryEntity category = categories[index];
                            return ServiceButton(
                              icon: IconData(
                                int.parse(category.icon),
                                fontFamily: 'MaterialIcons',
                              ),
                              label: category.label,
                            );
                          },
                        );
                      },
                    );
                  },
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
