import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {

    final String name;
    final double price;
    final String description;
    final bool washable;
    final int washableTemp;
    final List<ProductMaterial> materials;
    final List<String> images;
    const Product({
        @required this.name,
        @required this.price,
        @required this.description,
        @required this.washable,
        @required this.washableTemp,
        @required this.materials,
        @required this.images
    });

    factory Product.fromFirebase(QueryDocumentSnapshot snapshot) {
        return Product(
            name: snapshot.data()["name"].toString(),
            price: double.parse(snapshot.data()["price"].toString()),
            description: snapshot.data()["description"].toString(),
            washable: snapshot.data()["name"].toString() == "true" ? true : false,
            washableTemp: int.parse(snapshot.data()["washable_temp"].toString()),
            materials: snapshot.data()["materials"].map<ProductMaterial>(
                (doc) => ProductMaterial.fromFirebase(doc as Map)
            ).toList() as List<ProductMaterial>,
            images: List<String>.from(snapshot.data()["images"] as List)
        );
    }

}

class ProductMaterial {

    final String name;
    final int percentage;
    const ProductMaterial({@required this.name, @required this.percentage});

    factory ProductMaterial.fromFirebase(Map<dynamic, dynamic> snapshot) {
        return ProductMaterial(
            name: snapshot["name"].toString(),
            percentage: int.parse(snapshot["percentage"].toString())
        );
    }

}
