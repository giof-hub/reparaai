// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchReparaiController on _SearchReparaiController, Store {
  late final _$servicesAtom = Atom(
    name: '_SearchReparaiController.services',
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

  late final _$_fetchServiceAsyncAction = AsyncAction(
    '_SearchReparaiController._fetchService',
    context: context,
  );

  @override
  Future<void> _fetchService() {
    return _$_fetchServiceAsyncAction.run(() => super._fetchService());
  }

  @override
  String toString() {
    return '''
services: ${services}
    ''';
  }
}
