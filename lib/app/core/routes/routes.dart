// imports nativos do flutter
import 'package:flutter/material.dart';
import 'package:search_and_stay/app/pages/authentication/login.dart';
import 'package:search_and_stay/app/pages/authentication/register.dart';
import 'package:search_and_stay/app/pages/home/detail.dart';
import 'package:search_and_stay/app/pages/home/home.dart';

// import do app
import 'package:search_and_stay/app/pages/splash/splash.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class Routes {

  static Route<dynamic>? generateRoutes(RouteSettings settings) {

    final args = settings.arguments;

    switch( settings.name ) {
      case "/splash" :
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case "/login" :
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case "/register" :
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case "/forgot_password" :
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case "/" :
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case "/detail" :
        final params = args as Map;
        return MaterialPageRoute(
          builder: (builder) => DetailPage(
            houseEntity: params["house_entity"],
            isRegister: params["is_register"],
          ),
        );
      default:
        _errorRoute();
    }
    return null;

  }

  static Route<dynamic> _errorRoute() {

    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(_).colorScheme.background,
          appBar: AppBar(
            title: Text(
              FlutterI18n.translate(_, "routes.app_bar"),
              style: TextStyle(
                color: Theme.of(_).secondaryHeaderColor,
              ),
            ),
          ),
          body: Center(
            child: Text(
              FlutterI18n.translate(_, "routes.app_bar"),
            ),
          ),
        );
      },
    );

  }
}