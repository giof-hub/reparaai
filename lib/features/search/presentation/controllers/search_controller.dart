import 'package:mobx/mobx.dart';
import 'package:reparaai/config/routes.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/search/domain/entities/search_arguments.dart';
import 'package:reparaai/features/search/domain/entities/search_details_arguments.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';
import 'package:reparaai/features/search/domain/usecases/search_usecase.dart';

part 'search_controller.g.dart';

class SearchReparaiController = _SearchReparaiController
    with _$SearchReparaiController;

abstract class _SearchReparaiController extends ReparaaiPageController
    with Store {
  final ServiceUsecase _serviceUsecase;

  _SearchReparaiController(this._serviceUsecase);

  @observable
  List<ServiceEntity>? services;

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

  void redirectToSearchDetails(ServiceEntity service) async {
    await pushNamed(
      Routes.SEARCH_DETAILS.getPath(),
      arguments: SearchDetailsArguments(serviceSelected: service),
    );
  }

  @action
  void setServices(List<ServiceEntity> services) {
    this.services = services;
  }
}
