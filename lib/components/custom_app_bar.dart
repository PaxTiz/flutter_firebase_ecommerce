import 'package:ecommerce_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

    final String title;
    const CustomAppBar({@required this.title}) : assert(title.length > 0);

    @override
    Widget build(BuildContext context) {
        return AppBar(
            backgroundColor: Colors.white,
            title: Text(title.toUpperCase(), style: appBarTitleStyle,),
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
                IconButton(
                    icon: Icon(CupertinoIcons.search, color: kColorBlack),
                    onPressed: () {},
                ),
            ],
        );
    }

  @override
  Size get preferredSize => Size(300, 50);

}
