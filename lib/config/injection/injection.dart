import 'package:reparaai/config/injection/base_injection.dart';
import 'package:reparaai/features/login/domain/usecases/impl/login_usecase_impl.dart';
import 'package:reparaai/features/login/domain/usecases/login_usecase.dart';
import 'package:reparaai/features/login/presentation/controllers/login_controller.dart';
import 'package:reparaai/features/signup/domain/usecases/impl/signup_usecase_impl.dart';
import 'package:reparaai/features/signup/domain/usecases/signup_usecase.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_controller.dart';

class Injection extends BaseInjection {
  @override
  void registerControllers() {
    register<LoginController>(() => LoginController(getIt()));
    register<SignupController>(() => SignupController(getIt()));
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
    register<SignupUsecase>(() => SignupUsecaseImpl());
  }
}
