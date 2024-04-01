import 'package:digifood/data/models/product.dart';
import 'package:digifood/data/web_services/product_web_service.dart';

class ProductsRepository {
  final ProductsWebServices productsWebServices;

  ProductsRepository(this.productsWebServices);

  // Fetches all products from the web service
  Future<List<Product>> getAllProducts() async {
    try {
      final List<Product> products = await productsWebServices.getAllProducts();
      return products;
    } catch (e) {
      rethrow; // Rethrows the exception to propagate it to the caller
    }
  }

  // Adds a product using the web service
  Future<void> addProduct(Product productToAdd) async {
    try {
      await productsWebServices.addProduct(productToAdd.toMap());
    } catch (e) {
      rethrow; // Rethrows the exception to propagate it to the caller
    }
  }

  // Deletes a product using the web service
  Future<void> deleteProduct(String productId) async {
    try {
      await productsWebServices.deleteProduct(productId);
    } catch (e) {
      rethrow; // Rethrows the exception to propagate it to the caller
    }
  }
}
