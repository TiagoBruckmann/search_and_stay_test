// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationMobx on _AuthenticationMobx, Store {
  late final _$useCaseAtom =
      Atom(name: '_AuthenticationMobx.useCase', context: context);

  @override
  AuthenticationUseCase get useCase {
    _$useCaseAtom.reportRead();
    return super.useCase;
  }

  @override
  set useCase(AuthenticationUseCase value) {
    _$useCaseAtom.reportWrite(value, super.useCase, () {
      super.useCase = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: '_AuthenticationMobx.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_AuthenticationMobx.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_AuthenticationMobx.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$hidePasswordAtom =
      Atom(name: '_AuthenticationMobx.hidePassword', context: context);

  @override
  bool get hidePassword {
    _$hidePasswordAtom.reportRead();
    return super.hidePassword;
  }

  @override
  set hidePassword(bool value) {
    _$hidePasswordAtom.reportWrite(value, super.hidePassword, () {
      super.hidePassword = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_AuthenticationMobx.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$successMessageAtom =
      Atom(name: '_AuthenticationMobx.successMessage', context: context);

  @override
  bool get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(bool value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  late final _$isRegisterAtom =
      Atom(name: '_AuthenticationMobx.isRegister', context: context);

  @override
  bool get isRegister {
    _$isRegisterAtom.reportRead();
    return super.isRegister;
  }

  @override
  set isRegister(bool value) {
    _$isRegisterAtom.reportWrite(value, super.isRegister, () {
      super.isRegister = value;
    });
  }

  late final _$userEntityAtom =
      Atom(name: '_AuthenticationMobx.userEntity', context: context);

  @override
  UserEntity? get userEntity {
    _$userEntityAtom.reportRead();
    return super.userEntity;
  }

  @override
  set userEntity(UserEntity? value) {
    _$userEntityAtom.reportWrite(value, super.userEntity, () {
      super.userEntity = value;
    });
  }

  late final _$sendCodeToEmailAsyncAction =
      AsyncAction('_AuthenticationMobx.sendCodeToEmail', context: context);

  @override
  Future<void> sendCodeToEmail() {
    return _$sendCodeToEmailAsyncAction.run(() => super.sendCodeToEmail());
  }

  late final _$registerAsyncAction =
      AsyncAction('_AuthenticationMobx.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthenticationMobx.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_AuthenticationMobxActionController =
      ActionController(name: '_AuthenticationMobx', context: context);

  @override
  void updHidePassword() {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.updHidePassword');
    try {
      return super.updHidePassword();
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsRegister() {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.setIsRegister');
    try {
      return super.setIsRegister();
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorMessage(String value) {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSuccessMessage(bool value) {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.setSuccessMessage');
    try {
      return super.setSuccessMessage(value);
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserEntity(UserEntity user) {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.setUserEntity');
    try {
      return super.setUserEntity(user);
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail({bool forgotPassword = false}) {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.validateEmail');
    try {
      return super.validateEmail(forgotPassword: forgotPassword);
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName() {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.validateName');
    try {
      return super.validateName();
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToForgot() {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.goToForgot');
    try {
      return super.goToForgot();
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToRegister() {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.goToRegister');
    try {
      return super.goToRegister();
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToDash() {
    final _$actionInfo = _$_AuthenticationMobxActionController.startAction(
        name: '_AuthenticationMobx.goToDash');
    try {
      return super.goToDash();
    } finally {
      _$_AuthenticationMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
useCase: ${useCase},
emailController: ${emailController},
passwordController: ${passwordController},
nameController: ${nameController},
hidePassword: ${hidePassword},
errorMessage: ${errorMessage},
successMessage: ${successMessage},
isRegister: ${isRegister},
userEntity: ${userEntity}
    ''';
  }
}
