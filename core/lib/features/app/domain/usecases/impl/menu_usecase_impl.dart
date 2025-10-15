import 'dart:convert';

import 'package:core/config/config_help.dart';
import 'package:core/features/app/data/models/response_app.dart';
import 'package:core/features/app/domain/entities/item_menu_navigation_entity.dart';
import 'package:core/features/app/domain/entities/response_entity.dart';
import 'package:core/features/app/domain/usecases/menu_usecase.dart';
import 'package:flutter/material.dart';
import 'package:core/extensions/map_extensions.dart';

class MenuUsecaseImpl implements MenuUseCase {

  @override
  Future<ResponseApp<Exception, bool>> navigate({
    ItemMenuNavigationEntity? menuNavigation,
    bool isCloseFlutter = false,
    Duration? duration,
    Object? argsPageFlutter,
  }) async {
    if (menuNavigation == null || menuNavigation.urlMenu.isEmpty) {
      return ResponseEntity.error(
        error: Exception("Could not find this navigation menu"),
      );
    }

    var context = ConfigHelp.navegador.currentState?.context;

    return await _navigate(
      menuNavigation,
      context,
      argsPageFlutter,
      duration,
      isCloseFlutter,
    );

    // if (context != null) {
    //   final appController = ApplicationInherited.of(context)?.controller;
    //   await appController?.fetchObserver(
    //     Future.value(
    //       appController?.verificaNecessidadeGuardiaoAtuar(
    //         context: context,
    //         fluxoNormal: () async {
    //           return await _navigate(
    //             menuNavigation,
    //             context,
    //             argsPageFlutter,
    //             duration,
    //             isCloseFlutter,
    //           );
    //         },
    //         menuSeguro: menuNavigation.menuSeguro,
    //         identificadorMenuSeguro: menuNavigation.identificadorMenuSeguro,
    //       ),
    //     ).then((_) => ResponseEntity.success(result: true)),
    //   );
    //   return ResponseEntity.success(result: true);
    // } else {
    //   return await _navigate(
    //     menuNavigation,
    //     context,
    //     argsPageFlutter,
    //     duration,
    //     isCloseFlutter,
    //   );
    // }
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

    return await _resolveFlutterRoute(
      menuNavigation,
      argsPageFlutter: argsPageFlutter,
    );
  }

  Future<ResponseApp<Exception, bool>> _resolveFlutterRoute(
    ItemMenuNavigationEntity menuNavigation, {
    Object? argsPageFlutter,
  }) async {

    ConfigHelp.navegador.currentState?.pushNamed(
      menuNavigation.getPathFlutter()!,
      arguments: argsPageFlutter,
    );

    return ResponseEntity.success(result: true);
  }
}
