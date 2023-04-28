// imports nativos
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';

class EmptyPage extends StatelessWidget {
  final String keyMessage;
  const EmptyPage({Key? key, required this.keyMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        FlutterI18n.translate(context, keyMessage),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}

