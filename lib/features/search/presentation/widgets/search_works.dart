import 'package:flutter/material.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';

class SearchWorks extends StatelessWidget {
  const SearchWorks({super.key, required this.entity});

  final List<ServiceEntity> entity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entity.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        ServiceEntity work = entity[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  work.pathName,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          work.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        ...getReviews(work),
                        Text("${work.avaliation}"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      work.description,
                      style: const TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.info_outline),
                          label: const Text("Ver mais"),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.chat),
                          label: const Text("Chat"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  List<Widget> getReviews(ServiceEntity work) {
    List<Widget> reviews = [];

    double meiaEstrela = 0;
    int estrelaCompleta = 0;

    for (double i = 0.5; i < 5.5; i = i + 0.5) {
      if (i <= work.avaliation) {
        meiaEstrela += 0.5;

        if (meiaEstrela >= 1) {
          estrelaCompleta += 1;
          meiaEstrela -= 1;
        }
      }
    }

    for (double i = 0; i < 5; i++) {
      if (estrelaCompleta > 0) {
        reviews.add(Icon(Icons.star, color: Colors.amber, size: 16));
        estrelaCompleta--;
      } else if (meiaEstrela > 0) {
        reviews.add(
          Icon(Icons.star_half_outlined, color: Colors.amber, size: 16),
        );

        meiaEstrela -= 0.5;
      } else {
        reviews.add(
          Icon(Icons.star_border_outlined, color: Colors.amber, size: 16),
        );
      }
    }

    return reviews;
  }
}
