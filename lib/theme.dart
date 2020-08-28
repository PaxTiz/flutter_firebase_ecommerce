import 'package:flutter/material.dart';

final kColorBlack = Color.fromRGBO(44, 62, 80, 1);
final kColorWhite = Colors.white;
final kColorOrange = Color.fromRGBO(243, 156, 18, 1);
final kColorLightGrey = Color.fromRGBO(236, 240, 241, 1);
final kColorDarkGrey = Color.fromRGBO(189, 195, 199, .4);
final kColorRed = Color.fromRGBO(231, 76, 60, 1);

final theme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kColorOrange,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            fontFamily: "Montserrat",
            color: kColorBlack
        ),
    ),
);

final appBarTitleStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: kColorBlack
);

final tabBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold
);

final listItemDecoration = BoxDecoration(
    color: kColorDarkGrey,
    borderRadius: BorderRadius.circular(32),
);

final productPriceTextStyle = TextStyle(
    fontFamily: "Raleway",
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: kColorOrange
);
final productNameTextStyle = TextStyle(
    fontFamily: "Raleway",
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: kColorBlack
);
final categoryTextStyle = TextStyle(
    fontFamily: "Raleway",
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: kColorWhite
);

// Login & Register
final authMainTextStyle = TextStyle(
    fontSize: 18,
    color: kColorBlack,
    fontFamily: "Raleway"
);

// Form errors
final formErrorTextStyle = TextStyle(
    fontSize: 18,
    color: kColorRed,
    fontFamily: "Raleway",
    fontWeight: FontWeight.bold
);

// Buttons
final flatButtonTextStyle = formErrorTextStyle.copyWith(
    fontSize: 14,
    color: kColorOrange
);
