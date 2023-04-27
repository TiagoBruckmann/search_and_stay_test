// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/core/widgets/verify_connection.dart';

class DetailPage extends StatefulWidget {
  final bool isRegister;
  const DetailPage({ Key? key, required this.isRegister }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return VerifyConnection(
      keyAppBar: ( widget.isRegister )
      ? "pages.home.detail.register_app_bar"
      : "pages.home.detail.detail_app_bar",
      page: const Center(
        child: Text("Detail"),
      ),
    );
  }
}
