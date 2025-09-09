import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:reparaai/config/config_help.dart';
import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/core/domain/entities/item_menu_navigation_entity.dart';
import 'package:reparaai/core/domain/usecases/menu_usecase.dart';
import 'package:reparaai/core/presentation/controllers/base_controller.dart';

part 'reparaai_page_controller.g.dart';

class ReparaaiPageController = _ReparaaiPageControllerBase
    with _$ReparaaiPageController;

abstract class _ReparaaiPageControllerBase extends BaseController with Store {

  bool isLoading = false;
  bool isAnimacaoFimJornada = false;
  AlignmentGeometry? alignmentLoading;
  Widget? widgetLoading;
  double? transparenciaLoading;

  OverlayEntry? overlayLoading;
  VoidCallback? callbackAnimacao;

  @observable
  ObservableFuture<ResponseApp>? responseFuture;

  @observable
  bool mostrarOnboarding = false;

  @observable
  Color? corFundoContainerOnboarding = Colors.white;

  @observable
  Color? corFundoLoading = Colors.white54;

  Future<ResponseApp> fetchObserver(
    Future<ResponseApp> future) async {
    responseFuture = ObservableFuture(future);
    return await responseFuture!;
  }

  Future<dynamic>? pushNamed(String nomeRota, {Object? arguments}) {
    return ConfigHelp.navegador.currentState?.pushNamed(nomeRota, arguments: arguments);
  }

  Future<dynamic>? pushReplacementNamed(String nomeRota, {Object? arguments}) {
    return ConfigHelp.navegador.currentState?.pushReplacementNamed(nomeRota, arguments: arguments);
  }

  BuildContext? buildContextNavegador() {
    return ConfigHelp.navegador.currentState?.context;
  }

  void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> navigatePopUntil(String nomeRota) async {
    ConfigHelp.navegador.currentState?.pop();
    ConfigHelp.navegador.currentState?.pushReplacementNamed(nomeRota);
  }

  Future<void> menuAction({
    required String path,
    required String nome,
    bool? menuSeguro = false,
    String? idSafeMenu,
    Object? args,
  }) async {
    MenuUseCase menuUseCase = GetIt.I.get<MenuUseCase>();
    var responseMenu = await fetchObserver(
      menuUseCase.navigate(
        menuNavigation: ItemMenuNavigationEntity(
          nomeMenu: nome,
          urlMenu: path,
          menuSeguro: menuSeguro,
          identificadorMenuSeguro: idSafeMenu,
        ),
        argsPageFlutter: args,
      ),
    );
    responseMenu.process(
      error: (exception) => print(exception.toString()),
      result: (result) => print("ReparaaiPageController Navegando menu $result"),
    );
  }
}
