import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifood/data/models/product.dart';

class ProductsWebServices {
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      for (var doc in querySnapshot.docs) {
        String id = doc.id;
        String name = doc['name'];
        double price = doc['price'];
        String description = doc['description'];

        Product product =
            Product(id: id, name: name, price: price, description: description);
        products.add(product);
      }
    } catch (e) {}

    return products;
  }

  Future<void> addProduct(Product product) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .add(product.toMap());
    } catch (e) {}
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .delete();
    } catch (e) {}
  }
}
