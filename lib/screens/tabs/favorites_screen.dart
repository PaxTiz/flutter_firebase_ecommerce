import 'package:ecommerce_app/components/custom_app_bar.dart';
import 'package:ecommerce_app/components/main_container.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: CustomAppBar(title: "Mes favoris"),
            body: MainContainer(child: Text("mon container")),
        );
    }

}
