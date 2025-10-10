import 'package:flutter/material.dart';

class SearchDetailCard extends StatelessWidget {
  final String pathName;
  final String name;

  const SearchDetailCard({required this.pathName, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(pathName, fit: BoxFit.cover, width: double.infinity),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
