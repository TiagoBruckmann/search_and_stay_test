// imports nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class CustomSnackBar {

  CustomSnackBar({ required String messageKey, Color? color }) {

    final context = Session.globalContext.currentContext!;

    final snackBar = SnackBar(
      content: Text(
        FlutterI18n.translate(context, messageKey),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color ?? Theme.of(context).colorScheme.error,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}