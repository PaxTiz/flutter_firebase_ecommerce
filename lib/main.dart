import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/tab_bar_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/login_screen.dart';

import 'theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
              print(snapshot.error);
          }
          if(snapshot.connectionState == ConnectionState.done) {
              return Application();
          }
          return CircularProgressIndicator();
        },
    );
  }
}

class Application extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            initialRoute: '/login',
            routes: {
                '/home': (context) => TabBarScreen(),
                '/login': (context) => LoginScreen(),
                '/register': (context) => RegisterScreen(),
            },
            home: TabBarScreen(),
        );
    }

}
