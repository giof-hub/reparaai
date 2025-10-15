import 'package:flutter/material.dart';
import 'package:libraries/libraries.dart';
import 'package:core/features/app/data/models/response_app.dart';
import 'package:core/features/app/domain/entities/enums/theme_message_user_enum.dart';
import 'package:core/features/app/presentation/controllers/reparaai_page_controller.dart';
import 'package:core/features/app/presentation/widgets/loading_circular_reparaai_widget.dart';

class ContainerFutureWidget extends StatelessWidget {
  final ObservableFuture<ResponseApp>? observer;
  final FutureStatus? status;
  final Widget Function(dynamic) onResult;
  final Widget? widgetEstadoInicial;
  final Widget Function(dynamic)? onError;
  final ReparaaiPageController controller;
  final ThemeMessageUserEnum temaMensagem;
  final String? tituloErro;
  final EdgeInsets padding;
  final bool exibeLoading;
  final Widget? widgetEstadoLoading;

  const ContainerFutureWidget({
    super.key, 
    required this.controller,
    required this.observer,
    required this.status,
    this.widgetEstadoInicial,
    this.onError,
    this.exibeLoading = true,
    this.temaMensagem = ThemeMessageUserEnum.LIGHT,
    this.tituloErro,
    this.padding = const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    this.widgetEstadoLoading,
    required this.onResult
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.centerLeft,
      child: Builder(
        builder: (context) {
          if (status == null || status == FutureStatus.rejected) {
            return widgetEstadoInicial ?? Container();
          }

          if (status == FutureStatus.pending) {
            if (exibeLoading == false) {
              return SizedBox();
            }
            return widgetEstadoLoading != null
                ? widgetEstadoLoading!
                : SizedBox(width: double.maxFinite, child: Center(child: LoadingCircularReparaaiWidget()));
          }

          var isSucesso = observer?.value?.isSuccess();
          var resultado = observer?.value?.getResult();
          var error = observer?.value?.getError();

          if (isSucesso ?? false) {
            return onResult.call(resultado);
          } else if (error != null) {

            if (onError != null) {
              return onError!.call(error);
            } else {
              return getWidgetError(error);
            }
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget getWidgetError(
    Exception? exception) {
    return Text(exception.toString());
  }
}
