// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VerifyConnection(
      keyAppBar: "",
      page: Center(
        child: Text("Home"),
      ),
    );
  }
}
