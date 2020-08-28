import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category {

    final String name;
    const Category({@required this.name});

    static Category fromFirebase(QueryDocumentSnapshot snapshot) {
        return Category(name: snapshot.data()["name"].toString());
    }

}
