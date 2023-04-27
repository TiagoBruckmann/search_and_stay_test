// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const VerifyConnection(
      keyAppBar: "pages.auth.app_bar",
      page: Center(
        child: Text("Register"),
      ),
    );
  }
}
