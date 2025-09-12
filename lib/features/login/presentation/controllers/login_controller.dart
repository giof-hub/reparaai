import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/login/domain/entities/login_entity.dart';
import 'package:reparaai/features/login/domain/usecases/login_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController extends ReparaaiPageController with Store {
  final LoginUsecase _useCase;

  _LoginController(this._useCase);

  @observable
  LoginEntity login = LoginEntity.empty();

  void signin() {
    _useCase.signin(login);
    menuAction(
      path: "reparaai://module_flutter?route=reparaai/home/home",
      nome: "login",
    );
  }

  void signup() {
    menuAction(
      path: "reparaai://module_flutter?route=reparaai/signup/signup",
      nome: "cadastro",
    );
  }
}
