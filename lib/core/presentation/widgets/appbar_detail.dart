import 'package:flutter/material.dart';

class AppBarWidgetDetail extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const AppBarWidgetDetail({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[400],
      foregroundColor: Colors.black,
      title: Row(
        children: [
          Title(
            color: Colors.black,
            child: Text(title, style: TextStyle(fontSize: 16),),
          ),
        ],
      ),
    );
  }
}
