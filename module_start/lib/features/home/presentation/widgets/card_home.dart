import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:module_design_system/gen/assets.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key});

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
                        children: const [
                          Text(
                            'Construa confiança e economize tempo com a nossa plataforma.',
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
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xFF0076BA),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              textStyle: const TextStyle(fontSize: 11),
                              minimumSize: Size(10, 10),
                            ),
                            icon: const Icon(Icons.verified, size: 14),
                            label: const Text('Proteção em ação'),
                          ),

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
                  child: Assets.images.womanBanner.toImage(
                    fit: BoxFit.fill
                  ),
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
