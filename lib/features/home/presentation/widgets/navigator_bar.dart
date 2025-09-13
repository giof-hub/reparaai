import 'package:flutter/material.dart';
import 'package:reparaai/features/home/presentation/controllers/home_controller.dart';

class NavigatorBar extends StatelessWidget {
  final HomeController controller;

  const NavigatorBar(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) {
        controller.setCurrentIndex(index);
      },
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Buscar'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}
