import 'package:libraries/libraries.dart';
import 'package:core/core.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/work_entity.dart';
import '../../domain/usecases/category_usecase.dart';
import '../../domain/usecases/work_usecase.dart';

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
      path: "reparaai://module_flutter?route=module_start/search/search",
      nome: "search",
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
