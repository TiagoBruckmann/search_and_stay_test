// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import dos domain
import 'package:search_and_stay/domain/source/local/injection/injection.dart';
import 'package:search_and_stay/domain/usecases/authentication_usecase.dart';

// import dos pacotes
import 'package:mobx/mobx.dart';

part 'splash.g.dart';

class SplashMobx extends _SplashMobx with _$SplashMobx {}

abstract class _SplashMobx with Store {

  BuildContext currentContext = Session.globalContext.currentContext!;

  @observable
  AuthenticationUseCase useCase = AuthenticationUseCase(getIt());

  @action
  Future<void> verifyConnection() async {
    final connectedOrNot = await useCase.verifyConnection();

    connectedOrNot.fold(
      (failure) => goToLogin(),
      (success) => redirect(success),
    );

  }

  @action
  Future<void> redirect( bool connected ) async {
    if ( connected ) {
      goToHome();
      return;
    }
    goToLogin();
  }

  @action
  void goToHome() {
    Navigator.pushNamedAndRemoveUntil(
      currentContext,
      "/",
      (route) => false,
    );
  }

  @action
  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      currentContext,
      "/login",
      (route) => false,
    );
  }

}