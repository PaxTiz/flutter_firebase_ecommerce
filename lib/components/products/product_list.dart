import 'package:ecommerce_app/components/products/product_item.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {

    final String title;
    const ProductList({@required this.title});

    @override
    Widget build(BuildContext context) {
        return StreamBuilder<List<Product>>(
            initialData: [],
            builder: (context, snapshot) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(title, style: Theme.of(context).textTheme.headline1,),
                    SizedBox(height: 16,),
                    if(snapshot.connectionState == ConnectionState.waiting) CircularProgressIndicator()
                    else if(snapshot.data.length == 0) Text("Aucun produit n'a été ajouté récemment...")
                    else Container(
                        height: 170,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: snapshot.data.length < 3 ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => ProductItem(product: snapshot.data[index],)
                        ),
                    ),
                ],
            ),
        );
    }

}
