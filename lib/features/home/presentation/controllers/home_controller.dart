import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends ReparaaiPageController with Store {

  _HomeController();

  @observable
  int? currentIndex;

  @action
  void setCurrentIndex(int currentIndex) {
    this.currentIndex = currentIndex;
  }

  @action
  void signUp() {
    menuAction(path: "reparaai://module_flutter?route=reparaai/login/login", nome: "login");
  }
}
