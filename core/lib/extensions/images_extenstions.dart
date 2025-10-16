import 'package:flutter/widgets.dart';
import 'package:module_design_system/gen/assets.dart';

extension AssetImageExtensions on AssetGenImage {
  Image toImage({double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      AssetImage(keyName, package: 'module_design_system').keyName,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }

}