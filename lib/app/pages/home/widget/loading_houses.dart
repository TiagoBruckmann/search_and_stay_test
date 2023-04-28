// imports nativos do flutter
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingHouses extends StatelessWidget {
  const LoadingHouses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, index) {
        return Card(
          margin: const EdgeInsets.symmetric( horizontal: 16, vertical: 5 ),
          elevation: 2,
          child: ListTile(
            leading: Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey[50]!,
              colorOpacity: 0.3,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: FaIcon(
                FontAwesomeIcons.houseChimney,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 20,
              ),
            ),
            title: Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey[50]!,
              colorOpacity: 0.3,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Container(
                height: 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black38,
                ),
              ),
            ),
            subtitle: Shimmer(
              duration: const Duration(seconds: 5),
              color: Colors.grey[50]!,
              colorOpacity: 0.3,
              enabled: true,
              direction: const ShimmerDirection.fromLTRB(),
              child: Container(
                height: 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}