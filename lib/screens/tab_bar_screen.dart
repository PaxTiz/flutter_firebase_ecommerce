import 'package:ecommerce_app/screens/tabs/favorites_screen.dart';
import 'package:ecommerce_app/screens/tabs/home_screen.dart';
import 'package:ecommerce_app/screens/tabs/profile_screen.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabBarScreen extends StatefulWidget {
    createState() => _TabBarScreen();
}

class _TabBarScreen extends State<TabBarScreen> {

    int _currentIndex = 0;

    final tabs = [
        HomeScreen(),
        FavoritesScreen(),
        HomeScreen(),
        ProfileScreen(),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: tabs[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: kColorBlack,
                selectedItemColor: kColorOrange,
                unselectedItemColor: kColorWhite,
                showUnselectedLabels: false,
                currentIndex: _currentIndex,
                onTap: (index) => setState(() => _currentIndex = index),
                items: [
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home),
                        title: Text("Home", style: tabBarTextStyle,)
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.heart),
                        title: Text("Favorites", style: tabBarTextStyle,)
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.shopping_cart),
                        title: Text("Cart", style: tabBarTextStyle,)
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.profile_circled),
                        title: Text("Profile", style: tabBarTextStyle,)
                    ),
                ],
            ),
        );
    }

}
