import 'package:digifood/data/models/product.dart';
import 'package:digifood/data/web_services/product_web_service.dart';

class ProductsRepository {
  final ProductsWebServices productsWebServices;

  ProductsRepository(this.productsWebServices);

  Future<List<Product>> getAllProducts() async {
    dynamic productsData = await productsWebServices.getAllProducts();
    return productsData;
  }

  Future<void> addProduct(Product productToAdd) async {
    await productsWebServices.addProduct(productToAdd);
  }

  Future<void> deleteProduct(String productToDeleteId) async {
    await productsWebServices.deleteProduct(productToDeleteId);
  }
}
