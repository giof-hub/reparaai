import 'package:reparaai/core/data/models/response_app.dart';
import 'package:reparaai/core/domain/entities/item_menu_navigation_entity.dart';

abstract class MenuUseCase {
  Future<ResponseApp<Exception, bool>> navigate({
    ItemMenuNavigationEntity? menuNavigation,
    bool isCloseFlutter,
    Duration? duration,
    Object? argsPageFlutter,
  });
}