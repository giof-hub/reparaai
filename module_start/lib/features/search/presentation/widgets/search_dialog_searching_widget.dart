import 'package:core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:module_design_system/gen/assets.dart';

class SearchDialogSearchingWidget extends StatelessWidget {
  const SearchDialogSearchingWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue.shade900, width: 2),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 60, color: Color(0xFF007EC6)),
                      SizedBox(height: 20, width: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Buscando',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF007EC6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Assets.animations.dots.toAnimationLottie(width: 40, height: 20),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.search),
      label: Text("Procurar"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
