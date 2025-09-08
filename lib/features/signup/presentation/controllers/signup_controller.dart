import 'package:mobx/mobx.dart';
import 'package:reparaai/features/signup/domain/entities/signup_entity.dart';
import 'package:reparaai/features/signup/domain/usecases/signup_usecase.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store {
  final SignupUsecase _useCase;

  _SignupController(this._useCase);

  @observable
  SignupEntity signup = SignupEntity.empty();

  void signin() {
    _useCase.signup(signup);
  }
}
