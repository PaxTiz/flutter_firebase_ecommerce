import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class ProductItem extends StatelessWidget {

    final Product product;
    const ProductItem({@required this.product});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: MediaQuery.of(context).size.width / 2 - (16 + 8),
            height: 170,
            margin: EdgeInsets.only(right: 16),
            decoration: listItemDecoration,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Image.network(product.images[0], width: double.infinity, height: 100,),
                    SizedBox(height: 8,),
                    Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text("${product.price}€", style: productPriceTextStyle,),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(product.name, style: productNameTextStyle,),
                    ),
                ],
            )
        );
    }

}
