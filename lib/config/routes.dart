import 'package:reparaai/config/resolver.dart';
import 'package:reparaai/features/home/presentation/pages/home_page.dart';
import 'package:reparaai/features/login/presentation/pages/login_page.dart';
import 'package:reparaai/features/signup/presentation/pages/signup_page.dart';

enum Routes {
  HOME(nameFeature: "home", nameRoute: HomePage.nameRoute, isPublic: true),
  SIGNUP(
    nameFeature: "signup",
    nameRoute: SignupPage.nameRoute,
    isPublic: true,
  ),
  LOGIN(nameFeature: "login", nameRoute: LoginPage.nameRoute, isPublic: true);

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
