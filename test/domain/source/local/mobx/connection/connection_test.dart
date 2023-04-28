// import dos pacotes nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import dos domain
import 'package:search_and_stay/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:flutter_test/flutter_test.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  group('should return a valid connection', () {

    final connection = ConnectionMobx();
    connection.connectivity.onConnectivityChanged.listen(connection.updateConnectionStatus);

    test('when connection was not valid', () {

      final connected = Session.sharedServices.validateConnection(connection);
      expect(connected, false);

    });

  });
}