import 'package:flutter/material.dart';
import 'package:module_start/internationalization/intl_app.dart';

class ContainerActionProtectionWidget extends StatelessWidget {
  const ContainerActionProtectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(IntlApp.current.label_protecao_acao), 
          Icon(Icons.verified, size: 14)],
      ),
    );
  }
}
