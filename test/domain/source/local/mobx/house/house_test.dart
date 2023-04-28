// import dos pacotes nativos do flutter
import 'package:flutter/material.dart';

// import dos domain
import 'package:search_and_stay/domain/source/local/injection/injection.dart';
import 'package:search_and_stay/domain/source/local/mobx/house/house.dart';
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:flutter_test/flutter_test.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  group('should test HouseMobx with valid results', () {

    final houseMobx = HouseMobx();

    test('when addToList is completed with successfully', () async {

      List<HouseEntity> list = [
        const HouseEntity(
          666,
          1,
          "Super casa",
        ),
      ];

      houseMobx.addToList(list);
      expect(houseMobx.isLoading, false);
      expect(houseMobx.listHouses, list);

    });

    test('when updLoading is true', () {

      houseMobx.setIsLoading(true);
      expect(houseMobx.isLoading, true);

    });

    test('when updLoading is false', () {

      houseMobx.setIsLoading(false);
      expect(houseMobx.isLoading, false);

    });

    test('when clear is called', () {

      houseMobx.clear();
      expect(houseMobx.isLoading, true);
      expect(houseMobx.listHouses, []);
      expect(houseMobx.messageError, "");
      expect(houseMobx.nameController.text, "");

    });

    test('when set active is true', () {

      houseMobx.setActive(true);
      expect(houseMobx.isActive, true);

    });

    test('when set active is false', () {

      houseMobx.setActive(false);
      expect(houseMobx.isActive, false);

    });

    test('when set error message is called empty', () {

      houseMobx.setErrorMessage("");
      expect(houseMobx.messageError, "");

    });

    test('when set error message has a message', () {

      houseMobx.setErrorMessage("Hello, i'm a unit test");
      expect(houseMobx.messageError, "Hello, i'm a unit test");

    });

  });
}