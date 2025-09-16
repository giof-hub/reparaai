import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

extension StringExtensions on String {
  SvgPicture toSvg({ColorFilter? corFilter, Color? cor, double? width, double? height, BoxFit? fit}) {
    return SvgPicture.asset(
      this,
      colorFilter: corFilter ?? (cor != null ? ui.ColorFilter.mode(cor, ui.BlendMode.srcIn) : null),
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }

  Image toImage({double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}