import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/home/domain/entities/work_entity.dart';
import 'package:reparaai/features/home/domain/usecases/work_use_case.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends ReparaaiPageController with Store {
  WorkUseCase? workUseCase;

  _HomeController();

  @observable
  int? currentIndex;

  @action
  void setCurrentIndex(int currentIndex) {
    this.currentIndex = currentIndex;
  }

  @action
  void signIn() {
    menuAction(
      path: "reparaai://module_flutter?route=reparaai/login/login",
      nome: "login",
    );
  }

  // @action
  // void loadRepairs() {
  //   WorkUseCase() = WorkUseCase(
  //     repair: [
  //       WorkEntity(pathImage: 'assets/eletricista.png', name: 'Eletricista'),
  //       WorkEntity(pathImage: 'assets/encanador.png', name: 'Encanador'),
  //       WorkEntity(pathImage: 'assets/pintor.png', name: 'Pintor'),
  //     ],
  //   );
  }
}
