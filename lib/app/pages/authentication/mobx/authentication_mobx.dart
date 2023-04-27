// import dos app
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import dos domain
import 'package:search_and_stay/domain/source/local/injection/injection.dart';
import 'package:search_and_stay/domain/usecases/authentication_usecase.dart';
import 'package:search_and_stay/domain/entity/user.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';

part 'authentication.g.dart';

class AuthenticationMobx extends _AuthenticationMobx with _$AuthenticationMobx {}

abstract class _AuthenticationMobx with Store {

  BuildContext currentContext = Session.globalContext.currentContext!;

  @observable
  AuthenticationUseCase useCase = AuthenticationUseCase(getIt());

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  bool hidePassword = false;

  @observable
  String errorMessage = "";

  @observable
  bool successMessage = false;

  @observable
  late UserEntity userEntity;

  @action
  void updHidePassword() => hidePassword = !hidePassword;

  @action
  setErrorMessage(String value) => errorMessage = value;

  @action
  setSuccessMessage( bool value ) => successMessage = value;

  @action
  setUserEntity( UserEntity user ) {
    userEntity = user;
    goToDash();
  }

  @action
  void validateFields(int type) {
    validateEmail();
    validatePassword();

    if ( type == 1 ) {
      validateName();
      register();
      return;
    }

    login();
  }

  @action
  void validateName() {
    String name = nameController.text;
    if ( name.trim().isEmpty || name.trim().length < 3 ) {
      setErrorMessage(FlutterI18n.translate(currentContext, "pages.auth.alerts.invalid_name"));
      return;
    }
  }

  @action
  void validateEmail({ bool forgotPassword = false }) {
    String email = emailController.text;
    if ( email.trim().isEmpty || !email.contains("@") || ( !email.contains(".com") && !email.contains(".br") ) ) {
      setErrorMessage(FlutterI18n.translate(currentContext, "pages.auth.alerts.invalid_email"));
      return;
    }
    setErrorMessage("");
    if ( forgotPassword ) {
      sendCodeToEmail();
      return;
    }
  }

  @action
  void validatePassword() {
    String password = passwordController.text;
    if ( password.trim().isEmpty || password.trim().length < 6 ) {
      setErrorMessage(FlutterI18n.translate(currentContext, "pages.auth.alerts.invalid_password"));
      return;
    }
  }

  @action
  Future<void> sendCodeToEmail() async {
    final failureOrSuccess = await useCase.forgotPassword(emailController.text);

    failureOrSuccess.fold(
      (failure) => {
        setSuccessMessage(false),
        setErrorMessage(FlutterI18n.translate(currentContext, "pages.auth.alerts.redefinition_failure")),
      },
      (success) => {
        setSuccessMessage(success),
        setErrorMessage(FlutterI18n.translate(currentContext, "pages.auth.alerts.redefinition_success")),
      },
    );

  }

  @action
  Future<void> register() async {

    Map<String, dynamic> params = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    final failureOrSuccess = await useCase.registerWithEmail(params);

    failureOrSuccess.fold(
      (failure) => setErrorMessage(FlutterI18n.translate(currentContext, "pages.auth.alerts.failure_register_profile")),
      (success) => setUserEntity(success),
    );

  }

  @action
  Future<void> login() async {

    Map<String, dynamic> params = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    final failureOrSuccess = await useCase.loginWithEmail(params);

    failureOrSuccess.fold(
      (failure) => setErrorMessage(FlutterI18n.translate(currentContext, "pages.auth.alerts.failure_login_profile")),
      (success) => setUserEntity(success),
    );
  }

  @action
  void goToForgot() {
    Navigator.pushNamed(
      currentContext,
      "/forgot",
    );
  }

  @action
  void goToRegister(int type) {
    Navigator.pushNamed(
      currentContext,
      "/register",
    );
  }

  @action
  void goToDash() {
    Navigator.pushNamedAndRemoveUntil(
      currentContext,
      "/",
      (route) => false,
    );
  }
}