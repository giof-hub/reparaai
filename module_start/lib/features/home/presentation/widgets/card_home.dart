import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:module_design_system/gen/assets.dart';
import 'package:module_start/features/home/presentation/widgets/container_action_protection_widget.dart';

class CardHome extends StatelessWidget {
  final String description;
  final Image? image;
  final void Function()? action;

  const CardHome({super.key,
    required this.description,
    this.image,
    this.action
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        height: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF0076BA),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Texto
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ContainerActionProtectionWidget(),
                            SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Color(0xFF0076BA),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0,
                                ),
                                textStyle: const TextStyle(fontSize: 11),
                              ),
                              child: const Text('Ver agora'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Imagem
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(0),
                    width: 101,
                    child: Assets.images.womanBanner.toImage(fit: BoxFit.fill),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
