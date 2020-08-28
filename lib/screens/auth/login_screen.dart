import 'package:ecommerce_app/utils/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
    createState() => _Login();
}

class _Login extends State<LoginScreen> {

    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
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

    void login() async {
        if(_formKey.currentState.validate()) {
            AuthService.login(
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
                                Text("Welcome back !", style: authMainTextStyle,),
                                Text("Sign in to continue to Shopping App !", style: authMainTextStyle.copyWith(fontWeight: FontWeight.bold),)
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
                                    ),
                                    RaisedButton(
                                        onPressed: login,
                                        child: Text("Login"),
                                        color: kColorOrange,
                                    )
                                ],
                            ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Row(
                                    children: [
                                        Text("Don't have an account ?"),
                                        FlatButton(
                                            child: Text(
                                                "Sign up here",
                                                style: flatButtonTextStyle,
                                            ),
                                            onPressed: () => Navigator.pushNamed(context, "/register"),
                                        )
                                    ],
                                ),
                                FlatButton(
                                    onPressed: () {},
                                    child: Text("I forgot my password", style: flatButtonTextStyle,),
                                )
                            ],
                        )
                    ],
                ),
            ),
        );
    }

}
