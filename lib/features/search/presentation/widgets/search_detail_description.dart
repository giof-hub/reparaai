import 'package:flutter/material.dart';

class SearchDetailDescription extends StatelessWidget {
  final List<String> description;

  const SearchDetailDescription({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Garantia da Reparai',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
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
    );
  }
}
