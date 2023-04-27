// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:search_and_stay/app/core/style/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Image.asset(
            AppImages.logoDescription,
            width: 200,
          ),
        ),
      ),
    );
  }
}
