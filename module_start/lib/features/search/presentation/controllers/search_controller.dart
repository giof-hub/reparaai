import 'package:core/features/app/presentation/controllers/reparaai_page_controller.dart';
import 'package:libraries/libraries.dart';
import 'package:module_start/config/routes_module_start.dart';
import 'package:module_start/features/search/domain/entities/search_details_arguments.dart';
import 'package:module_start/features/search/domain/entities/search_entity.dart';
import 'package:module_start/features/search/domain/usecases/search_usecase.dart';

part 'search_controller.g.dart';

class SearchReparaiController = _SearchReparaiController
    with _$SearchReparaiController;

abstract class _SearchReparaiController extends ReparaaiPageController
    with Store {
  final SearchUseCase _serviceUsecase;

  _SearchReparaiController(this._serviceUsecase);

  @observable
  List<SearchEntity>? services;

  void init() {
    _fetchService();
  }

  void clean() {
    setServices([]);
  }

  @action
  Future<void> _fetchService() async {
    var future = await ObservableFuture(_serviceUsecase.listService());

    future.process(
      result: (result) {
        services = result!;
      },
      error: (error) => throw Exception(error.toString()),
    );
  }

  void redirectToSearchDetails(SearchEntity service) async {
    await pushNamed(
      RoutesModuleStart.SEARCH_DETAILS.getPath(),
      arguments: SearchDetailsArguments(serviceSelected: service),
    );
  }

  @action
  void setServices(List<SearchEntity> services) {
    this.services = services;
  }
}
