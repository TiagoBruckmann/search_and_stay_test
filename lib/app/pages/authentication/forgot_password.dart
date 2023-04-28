// imports nativos do flutter
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import das telas
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';
import 'package:search_and_stay/app/core/style/app_images.dart';

// import dos domain
import 'package:search_and_stay/app/pages/authentication/mobx/authentication.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final AuthenticationMobx mobx = AuthenticationMobx();

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("login");
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: "pages.auth.forgot.app_bar",
      page: Observer(
        builder: ( builder ) {

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric( horizontal: 16 ),
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
                    padding: const EdgeInsets.only( top: 80, bottom: 8),
                    child: TextField(
                      controller: mobx.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: theme.textTheme.bodyMedium!.apply(fontSizeFactor: 1.2),
                      onSubmitted: ( String value ) => mobx.validateEmail(forgotPassword: true),
                      decoration: InputDecoration(
                        labelText: FlutterI18n.translate(context, "pages.auth.email"),
                      ),
                    ),
                  ),

                  // mensagem de erro
                  if ( mobx.errorMessage.trim().isNotEmpty )
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          mobx.errorMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ( !mobx.successMessage )
                            ? theme.colorScheme.error
                            : theme.colorScheme.onSecondary,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),

                  // email
                  Container(
                    padding: const EdgeInsets.only( top: 40 ),
                    width: MediaQuery.of(context).size.width - 130,
                    child: ElevatedButton(
                      onPressed: () {
                        if ( !mobx.successMessage ) {
                          mobx.validateEmail( forgotPassword: true );
                          return;
                        }
                      },
                      child: Text(
                        FlutterI18n.translate(context, "pages.auth.forgot.${!mobx.successMessage ? "change": "delivered"}"),
                        style: theme.textTheme.labelSmall,
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