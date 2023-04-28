// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class EmptyPage extends StatelessWidget {
  final String keyMessage;
  const EmptyPage({Key? key, required this.keyMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Session.appEvents.sendScreen("home_empty_page");

    return Center(
      child: Text(
        FlutterI18n.translate(context, keyMessage),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}

