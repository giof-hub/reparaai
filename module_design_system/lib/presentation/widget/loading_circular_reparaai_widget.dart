
import 'package:flutter/material.dart';
import 'package:core/extensions/string_extensions.dart';
import 'package:module_design_system/gen/assets.dart';

class LoadingCircularReparaaiWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Size size;
  final AlignmentGeometry? alignment;

  const LoadingCircularReparaaiWidget({
    super.key, 
    this.backgroundColor,
    this.alignment = Alignment.center,
    this.size = const Size(70, 70),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      alignment: alignment,
      child: Assets.animations.loadingReparaai.toAnimationLottie(width: size.width, height: size.height)
          // TemaSicoobInherited.of(context)?.getTipoTema() == TipoTemaSicoob.CLARO
          //     ? Assets.animacoes.loadingSicoobNovo.toAnimacaoLottie(largura: size.width, altura: size.height)
          //     : Assets.animacoes.loadingSicoobNovoDark.toAnimacaoLottie(largura: size.width, altura: size.height),
    );
  }
}
