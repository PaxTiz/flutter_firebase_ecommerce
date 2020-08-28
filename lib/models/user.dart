import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppUser {

    final String uid;
    final String email;
    final String firstname;
    final String lastname;

    const AppUser({
        @required this.uid,
        @required this.email,
        @required this.firstname,
        @required this.lastname
    });

    String get fullName => "$firstname $lastname";

    static AppUser fromFirebaseUser(UserCredential user) {
        return AppUser(
            uid: user.user.uid,
            email: user.user.email,
            firstname: null,
            lastname: null
        );
    }

    static Map<String, dynamic> toMap(AppUser user) {
        return {
            'uid': user.uid,
            'email': user.email,
            'firstname': user.firstname,
            'lastname': user.lastname
        };
    }

}
