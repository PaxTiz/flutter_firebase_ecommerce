import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/category.dart';

class CategoriesService {

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    Stream<List<Category>> getAll() {
        return firestore.collection("categories").snapshots().map((snapshot) =>
            snapshot.docs.map((QueryDocumentSnapshot doc) => Category.fromFirebase(doc)).toList()
        );
    }

}
