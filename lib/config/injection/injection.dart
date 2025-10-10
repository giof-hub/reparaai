import 'package:reparaai/config/injection/base_injection.dart';

import 'package:reparaai/core/data/repositories_impl/auth_repository_impl.dart';
import 'package:reparaai/core/data/repositories_impl/jwt_repository_impl.dart';
import 'package:reparaai/core/domain/repositories/auth_repository.dart';
import 'package:reparaai/core/domain/repositories/jwt_repository.dart';
import 'package:reparaai/core/domain/usecases/auth_usecase.dart';
import 'package:reparaai/core/domain/usecases/impl/auth_usecase_impl.dart';
import 'package:reparaai/core/domain/usecases/impl/menu_usecase_impl.dart';
import 'package:reparaai/core/domain/usecases/menu_usecase.dart';
import 'package:reparaai/features/home/data/datasource/impl/work_datasource_impl.dart';
import 'package:reparaai/features/home/data/datasource/work_datasource.dart';
import 'package:reparaai/features/home/data/repositories_impl/work_repository_impl.dart';
import 'package:reparaai/features/home/domain/repositories/work_repository.dart';
import 'package:reparaai/features/home/domain/usecases/impl/work_usecase_impl.dart';
import 'package:reparaai/features/home/domain/usecases/work_usecase.dart';
import 'package:reparaai/features/home/presentation/controllers/home_controller.dart';
import 'package:reparaai/features/login/domain/usecases/impl/login_usecase_impl.dart';
import 'package:reparaai/features/login/domain/usecases/login_usecase.dart';
import 'package:reparaai/features/login/presentation/controllers/login_controller.dart';
import 'package:reparaai/features/search/data/datasource/impl/search_datasource_impl.dart';
import 'package:reparaai/features/search/data/datasource/search_datasource.dart';
import 'package:reparaai/features/search/domain/repositories/impl/search_repository_impl.dart';
import 'package:reparaai/features/search/domain/repositories/search_repository.dart';
import 'package:reparaai/features/search/domain/usecases/impl/search_usecase_impl.dart';
import 'package:reparaai/features/search/domain/usecases/search_usecase.dart';
import 'package:reparaai/features/search/presentation/controllers/search_controller.dart';
import 'package:reparaai/features/search/presentation/controllers/search_detail_controller.dart';
import 'package:reparaai/features/signup/domain/usecases/impl/signup_usecase_impl.dart';
import 'package:reparaai/features/signup/domain/usecases/signup_usecase.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_controller.dart';
import 'package:reparaai/features/signup/presentation/controllers/choose_document_want_send_controller.dart';
import 'package:reparaai/features/signup/presentation/controllers/take_photo_with_open_document_controller.dart';

class Injection extends BaseInjection {
  @override
  void registerControllers() {
    register<LoginController>(() => LoginController(getIt()));
    register<SignupController>(() => SignupController(getIt()));
    register<HomeController>(() => HomeController(getIt()));
    register<SearchReparaiController>(() => SearchReparaiController(getIt()));
    register<ChooseDocumentWantSendController>(() => ChooseDocumentWantSendController());
    register<TakePhotoWithOpenDocumentController>(() => TakePhotoWithOpenDocumentController());
    register<SearchDetailController>(() => SearchDetailController(getIt()));
  }

  @override
  void registerDataSources() {
    register<WorkDatasource>(() => WorkDatasourceImpl());
    register<ServiceDatasource>(() => ServiceDatasourceImpl());
  }

  @override
  void registerExternals() {}

  @override
  void registerRepositories() {
    register<JwtRepository>(() => JwtRepositoryImpl());
    register<AuthRepository>(() => AuthRepositoryImpl(getIt()));
    register<WorkRepository>(() => WorkRepositoryImpl(getIt()));
    register<ServiceRepository>(() => ServiceRepositoryImpl(getIt()));
  }

  @override
  void registerSingletons() {}

  @override
  void registerUseCases() {
    register<LoginUsecase>(() => LoginUsecaseImpl());
    register<SignupUsecase>(() => SignupUsecaseImpl());
    register<AuthUsecase>(() => AuthUsecaseImpl(getIt()));
    register<MenuUseCase>(() => MenuUsecaseImpl());
    register<WorkUseCase>(() => WorkUsecaseImpl(getIt()));
    register<ServiceUsecase>(() => ServiceUsecaseImpl(getIt()));
  }
}
