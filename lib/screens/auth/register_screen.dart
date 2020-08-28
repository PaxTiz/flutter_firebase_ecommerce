import 'package:ecommerce_app/utils/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
    createState() => _Register();
}

class _Register extends State<RegisterScreen> {

    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _passConfController = TextEditingController();
    String errorMsg = "";

    @override
    void initState() {
        if(AuthService.isAuth) {
            Future.delayed(Duration(milliseconds: 0)).then((_) {
                Navigator.pushReplacementNamed(context, "/home");
            });
        }
        super.initState();
    }

    void register() {
        if(_formKey.currentState.validate()) {
            AuthService.register(
                email: _emailController.value.text,
                password: _passwordController.value.text,
            )
            .then((_) => Navigator.pushReplacementNamed(context, "/home"))
            .catchError((err) => setState(() => errorMsg = err.toString()));
        }
    }

    Text buildErrorMessage() {
        return Text(errorMsg, style: formErrorTextStyle,);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: kColorLightGrey,
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Image.asset("assets/images/amazon-logo.png", width: MediaQuery.of(context).size.width / 2,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text("Hello unknown !", style: authMainTextStyle,),
                                Text("We are happy to see you in Shopping App !", style: authMainTextStyle.copyWith(fontWeight: FontWeight.bold),)
                            ],
                        ),
                        if(errorMsg != "") buildErrorMessage(),
                        Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            labelText: "E-mail"
                                        ),
                                        validator: FormValidation.validateEmail,
                                    ),
                                    TextFormField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            labelText: "Password"
                                        ),
                                        obscureText: true,
                                        validator: FormValidation.validatePassword,
                                    ),
                                    TextFormField(
                                        controller: _passConfController,
                                        decoration: InputDecoration(
                                            labelText: "Repeat password"
                                        ),
                                        obscureText: true,
                                        validator: (value) => value != _passwordController.value.text
                                            ? "Les mots de passe ne sont pas identiques."
                                            : null,
                                    ),
                                    RaisedButton(
                                        onPressed: register,
                                        child: Text("Create an account"),
                                        color: kColorOrange,
                                    )
                                ],
                            ),
                        ),
                        FlatButton(
                            child: Text(
                                "I already have an account",
                                style: TextStyle(
                                    color: kColorOrange,
                                    fontWeight: FontWeight.bold
                                ),
                            ),
                            onPressed: () => Navigator.pop(context),
                        )
                    ],
                ),
            ),
        );
    }

}
