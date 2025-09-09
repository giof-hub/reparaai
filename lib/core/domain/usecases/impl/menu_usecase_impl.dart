import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reparaai/config/config_help.dart';
import 'package:reparaai/core/domain/entities/item_menu_navigation_entity.dart';
import 'package:reparaai/core/domain/usecases/menu_usecase.dart';
import 'package:reparaai/core/extensions/map_extensions.dart';
import 'package:reparaai/core/data/models/response_app.dart';
import 'package:flutter/services.dart';
import 'package:reparaai/core/presentation/application_component.dart';

class MenuUsecaseImpl implements MenuUseCase {
  @override
  Future<ResponseApp<Exception, bool>> navigate({
    ItemMenuNavigationEntity? menuNavigation,
    bool isCloseFlutter = false,
    Duration? duration,
    Object? argsPageFlutter,
  }) async {
    if (menuNavigation == null || menuNavigation.urlMenu.isEmpty) {
      return ResponseEntity.error(error: ErroNegocialException(mensagem: ""));
    }

    var context = ConfigHelp.navegador.currentState?.context;
    if (context != null) {
      final appController = ApplicationInherited.of(context)?.controller;
      await appController?.fetchObserver(
        Future.value(
          appController?.verificaNecessidadeGuardiaoAtuar(
            context: context,
            fluxoNormal: () async {
              return await _navigate(
                menuNavigation,
                context,
                argsPageFlutter,
                duration,
                isCloseFlutter,
              );
            },
            menuSeguro: menuNavigation.menuSeguro,
            identificadorMenuSeguro: menuNavigation.identificadorMenuSeguro,
          ),
        ).then((_) => ResponseEntity.sucesso(resultado: true)),
      );
      return ResponseEntity.sucesso(resultado: true);
    } else {
      return await _navigate(
        menuNavigation,
        context,
        argsPageFlutter,
        duration,
        isCloseFlutter,
      );
    }
  }

  Future<ResponseApp<Exception, bool>> _navigate(
    ItemMenuNavigationEntity menuNavigation,
    BuildContext? context,
    Object? argsPageFlutter,
    Duration? duration,
    bool isCloseFlutter,
  ) async {

    if (menuNavigation.urlMenu.contains("argsPageFlutter")) {
      Uri uriUrlMenu = Uri.parse(menuNavigation.urlMenu.trim());
      argsPageFlutter = jsonDecode(
        uriUrlMenu.queryParameters.getValueOrDefault(
          key: "argsPageFlutter",
          def: "",
        ),
      );
    }

    if (menuNavigation.isRotaFlutter) {
      return await _tratarRotaFlutter(
        menuNavigation,
        argsPageFlutter: argsPageFlutter,
      );
    } else {
      var response = await _menuRepository.navegarMenu(
        menuNavegacao: menuNavigation,
      );
      if (duration != null) {
        await Future.delayed(duration);
      }
      if (response.isSucesso() && isCloseFlutter) {
        SystemNavigator.pop();
      }
      if (response.isSucesso()) {
        await Future.delayed(Duration(seconds: 2));
      }
      return response;
    }
  }
}
