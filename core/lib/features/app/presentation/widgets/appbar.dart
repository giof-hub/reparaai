import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController _searchController = TextEditingController();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Row(
        children: [
          Expanded(
            child: TextField(
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
          Icon(Icons.notifications_outlined, color: Colors.black),
        ],
      ),
    );
  }
}
