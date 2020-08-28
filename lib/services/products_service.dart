import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/product.dart';

class ProductsService {

    final FirebaseFirestore instance = FirebaseFirestore.instance;

    Stream<List<Product>> getLastAdded() {
        return instance.collection("products")
            .orderBy("created_at", descending: true)
            .limit(10)
            .snapshots()
            .map((snapshots) => snapshots.docs
                .map((QueryDocumentSnapshot doc) => Product.fromFirebase(doc))
                .toList()
            );
    }

    Stream<List<Product>> getBestSelled() {
        // TODO: Get best selled products using orders collection
        return instance.collection("products")
            .orderBy("created_at", descending: true)
            .limit(10)
            .snapshots()
            .map((snapshots) => snapshots.docs
                .map((QueryDocumentSnapshot doc) => Product.fromFirebase(doc))
                .toList()
            );
    }

}
