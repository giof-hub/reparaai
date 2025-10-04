import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';

part 'search_controller.g.dart';

class SearchReparaiController = _SearchReparaiController
    with _$SearchReparaiController;

abstract class _SearchReparaiController extends ReparaaiPageController with Store {
  _SearchReparaiController();

 
}
