// import dos pacotes
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import domain
import 'package:search_and_stay/domain/source/local/injection/injection.dart';
import 'package:search_and_stay/app/core/widgets/custom_snack_bar.dart';
import 'package:search_and_stay/domain/usecases/house_usecase.dart';
import 'package:search_and_stay/app/core/style/app_colors.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';

part 'house.g.dart';

class HouseMobx extends _HouseMobx with _$HouseMobx {}

abstract class _HouseMobx with Store {

  BuildContext currentContext = Session.globalContext.currentContext!;

  @observable
  HouseUseCase useCase = HouseUseCase(getIt());

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  bool isActive = true;

  @observable
  String messageError = "";

  @action
  void setActive() => isActive = !isActive;

  @action
  void setErrorMessage(String value) => messageError = value;

  @action
  void validateName( bool isRegister, int? id ) {
    String name = nameController.text;
    if ( name.trim().isEmpty || name.length < 3 ) {
      setErrorMessage(FlutterI18n.translate(currentContext, "alerts.invalid_name"));
      return;
    }

    Map<String, dynamic> map = {
      "name": nameController.text,
      "active": isActive,
    };

    if ( isRegister ) {
      create(map);
      return;
    }

    update(id!.toString(), map);
  }

  @action
  Future<void> create(Map<String, dynamic> json) async {

    final successOrFailure = await useCase.createHouse(json);

    successOrFailure.fold(
      (failure) => CustomSnackBar(messageKey: "alerts.create_failure"),
      (success) => {
        CustomSnackBar(messageKey: "alerts.create_success"),
        Navigator.pop(currentContext),
      },
    );
  }

  @action
  Future<void> update(String id, Map<String, dynamic> json) async {

    final successOrFailure = await useCase.updateHouse(id, json);

    successOrFailure.fold(
      (failure) => CustomSnackBar(messageKey: "alerts.update_failure"),
      (success) => {
        CustomSnackBar(messageKey: "alerts.update_success"),
        Navigator.pop(currentContext),
      },
    );
  }

  @action
  void showAlert( int id ) {
    showDialog(
      context: currentContext,
      builder: (builder) {
        return validateDelete(id.toString());
      },
    );
  }

  @action
  Widget validateDelete( String id ) {
    return Center(
      child: AlertDialog(
        title: Text(
          FlutterI18n.translate(currentContext, "pages.detail.dialog.title"),
          textAlign: TextAlign.center,
        ),
        content: Text(
          FlutterI18n.translate(currentContext, "pages.detail.dialog.subtitle"),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(16),
        actions: [

          TextButton(
            child: const Text(
              "btn_cancel",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.pop( currentContext ),
          ),

          TextButton(
            child: const Text(
              "btn_confirm",
              style: TextStyle(
                color: AppColors.orangeRed,
              ),
            ),
            onPressed: () {
              Navigator.pop( currentContext );
              delete(id);
            },
          ),

        ],
      ),
    );
  }

  @action
  Future<void> delete( String id ) async {
    final successOrFailure = await useCase.deleteHouse(id);

    successOrFailure.fold(
      (failure) => CustomSnackBar(messageKey: "alerts.delete_failure"),
      (success) => {
        CustomSnackBar(messageKey: "alerts.delete_success"),
        Navigator.pop(currentContext),
      },
    );

  }
}