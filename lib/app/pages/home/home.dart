// imports nativos
import 'package:flutter/material.dart';

// imports globais
import 'package:search_and_stay/session.dart';

// import das telas
import 'package:search_and_stay/app/pages/authentication/mobx/authentication.dart';
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';
import 'package:search_and_stay/app/core/widgets/empty_page.dart';

// import dos domain
import 'package:search_and_stay/domain/source/local/mobx/house/house.dart';
import 'package:search_and_stay/app/pages/home/widget/loading_houses.dart';
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthenticationMobx authenticationMobx = AuthenticationMobx();
  HouseMobx mobx = HouseMobx();

  @override
  void initState() {
    super.initState();
    Session.appEvents.sendScreen("home");
    mobx.controllerScroll = ScrollController()..addListener(() => mobx.loadMore());
  }

  @override
  void dispose() {
    super.dispose();
   mobx.refresh();
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return Observer(
      builder: (builder) {

        return VerifyConnection(
          keyAppBar: "pages.home.home.app_bar",
          actions: [

            Tooltip(
              message: FlutterI18n.translate(context, "pages.home.home.logOut"),
              child: GestureDetector(
                onTap: () => authenticationMobx.logOut(),
                child: const Padding(
                  padding: EdgeInsets.only( right: 16 ),
                  child: FaIcon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    size: 16,
                  ),
                ),
              ),
            ),

          ],
          page: RefreshIndicator(
            onRefresh: () => mobx.refresh(),
            child: ( mobx.isLoading )
            ? const LoadingHouses()
            : ( mobx.listHouses.isEmpty )
            ? const EmptyPage(keyMessage: "pages.home.home.empty_page")
            : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: mobx.controllerScroll,
              itemCount: mobx.listHouses.length,
              itemBuilder: ( context, index ) {

                HouseEntity entity = mobx.listHouses[index];

                return Card(
                  margin: const EdgeInsets.symmetric( horizontal: 16, vertical: 5 ),
                  elevation: 2,
                  child: ListTile(
                    onTap: () => mobx.goToDetail(entity, false),
                    leading: FaIcon(
                      FontAwesomeIcons.houseChimney,
                      color: theme.colorScheme.onSecondary,
                      size: 20,
                    ),
                    title: Text(
                      entity.name,
                      style: theme.textTheme.headlineLarge,
                    ),
                    subtitle: Text(
                      FlutterI18n.translate(context, "pages.home.home.${ entity.active == 1 ? "active" : "not_active"}"),
                      style: theme.textTheme.displaySmall,
                    ),
                  ),
                );
              },

            ),
          ),
          function: () => mobx.goToDetail(null, true),
        );

      },
    );
  }
}

