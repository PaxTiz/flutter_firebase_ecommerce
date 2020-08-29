import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme.dart';

import 'package:ecommerce_app/components/custom_app_bar.dart';
import 'package:ecommerce_app/components/main_container.dart';
import 'package:ecommerce_app/components/products/product_list.dart';
import 'package:ecommerce_app/components/categories/category_list.dart';
import 'package:ecommerce_app/services/products_service.dart';

class HomeScreen extends StatefulWidget {
    createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

    final ProductsService productsService = ProductsService();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: kColorWhite,
            appBar: CustomAppBar(title: "Shopping app"),
            body: MainContainer(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(height: 32,),
                        ProductList(title: "Derniers arrivages", stream: productsService.getLastAdded(),),
                        SizedBox(height: 32,),
                        ProductList(title: "Meilleures ventes", stream: productsService.getBestSelled(),),
                        SizedBox(height: 32,),
                        CategoryList(),
                        SizedBox(height: 32,),
                    ],
                )
            ),
        );
    }

}
