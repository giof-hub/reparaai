// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchDetailController on _SearchDetailController, Store {
  late final _$servicesAtom = Atom(
    name: '_SearchDetailController.services',
    context: context,
  );

  @override
  List<ServiceEntity>? get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(List<ServiceEntity>? value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  late final _$_SearchDetailControllerActionController = ActionController(
    name: '_SearchDetailController',
    context: context,
  );

  @override
  void setArguments(SearchDetailsArguments arguments) {
    final _$actionInfo = _$_SearchDetailControllerActionController.startAction(
      name: '_SearchDetailController.setArguments',
    );
    try {
      return super.setArguments(arguments);
    } finally {
      _$_SearchDetailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
services: ${services}
    ''';
  }
}
