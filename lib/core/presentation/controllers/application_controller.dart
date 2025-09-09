import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';

part 'application_controller.g.dart';

class ApplicationController = _ApplicationControllerBase with _$ApplicationController;

abstract class _ApplicationControllerBase extends ReparaaiPageController with Store {

  AppLifecycleState? _state;

  List<String> paginasJornadaAtual = [];

  _ApplicationControllerBase();

  void setAppLifecycleState(AppLifecycleState state) {
    _state = state;
  }

  Future<void> verificaNecessidadeGuardiaoAtuar({
    required BuildContext context,
    required Function fluxoNormal,
    bool? menuSeguro,
    String? identificadorMenuSeguro,
  }) async {
    final completer = Completer<void>();

    if (menuSeguro == null || !menuSeguro) {
      await segueFluxoNormal(completer, fluxoNormal);
    } else {
      final UsuarioUseCase usuarioUseCase = GetIt.I.get();
      final FeatureUseCase featureUseCase = GetIt.I.get();
      var response = await featureUseCase.getConfigFeature(chaveFeature: CHAVE_CONFIG_MODO_GUARDIAO);

      verificarConfiguracaoFeature(
        response: response,
        sicoobPageController: this,
        onFeatureAtiva: (config) async {
          var usuarioLogado = await usuarioUseCase.getUsuarioLogado();
          usuarioLogado.processar(
            error: (exception) async {
              printDebug(exception);
              await segueFluxoNormal(completer, fluxoNormal);
            },
            resultado: (usuario) async {
              if (config.isAtivo) {
                if (usuarioLogado.isExisteResultado() && usuarioLogado.getResultado()!.isGuardiaoOffTemp) {
                  fluxoAtuacaoModoGuardiao = FluxoAtuacaoModoGuardiao.NENHUM;
                } else {
                  var responseGuardiao = await fetchObserver(
                    _modoGuardiaoUseCase.verificarModoGuardiaoAtivo(identificadorMenuSeguro: identificadorMenuSeguro),
                  );
                  responseGuardiao.processar(
                    error: (error) {
                      fluxoAtuacaoModoGuardiao = FluxoAtuacaoModoGuardiao.NENHUM;
                    },
                    resultado: (resultadoGuardiao) async {
                      if (resultadoGuardiao is ModoGuardiaoEntity) {
                        setModoGuardiaoEntity(resultadoGuardiao);
                        fluxoAtuacaoModoGuardiao = resultadoGuardiao.fluxoAtuacao;
                        if (fluxoAtuacaoModoGuardiao == null) {
                          fluxoAtuacaoModoGuardiao = FluxoAtuacaoModoGuardiao.NENHUM;
                        }
                      }
                    },
                  );
                }
                if (FluxoAtuacaoModoGuardiao.ESCOLHA_FORMA_DESATIVACAO == fluxoAtuacaoModoGuardiao) {
                  //TODO refatorar essa parte, a controller não pode ter chamadas de componentes, somente uma page pode.
                  EventbusBroadcast eventbus = GetIt.I.get<EventbusBroadcast>();
                  eventbus.emit(
                    ShowModalDesativarModoGuardiaoEvent(
                      context: context,
                      modoGuardiaoEntity: modoGuardiaoEntity!,
                      onDesativarModoGuardiao: () async {
                        await fluxoNormal.call();
                      },
                    ),
                  );
                  completer.complete();
                } else if (FluxoAtuacaoModoGuardiao.SFA_IMEDIATO == fluxoAtuacaoModoGuardiao) {
                  await fetchObserver(
                    _modoGuardiaoUseCase.sinalizarRecFacialGuardiao(SinalRecFacialGuardiaoEnum.TEMPORARIO),
                  );
                  await validarSegundoFator(fluxoNormal);
                  completer.complete();
                } else {
                  completer.complete();
                  await fluxoNormal.call();
                }
              } else {
                await segueFluxoNormal(completer, fluxoNormal);
              }
            },
          );
        },
        onFeatureInativa: (config) async {
          await segueFluxoNormal(completer, fluxoNormal);
        },
      );
    }
    return completer.future;
  }
}
