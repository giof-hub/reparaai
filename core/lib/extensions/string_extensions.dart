import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:libraries/libraries.dart';

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

  LottieBuilder toAnimationLottie({
    double? width,
    double? height,
    bool? repeat,
    Animation<double>? controller,
    void Function(LottieComposition)? onLoaded,
    BoxFit? fit,
  }) {
    return Lottie.asset(
      AssetImage(this).keyName,
      width: width,
      height: height,
      controller: controller,
      fit: fit,
      repeat: repeat ?? true,
      onLoaded: onLoaded,
    );
  }
}