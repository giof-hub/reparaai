import 'package:mobx/mobx.dart';
import 'package:reparaai/config/routes.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/search/domain/entities/search_arguments.dart';
import 'package:reparaai/features/search/domain/entities/search_details_arguments.dart';
import 'package:reparaai/features/search/domain/entities/search_entity.dart';
import 'package:reparaai/features/search/domain/usecases/search_usecase.dart';

part 'search_detail_controller.g.dart';

class SearchDetailController = _SearchDetailController
    with _$SearchDetailController;

abstract class _SearchDetailController extends ReparaaiPageController
    with Store {
  final ServiceUsecase _serviceUsecase;

  SearchDetailsArguments? arguments;

  _SearchDetailController(this._serviceUsecase);

  @observable
  List<ServiceEntity>? services;

  void init(SearchDetailsArguments arguments) {
    setArguments(arguments);
  }

  void clean() {
    setServices([]);
  }

  void redirectToSearchDetails(ServiceEntity service) async {
    await pushNamed(
      Routes.HOME.nameRoute,
      arguments: SearchArguments(serviceSelected: service),
    );
  }

  @action
  void setArguments(SearchDetailsArguments arguments) {
    this.arguments = arguments;
  }

  @action
  void setServices(List<ServiceEntity> services) {
    this.services = services;
  }
}
 