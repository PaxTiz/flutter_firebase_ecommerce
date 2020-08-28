import 'package:ecommerce_app/components/products/product_list.dart';
import 'package:ecommerce_app/services/products_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/products.dart';
import 'package:ecommerce_app/services/categories_service.dart';

import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product.dart';

import 'package:ecommerce_app/components/categories/category_list.dart';
import 'package:ecommerce_app/components/custom_app_bar.dart';
import 'package:ecommerce_app/components/main_container.dart';

class HomeScreen extends StatefulWidget {
    createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                StreamProvider<List<Category>>(
                    create: (_) => CategoriesService().getAll(),
                    initialData: []
                ),
                StreamProvider<List<Product>>(
                    create: (_) => ProductsService().getLastAdded(),
                    initialData: [],
                ),
                StreamProvider<List<Product>>(
                    create: (_) => ProductsService().getLastAdded(),
                    initialData: [],
                ),
            ],
            child: Scaffold(
                backgroundColor: kColorWhite,
                appBar: CustomAppBar(title: "Shopping app"),
                body: MainContainer(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            SizedBox(height: 32,),
                            ProductList(title: "Derniers arrivages"),
                            SizedBox(height: 32,),
                            _buildBestSelledProducts(context),
                            SizedBox(height: 32,),
                            CategoryList(),
                            SizedBox(height: 32,),
                        ],
                    )
                ),
            ),
        );
    }

    Widget _buildBestSelledProducts(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text("Meilleures ventes", style: Theme.of(context).textTheme.headline1,),
                SizedBox(height: 16,),
                Container(
                    height: 170,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: products.length < 3 ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
                        itemCount: products.length,
                        itemBuilder: (context, index) => _buildListItem(context, products[index]),
                    ),
                )
            ],
        );
    }

    Widget _buildListItem(BuildContext context, Product p) {
        return Container(
            width: MediaQuery.of(context).size.width / 2 - (16 + 8),
            height: 170,
            margin: EdgeInsets.only(right: 16),
            decoration: listItemDecoration,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Image.network(p.images[0], width: double.infinity, height: 100,),
                    SizedBox(height: 8,),
                    Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text("${p.price}€", style: productPriceTextStyle,),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(p.name, style: productNameTextStyle,),
                    ),
                ],
            )
        );
    }

}
