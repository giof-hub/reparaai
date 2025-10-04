import 'package:flutter/material.dart';

class CardSearch extends StatelessWidget {
  const CardSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 360,
      height: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF0075B1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aproveite todos os benefícios onde onde você estiver.',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF0075B1),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    textStyle: TextStyle(fontSize: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Ver planos'),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/banner_guy.png',
              width: 95,
              height: 95,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
