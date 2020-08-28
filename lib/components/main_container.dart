import 'package:ecommerce_app/theme.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {

    final Widget child;
    const MainContainer({@required this.child});

    @override
    Widget build(BuildContext context) {
        return SingleChildScrollView(
            child: Container(
                color: kColorLightGrey,
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: child,
            )
        );
    }

}
