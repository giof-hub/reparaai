import 'package:flutter/material.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/features/home/presentation/controllers/home_controller.dart';
import 'package:reparaai/features/home/presentation/widgets/card_button.dart';

import 'package:reparaai/features/home/presentation/widgets/card_home.dart';
import 'package:reparaai/features/home/presentation/widgets/navigator_bar.dart';
import 'package:reparaai/features/home/presentation/widgets/service_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  static const String nameRoute = "home";

  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  _HomePageState createState() => _HomePageState(controller, true);
}

class _HomePageState extends BasePageState<HomePage, HomeController> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> repairs = [
    {'image': 'assets/eletricista.png', 'title': 'Eletricista'},
    {'image': 'assets/encanador.png', 'title': 'Encanador'},
  ];

  _HomePageState(super.controller, super.hasAuthenticate);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Pesquisar...',
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: Colors.black),
          ),
          onSubmitted: (value) {},
        ),
      ),

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
                      ServiceButton(icon: Icons.format_paint, label: 'Pintura'),
                      ServiceButton(icon: Icons.grass, label: 'Jardinagem'),
                      ServiceButton(
                        icon: Icons.build,
                        label: 'Serviços gerais',
                      ),
                      ServiceButton(icon: Icons.handyman, label: 'Carpintaria'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CardButton(action: () => controller.signUp()),
                ),
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: repairs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(repairs[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.black54,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              repairs[index]['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(width: 12),
                  ),
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
