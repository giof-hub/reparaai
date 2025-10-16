import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:module_design_system/gen/assets.dart';

class SearchDetailCard extends StatelessWidget {
  final String pathName;
  final List<String> description;

  const SearchDetailCard({required this.pathName, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        AssetGenImage(
                          pathName,
                        ).toImage(fit: BoxFit.cover, width: double.infinity),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Garantia da Reparai',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...List.generate(
                    description.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text("• ${description[index]}"),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Ver mais informações"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
