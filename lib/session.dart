// imports nativos do flutter
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/core/services/shared.dart';
import 'package:search_and_stay/domain/source/local/local_storage.dart';

// imports globais
import 'package:search_and_stay/domain/source/remote/app_events.dart';
import 'package:search_and_stay/domain/source/remote/crash.dart';

class Session {

  static GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();

  static final SharedServices sharedServices = SharedServices();
  static final LocalStorage localStorage = LocalStorage();
  static final AppEvents appEvents = AppEvents();
  static final Crash crash = Crash();

}