// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reparaai_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReparaaiPageController on _ReparaaiPageControllerBase, Store {
  late final _$responseFutureAtom = Atom(
    name: '_ReparaaiPageControllerBase.responseFuture',
    context: context,
  );

  @override
  ObservableFuture<ResponseApp<dynamic, dynamic>>? get responseFuture {
    _$responseFutureAtom.reportRead();
    return super.responseFuture;
  }

  @override
  set responseFuture(ObservableFuture<ResponseApp<dynamic, dynamic>>? value) {
    _$responseFutureAtom.reportWrite(value, super.responseFuture, () {
      super.responseFuture = value;
    });
  }

  late final _$mostrarOnboardingAtom = Atom(
    name: '_ReparaaiPageControllerBase.mostrarOnboarding',
    context: context,
  );

  @override
  bool get mostrarOnboarding {
    _$mostrarOnboardingAtom.reportRead();
    return super.mostrarOnboarding;
  }

  @override
  set mostrarOnboarding(bool value) {
    _$mostrarOnboardingAtom.reportWrite(value, super.mostrarOnboarding, () {
      super.mostrarOnboarding = value;
    });
  }

  late final _$corFundoContainerOnboardingAtom = Atom(
    name: '_ReparaaiPageControllerBase.corFundoContainerOnboarding',
    context: context,
  );

  @override
  Color? get corFundoContainerOnboarding {
    _$corFundoContainerOnboardingAtom.reportRead();
    return super.corFundoContainerOnboarding;
  }

  @override
  set corFundoContainerOnboarding(Color? value) {
    _$corFundoContainerOnboardingAtom.reportWrite(
      value,
      super.corFundoContainerOnboarding,
      () {
        super.corFundoContainerOnboarding = value;
      },
    );
  }

  late final _$corFundoLoadingAtom = Atom(
    name: '_ReparaaiPageControllerBase.corFundoLoading',
    context: context,
  );

  @override
  Color? get corFundoLoading {
    _$corFundoLoadingAtom.reportRead();
    return super.corFundoLoading;
  }

  @override
  set corFundoLoading(Color? value) {
    _$corFundoLoadingAtom.reportWrite(value, super.corFundoLoading, () {
      super.corFundoLoading = value;
    });
  }

  @override
  String toString() {
    return '''
responseFuture: ${responseFuture},
mostrarOnboarding: ${mostrarOnboarding},
corFundoContainerOnboarding: ${corFundoContainerOnboarding},
corFundoLoading: ${corFundoLoading}
    ''';
  }
}
