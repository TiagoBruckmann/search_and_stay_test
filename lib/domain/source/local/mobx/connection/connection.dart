// pacotes nativos do flutter
import 'package:flutter/services.dart';
import 'dart:async';

// imports globais
import 'package:search_and_stay/session.dart';

// import dos pacotes
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connection.g.dart';

class ConnectionMobx extends _ConnectionMobx with _$ConnectionMobx {}

abstract class _ConnectionMobx with Store {

  @observable
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  @observable
  Connectivity connectivity = Connectivity();

  @action
  Future<void> verifyConnection() async {

    ConnectivityResult result;

    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      Session.crash.log(e);
      return;
    }

    return updateConnectionStatus(result);

  }

  @action
  Future<void> updateConnectionStatus( ConnectivityResult result ) async => connectionStatus = result;

}