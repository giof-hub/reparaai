import 'package:reparaai/config/injection/base_injection.dart';
import 'package:reparaai/domain/usecases/impl/login_usecase_impl.dart';
import 'package:reparaai/domain/usecases/login_usecase.dart';
import 'package:reparaai/presentation/controllers/login/login_controller.dart';

class Injection extends BaseInjection {
  @override
  void registerControllers() {
    register<LoginController>(() => LoginController(getIt()));
  }

  @override
  void registerDataSources() {}

  @override
  void registerExternals() {}

  @override
  void registerRepositories() {}

  @override
  void registerSingletons() {}

  @override
  void registerUseCases() {
    register<LoginUsecase>(() => LoginUsecaseImpl());
  }
}
