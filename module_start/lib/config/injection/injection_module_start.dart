import 'package:core/core.dart';
import 'package:module_start/features/home/data/datasource/category_datasource.dart';
import 'package:module_start/features/home/data/datasource/impl/category_datasource_impl.dart';
import 'package:module_start/features/home/data/datasource/impl/work_datasource_impl.dart';
import 'package:module_start/features/home/data/datasource/work_datasource.dart';
import 'package:module_start/features/home/data/repositories_impl/category_repository_impl.dart';
import 'package:module_start/features/home/data/repositories_impl/work_repository_impl.dart';
import 'package:module_start/features/home/domain/repositories/category_repository.dart';
import 'package:module_start/features/home/domain/repositories/work_repository.dart';
import 'package:module_start/features/home/domain/usecases/category_usecase.dart';
import 'package:module_start/features/home/domain/usecases/impl/category_usecase_impl.dart';
import 'package:module_start/features/home/domain/usecases/impl/work_usecase_impl.dart';
import 'package:module_start/features/home/domain/usecases/work_usecase.dart';
import 'package:module_start/features/home/presentation/controllers/home_controller.dart';
import 'package:module_start/features/login/domain/usecases/impl/login_usecase_impl.dart';
import 'package:module_start/features/login/domain/usecases/login_usecase.dart';
import 'package:module_start/features/login/presentation/controllers/login_controller.dart';
import 'package:module_start/features/signup/domain/usecases/impl/signup_usecase_impl.dart';
import 'package:module_start/features/signup/domain/usecases/signup_usecase.dart';
import 'package:module_start/features/signup/presentation/controllers/signup_controller.dart';
import 'package:module_start/features/signup/presentation/controllers/choose_document_want_send_controller.dart';
import 'package:module_start/features/signup/presentation/controllers/take_photo_with_open_document_controller.dart';

class InjectionModuleStart extends BaseInjection {
  @override
  void registerControllers() {
    register<LoginController>(() => LoginController(getIt()));
    register<SignupController>(() => SignupController(getIt()));
    register<HomeController>(() => HomeController(getIt(), getIt()));
    register<ChooseDocumentWantSendController>(() => ChooseDocumentWantSendController());
    register<TakePhotoWithOpenDocumentController>(() => TakePhotoWithOpenDocumentController());
  }

  @override
  void registerDataSources() {

    register<WorkDatasource>(() => WorkDatasourceImpl());
    register<CategoryDatasource>(() => CategoryDatasourceImpl());

  }

  @override
  void registerExternals() {}

  @override
  void registerRepositories() {
    register<JwtRepository>(() => JwtRepositoryImpl());
    register<AuthRepository>(() => AuthRepositoryImpl(getIt()));
    register<WorkRepository>(() => WorkRepositoryImpl(getIt()));
    register<CategoryRepository>(() => CategoryRepositoryImpl(getIt()));
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
    register<CategoryUsecase>(() => CategoryUsecaseImpl(getIt()));
  }
}
