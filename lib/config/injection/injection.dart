import 'package:reparaai/config/injection/base_injection.dart';
import 'package:reparaai/core/data/repositories_impl/auth_repository_impl.dart';
import 'package:reparaai/core/data/repositories_impl/jwt_repository_impl.dart';
import 'package:reparaai/core/domain/repositories/auth_repository.dart';
import 'package:reparaai/core/domain/repositories/jwt_repository.dart';
import 'package:reparaai/core/domain/usecases/auth_usecase.dart';
import 'package:reparaai/core/domain/usecases/impl/auth_usecase_impl.dart';
import 'package:reparaai/core/domain/usecases/impl/menu_usecase_impl.dart';
import 'package:reparaai/core/domain/usecases/menu_usecase.dart';
import 'package:reparaai/features/home/presentation/controllers/home_controller.dart';
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
    register<HomeController>(() => HomeController());
  }

  @override
  void registerDataSources() {}

  @override
  void registerExternals() {}

  @override
  void registerRepositories() {
    register<JwtRepository>(() => JwtRepositoryImpl());
    register<AuthRepository>(() => AuthRepositoryImpl(getIt()));
  }

  @override
  void registerSingletons() {}

  @override
  void registerUseCases() {
    register<LoginUsecase>(() => LoginUsecaseImpl());
    register<SignupUsecase>(() => SignupUsecaseImpl());
    register<AuthUsecase>(() => AuthUsecaseImpl(getIt()));
    register<MenuUseCase>(() => MenuUsecaseImpl());
  }
}
