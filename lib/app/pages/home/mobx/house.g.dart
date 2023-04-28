// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HouseMobx on _HouseMobx, Store {
  late final _$useCaseAtom = Atom(name: '_HouseMobx.useCase', context: context);

  @override
  HouseUseCase get useCase {
    _$useCaseAtom.reportRead();
    return super.useCase;
  }

  @override
  set useCase(HouseUseCase value) {
    _$useCaseAtom.reportWrite(value, super.useCase, () {
      super.useCase = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_HouseMobx.nameController', context: context);

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

  late final _$isActiveAtom =
      Atom(name: '_HouseMobx.isActive', context: context);

  @override
  bool get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  late final _$messageErrorAtom =
      Atom(name: '_HouseMobx.messageError', context: context);

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  late final _$createAsyncAction =
      AsyncAction('_HouseMobx.create', context: context);

  @override
  Future<void> create(Map<String, dynamic> json) {
    return _$createAsyncAction.run(() => super.create(json));
  }

  late final _$updateAsyncAction =
      AsyncAction('_HouseMobx.update', context: context);

  @override
  Future<void> update(String id, Map<String, dynamic> json) {
    return _$updateAsyncAction.run(() => super.update(id, json));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_HouseMobx.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$_HouseMobxActionController =
      ActionController(name: '_HouseMobx', context: context);

  @override
  void setActive() {
    final _$actionInfo =
        _$_HouseMobxActionController.startAction(name: '_HouseMobx.setActive');
    try {
      return super.setActive();
    } finally {
      _$_HouseMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String value) {
    final _$actionInfo = _$_HouseMobxActionController.startAction(
        name: '_HouseMobx.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$_HouseMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(bool isRegister, int? id) {
    final _$actionInfo = _$_HouseMobxActionController.startAction(
        name: '_HouseMobx.validateName');
    try {
      return super.validateName(isRegister, id);
    } finally {
      _$_HouseMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showAlert(int id) {
    final _$actionInfo =
        _$_HouseMobxActionController.startAction(name: '_HouseMobx.showAlert');
    try {
      return super.showAlert(id);
    } finally {
      _$_HouseMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget validateDelete(String id) {
    final _$actionInfo = _$_HouseMobxActionController.startAction(
        name: '_HouseMobx.validateDelete');
    try {
      return super.validateDelete(id);
    } finally {
      _$_HouseMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
useCase: ${useCase},
nameController: ${nameController},
isActive: ${isActive},
messageError: ${messageError}
    ''';
  }
}
