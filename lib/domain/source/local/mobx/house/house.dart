// import dos pacotes
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import das telas
import 'package:search_and_stay/app/core/widgets/custom_snack_bar.dart';
import 'package:search_and_stay/app/core/style/app_colors.dart';

// import domain
import 'package:search_and_stay/domain/source/local/injection/injection.dart';
import 'package:search_and_stay/domain/usecases/house_usecase.dart';
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';

part 'house.g.dart';

class HouseMobx extends _HouseMobx with _$HouseMobx {}

abstract class _HouseMobx with Store {

  BuildContext? currentContext = Session.globalContext.currentContext;

  ObservableList<HouseEntity> listHouses = ObservableList();

  @observable
  bool isLoading = true;

  @observable
  bool isRequested = true;

  @observable
  HouseUseCase useCase = HouseUseCase(getIt());

  @observable
  ScrollController? controllerScroll;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  bool isActive = true;

  @observable
  String messageError = "";

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  void setIsRequested( bool value ) => isRequested = value;

  @action
  Future<void> getHouses() async {

    final failureOrList = await useCase.getHouses();

    failureOrList.fold(
      (failure) {
        [];
        setIsRequested(false);
      },
      (success) {
        addToList(success);
        setIsRequested(false);
      },
    );
  }

  @action
  void addToList( Iterable<HouseEntity> entities ) {
    setIsLoading(false);
    listHouses.addAll(entities);
  }

  @action
  Future<void> loadMore() async {
    if ( nextPage != null && lastPage > 1 ) {
      Session.appEvents.sharedEvent("home_load_more");

      if ( controllerScroll!.position.extentAfter < scrollSize && listHouses.length < totalItems && !isRequested ) {
        setIsRequested(true);
        scrollSize -= 70;
        await getHouses();
      }
    }
  }

  @action
  Future<void> refresh() async {
    clear();
    await getHouses();
  }

  @action
  void clear() {
    setIsRequested(true);
    setIsLoading(true);
    listHouses.clear();
    clearPagination();
    setErrorMessage("");
    nameController = TextEditingController(text: "");
  }

  @action
  Future<void> goToDetail( HouseEntity? houseEntity, bool isRegister ) async {

    final reload = await Navigator.pushNamed(
      Session.globalContext.currentContext!,
      "/detail",
      arguments: {
        "house_entity": houseEntity,
        "is_register": isRegister,
      },
    );

    if ( isRegister ) {
      Session.appEvents.sharedEvent("home_to_register");
      return;
    }

    Session.appEvents.sharedEventParams("home_to_detail", {
      "house_id": houseEntity!.id.toString(),
      "house_name": houseEntity.name,
      "is_register": isRegister.toString(),
    });

    if ( reload == true ) {
      refresh();
    }
  }

  @action
  void setValues( HouseEntity entity ) {
    if ( nameController.text.trim().isEmpty ) {
      Session.appEvents.sendScreen("detail_house");
      nameController = TextEditingController(text: entity.name);
      setActive( entity.active == 1 ? true : false );
    }
  }

  @action
  void setActive( bool value ) => isActive = value;

  @action
  void setErrorMessage(String value) => messageError = value;

  @action
  void validateName( bool isRegister, int? id ) {
    String name = nameController.text;
    if ( name.trim().isEmpty || name.length < 3 ) {
      setErrorMessage(FlutterI18n.translate(currentContext!, "alerts.invalid_name"));
      return;
    }

    Map<String, dynamic> map = {
      "house_rules": {
        "name": nameController.text,
        "active": isActive ? 1 : 0,
      }
    };

    if ( isRegister ) {
      create(map);
      return;
    }

    update(id!.toString(), map);
  }

  @action
  Future<void> create(Map<String, dynamic> json) async {

    Session.appEvents.sharedEventParams("register_create", json["house_rules"]);
    final successOrFailure = await useCase.createHouse(json);

    successOrFailure.fold(
      (failure) => CustomSnackBar(messageKey: "alerts.create_failure"),
      (success) => {
        CustomSnackBar(messageKey: "alerts.create_success", color: AppColors.chateauGreen),
        Navigator.pop(currentContext!, true),
      },
    );
  }

  @action
  Future<void> update(String id, Map<String, dynamic> json) async {

    Session.appEvents.sharedEventParams("detail_update", json["house_rules"]);
    final successOrFailure = await useCase.updateHouse(id, json);

    successOrFailure.fold(
      (failure) => CustomSnackBar(messageKey: "alerts.update_failure"),
      (success) => {
        CustomSnackBar(messageKey: "alerts.update_success", color: AppColors.chateauGreen),
        Navigator.pop(currentContext!, true),
      },
    );
  }

  @action
  void showAlert( int id ) {
    Session.appEvents.sharedEventParams("detail_show_alert_delete", {"id": id});
    showDialog(
      context: currentContext!,
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
          FlutterI18n.translate(currentContext!, "pages.home.detail.dialog.title"),
          textAlign: TextAlign.center,
        ),
        content: Text(
          FlutterI18n.translate(currentContext!, "pages.home.detail.dialog.subtitle"),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.all(16),
        actions: [

          TextButton(
            child: Text(
              FlutterI18n.translate(currentContext!, "btn_cancel"),
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.pop( currentContext! ),
          ),

          TextButton(
            child: Text(
              FlutterI18n.translate(currentContext!, "btn_confirm"),
              style: const TextStyle(
                color: AppColors.orangeRed,
              ),
            ),
            onPressed: () {
              Navigator.pop( currentContext! );
              delete(id);
            },
          ),

        ],
      ),
    );
  }

  @action
  Future<void> delete( String id ) async {

    Session.appEvents.sharedEventParams("detail_delete", {"id": id});
    final successOrFailure = await useCase.deleteHouse(id);

    successOrFailure.fold(
      (failure) => CustomSnackBar(messageKey: "alerts.delete_failure"),
      (success) => {
        CustomSnackBar(messageKey: "alerts.delete_success", color: AppColors.chateauGreen),
        Navigator.pop(currentContext!, true),
      },
    );
  }
}