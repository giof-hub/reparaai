import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/home/domain/entities/category_entity.dart';
import 'package:reparaai/features/home/domain/entities/work_entity.dart';
import 'package:reparaai/features/home/domain/usecases/category_usecase.dart';
import 'package:reparaai/features/home/domain/usecases/work_usecase.dart';
import 'package:reparaai/core/data/models/response_app.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends ReparaaiPageController with Store {
  final WorkUseCase _workUseCase;

  final CategoryUsecase _categoryUsecase;

  ObservableFuture<ResponseApp<Exception, List<CategoryEntity>>>?
  categoriesFuture;

  _HomeController(this._workUseCase, this._categoryUsecase);

  @observable
  int? currentIndex;

  @observable
  List<WorkEntity>? works;

  void init() {
    _fetchWorks();
    _fetchCategories();
  }

  @action
  Future<void> _fetchWorks() async {
    var future = await ObservableFuture(_workUseCase.listWorks());

    future.process(
      result: (result) {
        works = result!;
      },
      error: (error) => throw Exception(error.toString()),
    );
  }

  @action
  Future<void> _fetchCategories() async {
    categoriesFuture = ObservableFuture(_categoryUsecase.listCategories());
  }

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
  //}
}
