import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/signup/domain/entities/signup_entity.dart';
import 'package:reparaai/features/signup/domain/usecases/signup_usecase.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController extends ReparaaiPageController with Store {
  final SignupUsecase _useCase;

  _SignupController(this._useCase);

  @observable
  SignupEntity signup = SignupEntity.empty();

  void signin() {
    menuAction(path: "reparaai://module_flutter?route=reparaai/signup/signup", nome: "Sign Up");

    _useCase.signup(signup);
  }
}
