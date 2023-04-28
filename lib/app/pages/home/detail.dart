// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// import das telas
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';
import 'package:search_and_stay/app/pages/home/mobx/house.dart';

// import dos domain
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class DetailPage extends StatefulWidget {
  final HouseEntity? houseEntity;
  final bool isRegister;
  const DetailPage({ Key? key, required this.houseEntity, required this.isRegister }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  HouseMobx mobx = HouseMobx();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if ( !widget.isRegister ) {
      mobx.nameController = TextEditingController(text: widget.houseEntity!.name);
    }
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return Observer(
      builder: (builder) {

        return VerifyConnection(
          keyAppBar: ( widget.isRegister )
          ? "pages.home.detail.register_app_bar"
          : "pages.home.detail.detail_app_bar",
          actions: ( widget.isRegister )
          ? null
          : [
            GestureDetector(
              onTap: () => mobx.showAlert( widget.houseEntity!.id ),
              child: const Padding(
                padding: EdgeInsets.only( right: 16 ),
                child: FaIcon(
                  FontAwesomeIcons.trash,
                  size: 16,
                ),
              ),
            ),
          ],
          page: SingleChildScrollView(
            padding: const EdgeInsets.symmetric( horizontal: 16, vertical: 5 ),
            child: Column(
              children: [

                // name
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 25),
                  child: TextField(
                    controller: mobx.nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    style: theme.textTheme.bodyMedium!.apply(
                      fontSizeFactor: 1.2,
                    ),
                    decoration: InputDecoration(
                      labelText: FlutterI18n.translate(context, "pages.auth.name"),
                    ),
                  ),
                ),

                // ativo
                SwitchListTile(
                  title: Text(
                    FlutterI18n.translate(context, "pages.detail.active"),
                    style: theme.textTheme.headlineLarge,
                  ),
                  value: mobx.isActive,
                  activeColor: theme.colorScheme.tertiary,
                  // inactiveThumbColor: theme.colorScheme.primary,
                  inactiveTrackColor: theme.colorScheme.primary,
                  tileColor: Theme.of(context).scaffoldBackgroundColor,
                  onChanged: (value) => mobx.setActive(),
                ),

                // cadastrar / atualizar
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width - 130,
                  child: ElevatedButton(
                    onPressed: () => mobx.validateName(widget.isRegister, widget.houseEntity?.id),
                    child: Text(
                      FlutterI18n.translate(context, widget.isRegister ? "btn_register" : "btn_update"),
                      style: theme.textTheme.displayLarge,
                    ),
                  ),
                ),

              ],
            ),
          ),
        );

      },
    );
  }
}
