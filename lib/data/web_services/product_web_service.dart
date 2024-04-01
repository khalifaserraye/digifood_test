import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifood/data/models/product.dart';

class ProductsWebServices {
  final CollectionReference<Map<String, dynamic>> _productsCollection =
      FirebaseFirestore.instance.collection('products');

  // Fetches all products from Firestore
  Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _productsCollection.get();

      return querySnapshot.docs.map((doc) {
        String id = doc.id;
        String name = doc['name'];
        double price = doc['price'];
        String description = doc['description'];

        return Product(
          id: id,
          name: name,
          price: price,
          description: description,
        );
      }).toList();
    } catch (e) {
      throw "Failed to fetch products"; // Throws an error if fetching fails
    }
  }

  // Adds a product to Firestore
  Future<void> addProduct(Map<String, dynamic> product) async {
    try {
      await _productsCollection.add(product); // Adds the product to Firestore
    } catch (e) {
      throw "Failed to add product"; // Throws an error if adding fails
    }
  }

  // Deletes a product from Firestore
  Future<void> deleteProduct(String productId) async {
    try {
      await _productsCollection
          .doc(productId)
          .delete(); // Deletes the product from Firestore
    } catch (e) {
      throw "Failed to delete product"; // Throws an error if deletion fails
    }
  }
}
