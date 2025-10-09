import 'package:flutter/material.dart';
import 'package:reparaai/core/extensions/string_extensions.dart';
import 'package:reparaai/features/signup/domain/entities/enums/document_type_enum.dart';

class RadioSignupOptionWidget extends StatelessWidget {
  final String? imagePath;
  final String description;
  final DocumentTypeEnum value;
  final bool isSelected;

  const RadioSignupOptionWidget({
    super.key,
    this.imagePath,
    required this.description,
    required this.value,
    this.isSelected = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2, color: Color.fromRGBO(0, 65, 115, 1)),
        color: isSelected ? Color.fromRGBO(124, 218, 249, 1) : null
      ),
      child: RadioListTile(
        value: value,
        title: Row(
          children: [
            imagePath != null ? imagePath!.toImage(width: 40, height: 62) : SizedBox.shrink(),
            SizedBox(width: 16),
            Text(description, 
              style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
