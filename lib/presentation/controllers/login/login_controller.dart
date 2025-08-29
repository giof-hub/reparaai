import 'package:mobx/mobx.dart';
import 'package:reparaai/domain/entities/login_entity.dart';
import 'package:reparaai/domain/usecases/login_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final LoginUsecase _useCase;

  _LoginController(this._useCase);

  @observable
  LoginEntity login = LoginEntity.empty();

  void signin() {
    _useCase.signin(login);
  }
}
