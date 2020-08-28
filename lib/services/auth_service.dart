import 'package:ecommerce_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

    static User get currentUser => FirebaseAuth.instance.currentUser;
    static bool get isAuth => currentUser != null;

    static Future login({String email, String password}) async {
        try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email, password: password
            );
            return userCredential.user;
        } catch (e) {
            if (e.code == 'user-not-found') {
                return Future.error("No user found for that email.");
            } else if (e.code == 'wrong-password') {
                return Future.error("Wrong password provided for that email.");
            }
        }
    }

    static Future register({String email, String password}) async {
        try {
            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email, password: password
            ).then((createdUser) {
                AppUser user = AppUser.fromFirebaseUser(createdUser);
                FirebaseFirestore.instance.collection("users").doc(user.uid).set(AppUser.toMap(user));

                return createdUser;
            });
            return userCredential.user;
        } catch(e) {
            if (e.code == 'weak-password') {
                return Future.error('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
                return Future.error('The account already exists for that email.');
            }
        }
    }

    static Future<bool> logout() async {
        try {
            FirebaseAuth.instance.signOut();
            return true;
        } catch(e) {
            return Future.error(false);
        }
    }

}
