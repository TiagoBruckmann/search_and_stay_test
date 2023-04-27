// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const VerifyConnection(
      keyAppBar: "",
      page: Center(
        child: Text("Login"),
      ),
    );
  }
}
