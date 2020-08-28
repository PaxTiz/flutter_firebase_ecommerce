import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/category.dart';

import '../../theme.dart';

class CategoryRow extends StatelessWidget {

    final Category category;
    const CategoryRow({@required this.category});

    @override
    Widget build(BuildContext context) {
        return Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: kColorOrange
            ),
            child: Center(child: Text(category.name, style: categoryTextStyle,),),
        );
    }

}
