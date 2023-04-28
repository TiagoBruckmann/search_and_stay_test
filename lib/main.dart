// imports nativos
import 'package:flutter/material.dart';
import 'dart:ui';

// imports globais
import 'package:search_and_stay/session.dart';

// import dos app
import 'package:search_and_stay/app/core/services/languages.dart';
import 'package:search_and_stay/app/core/routes/routes.dart';
import 'package:search_and_stay/app/core/style/themes.dart';

// import dos domain
import 'package:search_and_stay/domain/source/local/mobx/connection/connection.dart';
import 'package:search_and_stay/domain/source/local/injection/injection.dart';
import 'package:search_and_stay/domain/source/local/mobx/house/house.dart';

// import dos pacotes
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = ( error, stackTrace ) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    return true;
  };
  FirebasePerformance.instance;

  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => ConnectionMobx(),
        ),
        Provider(
          create: (context) => HouseMobx(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: Session.globalContext,
        title: "Search and Stay",
        theme: Themes.lightTheme,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: "/splash",
        supportedLocales: supportedLocale,
        localizationsDelegates: localizationsDelegate,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}