// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/pages/authentication/mobx/authentication.dart';
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';
import 'package:search_and_stay/app/core/style/app_images.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationMobx mobx = AuthenticationMobx();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: "",
      page: Observer(
        builder: (builder) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // logo
                  Image.asset(
                    AppImages.logoDescription,
                    width: 200,
                  ),

                  // email
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 25),
                    child: TextField(
                      controller: mobx.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: theme.textTheme.bodyMedium!.apply(
                        fontSizeFactor: 1.2,
                      ),
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.auth.email"),
                      ),
                    ),
                  ),

                  // senha
                  TextField(
                    controller: mobx.passwordController,
                    obscureText: (!mobx.hidePassword) ? true : false,
                    keyboardType: TextInputType.text,
                    onSubmitted: (String value) => mobx.validateEmail(),
                    textInputAction: TextInputAction.done,
                    style: theme.textTheme.bodyMedium!.apply(
                      fontSizeFactor: 1.2,
                    ),
                    decoration: InputDecoration(
                      labelText: FlutterI18n.translate(context, "pages.auth.password"),
                      suffixIcon: TextButton(
                        onPressed: () => mobx.updHidePassword(),
                        child: Icon(
                          (!mobx.hidePassword)
                            ? Icons.visibility
                            : Icons.visibility_off,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // esqueci a senha
                      TextButton(
                        onPressed: () => mobx.goToForgot(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            FlutterI18n.translate(context, "pages.auth.forgot.app_bar"),
                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                      ),

                      // cadastro
                      TextButton(
                        onPressed: () => mobx.goToRegister(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            FlutterI18n.translate(context, "pages.auth.create_account"),
                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                      ),

                    ],
                  ),

                  // mensagem de erro
                  if ( mobx.errorMessage.trim().isNotEmpty )
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          mobx.errorMessage,
                          style: TextStyle(
                            color: theme.colorScheme.error,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),

                  // acessar
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width - 130,
                    child: ElevatedButton(
                      onPressed: () => mobx.validateEmail(),
                      child: Text(
                        FlutterI18n.translate(context, "btn_login"),
                        style: theme.textTheme.displayLarge,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
