// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$currentIndexAtom = Atom(
    name: '_HomeController.currentIndex',
    context: context,
  );

  @override
  int? get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int? value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$_HomeControllerActionController = ActionController(
    name: '_HomeController',
    context: context,
  );

  @override
  void setCurrentIndex(int currentIndex) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
      name: '_HomeController.setCurrentIndex',
    );
    try {
      return super.setCurrentIndex(currentIndex);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signIn() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
      name: '_HomeController.signIn',
    );
    try {
      return super.signIn();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadRepairs() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
      name: '_HomeController.loadRepairs',
    );
    try {
      return super.loadRepairs();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
