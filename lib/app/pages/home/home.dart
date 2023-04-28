// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/pages/home/widget/loading_houses.dart';
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';
import 'package:search_and_stay/app/pages/home/cubit/home_cubit.dart';
import 'package:search_and_stay/app/core/widgets/empty_page.dart';

// import dos pacotes
import 'package:search_and_stay/domain/source/local/injection/injection.dart';
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return VerifyConnection(
      keyAppBar: "pages.home.app_bar",
      page: BlocProvider(
        create: (create) => getIt<HomeCubit>(),
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: ( builder, state ) {

            final bloc = BlocProvider.of<HomeCubit>(builder);

            if ( state is HomeInitial ) {
              bloc.getHouses();
              return const LoadingHouses();
            } else if ( state is HomeStateLoading ) {
              return const LoadingHouses();
            } else if ( state is HomeStateError ) {
              return const EmptyPage(keyMessage: "pages.home.home.empty_page");
            } else if ( state is HomeStateLoaded ) {

              return RefreshIndicator(
                onRefresh: () => bloc.getHouses(),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.listHouses.length,
                  itemBuilder: ( context, index ) {

                    if ( state.listHouses.isEmpty ) {
                      return const EmptyPage(keyMessage: "pages.home.home.empty_page");
                    }

                    HouseEntity entity = state.listHouses[index];

                    return Card(
                      margin: const EdgeInsets.symmetric( horizontal: 16, vertical: 5 ),
                      elevation: 3,
                      child: ListTile(
                        onTap: () => bloc.goToDetail(entity, false),
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
              );

            }

            return FloatingActionButton(
              onPressed: () => bloc.goToDetail(null, true),
              child: const FaIcon(
                FontAwesomeIcons.plus,
                size: 18,
              ),
            );

          },
        ),
      ),
    );
  }
}
