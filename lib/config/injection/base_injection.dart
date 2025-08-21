import 'package:get_it/get_it.dart';

abstract class BaseInjection {

  var getIt = GetIt.instance;

  void init() {
    registerSingletons();
    registerExternals();
    registerDataSources();
    registerRepositories();
    registerUseCases();
    registerControllers();
  }

  void registerSingletons();

  void registerExternals();

  void registerDataSources();

  void registerRepositories();

  void registerUseCases();

  void registerControllers();

  void register<T extends Object> (FactoryFunc<T> factoryFunc) {
    if (!getIt.isRegistered<T>()) {
      getIt.registerLazySingleton<T>(factoryFunc);
    }
  }

  void registerFactory<T extends Object> (FactoryFunc<T> factoryFunc) {
    if (!getIt.isRegistered<T>()) {
      getIt.registerFactory<T>(factoryFunc);
    }
  }
}