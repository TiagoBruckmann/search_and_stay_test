// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// imports globais
import 'package:search_and_stay/session.dart';

// import das telas
import 'package:search_and_stay/app/pages/splash/mobx/splash.dart';
import 'package:search_and_stay/app/core/style/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final SplashMobx splashMobx = SplashMobx();
    Session.appEvents.sendScreen("splash");

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Timer(
      const Duration(seconds: 3),
      () => splashMobx.verifyConnection(),
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Image.asset(
            AppImages.logoDescription,
            width: 200,
          ),
        ),
      ),
    );
  }
}
