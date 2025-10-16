import 'package:core/features/app/presentation/controllers/reparaai_page_controller.dart';
import 'package:libraries/libraries.dart';
import 'package:module_start/config/routes_module_start.dart';
import 'package:module_start/features/search/domain/entities/search_arguments.dart';
import 'package:module_start/features/search/domain/entities/search_details_arguments.dart';
import 'package:module_start/features/search/domain/entities/search_entity.dart';
import 'package:module_start/features/search/domain/usecases/search_usecase.dart';

part 'search_detail_controller.g.dart';

class SearchDetailController = _SearchDetailController
    with _$SearchDetailController;

abstract class _SearchDetailController extends ReparaaiPageController
    with Store {
  final SearchUseCase _serviceUsecase;

  SearchDetailsArguments? arguments;

  _SearchDetailController(this._serviceUsecase);

  @observable
  List<SearchEntity>? services;

  void init(SearchDetailsArguments arguments) {
    setArguments(arguments);
  }

  void clean() {
    setServices([]);
  }

  void redirectToSearchDetails(SearchEntity service) async {
    await pushNamed(
      RoutesModuleStart.HOME.nameRoute,
      arguments: SearchArguments(serviceSelected: service),
    );
  }

  @action
  void setArguments(SearchDetailsArguments arguments) {
    this.arguments = arguments;
  }

  @action
  void setServices(List<SearchEntity> services) {
    this.services = services;
  }
}
 