import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/custom_app_bar.dart';
import 'package:ecommerce_app/components/main_container.dart';
import 'package:ecommerce_app/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
    createState() => _Profile();
}

class _Profile extends State<ProfileScreen> {

    void logout() {
        AuthService.logout()
            .then((_) => Navigator.pushReplacementNamed(context, "/home"))
            .catchError((err) => showDialog(context: context, child: Text("Déconnexion impossible. Veuillez réessayer plus tard.")));
    }

    void redirectToLogin() {
        Navigator.pushReplacementNamed(context, "/login");
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: CustomAppBar(title: "Mon profile"),
            body: MainContainer(
                child: Column(
                    children: [
                        AuthService.isAuth ? RaisedButton.icon(
                            onPressed: logout,
                            icon: Icon(Icons.verified_user),
                            label: Text("Déconnexion")
                        ) : RaisedButton.icon(
                            onPressed: redirectToLogin,
                            icon: Icon(Icons.supervised_user_circle),
                            label: Text("Connexion")
                        )
                    ],
                )
            ),
        );
    }

}
