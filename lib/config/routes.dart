import 'package:reparaai/config/resolver.dart';
import 'package:reparaai/features/home/presentation/pages/home_page.dart';
import 'package:reparaai/features/login/presentation/pages/login_page.dart';
import 'package:reparaai/features/search/presentation/pages/search_page.dart';
import 'package:reparaai/features/signup/presentation/pages/choose_document_want_send_page.dart';
import 'package:reparaai/features/signup/presentation/pages/signup_page.dart';
import 'package:reparaai/features/signup/presentation/pages/take_photo_with_open_document_page.dart';

enum Routes {
  HOME(nameFeature: "home", nameRoute: HomePage.nameRoute, isPublic: true),
  SIGNUP(
    nameFeature: "signup",
    nameRoute: SignupPage.nameRoute,
    isPublic: true,
  ),
  LOGIN(nameFeature: "login", nameRoute: LoginPage.nameRoute, isPublic: true),
  SEARCH(nameFeature: "search", nameRoute: SearchPage.nameRoute, isPublic: true),
  CHOOSE_DOCUMENT_WANT_SEND(nameFeature: "signup", nameRoute: ChooseDocumentWantSendPage.nameRoute, isPublic: true),
  TAKE_PHOTO_WITH_OPEN_DOCUMENT(nameFeature: "signup", nameRoute: TakePhotoWithOpenDocumentPage.nameRoute, isPublic: true),
  ;

  final String nameFeature;
  final String nameRoute;
  final bool isPublic;

  const Routes({
    required this.nameFeature,
    required this.nameRoute,
    required this.isPublic,
  });
}

extension RoutesExtensions on Routes {
  String getPath({Map<String, String>? params}) {
    if (isPublic) {
      var uri = Uri(
        path: "${Resolver.idModule}/$nameFeature/$nameRoute",
        queryParameters: params,
      );

      return uri.path;
    } else {
      return "";
    }
  }
}
