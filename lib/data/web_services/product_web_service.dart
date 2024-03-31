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

  Future<void> addMultipleProductsToDatabase() async {
    try {
      List<Map<String, dynamic>> productsData = [
        {
          'name': 'Sugar',
          'price': 5.99,
          'description': 'High quality refined sugar for your sweet cravings.'
        },
        {
          'name': 'Coffee Beans',
          'price': 12.49,
          'description':
              'Freshly roasted Arabica coffee beans for the perfect brew.'
        },
        {
          'name': 'Olive Oil',
          'price': 8.99,
          'description': 'Extra virgin olive oil, ideal for cooking and salads.'
        },
        {
          'name': 'Tea Bags',
          'price': 4.99,
          'description':
              'A selection of premium tea bags for a soothing experience.'
        },
        {
          'name': 'Chocolate Bar',
          'price': 2.99,
          'description':
              'Delicious milk chocolate bar for moments of indulgence.'
        },
        {
          'name': 'Whole Wheat Bread',
          'price': 3.49,
          'description': 'Nutritious whole wheat bread, perfect for sandwiches.'
        },
        {
          'name': 'Organic Eggs',
          'price': 6.99,
          'description':
              'Farm-fresh organic eggs, rich in protein and nutrients.'
        },
        {
          'name': 'Tomato Sauce',
          'price': 1.99,
          'description': 'Flavorful tomato sauce for pasta dishes and pizzas.'
        },
        {
          'name': 'Almonds',
          'price': 9.99,
          'description':
              'Roasted almonds, a healthy snack packed with nutrients.'
        },
        {
          'name': 'Apple Juice',
          'price': 3.99,
          'description':
              'Pure apple juice, free from additives and preservatives.'
        },
        {
          'name': 'Yogurt',
          'price': 2.49,
          'description': 'Creamy yogurt, perfect for breakfast or as a snack.'
        },
        {
          'name': 'Cheddar Cheese',
          'price': 7.99,
          'description':
              'Sharp cheddar cheese, great for sandwiches and cheese platters.'
        },
        {
          'name': 'Frozen Pizza',
          'price': 5.49,
          'description':
              'Convenient frozen pizza, ready to bake for a quick meal.'
        },
        {
          'name': 'Lemonade Mix',
          'price': 4.49,
          'description': 'Refreshing lemonade mix, perfect for hot summer days.'
        },
        {
          'name': 'Granola Bars',
          'price': 3.99,
          'description':
              'Healthy granola bars, packed with oats, nuts, and dried fruits.'
        },
        {
          'name': 'Honey',
          'price': 6.49,
          'description': 'Pure honey, harvested from local bee farms.'
        },
        {
          'name': 'Chicken Breast',
          'price': 10.99,
          'description':
              'Boneless, skinless chicken breast, great for grilling or baking.'
        },
        {
          'name': 'Pasta',
          'price': 2.29,
          'description':
              'Assorted pasta varieties, perfect for creating delicious Italian dishes.'
        },
        {
          'name': 'Milk',
          'price': 1.99,
          'description': 'Fresh milk, rich in calcium and essential nutrients.'
        },
        {
          'name': 'Salmon Fillet',
          'price': 13.99,
          'description':
              'Fresh salmon fillet, ideal for pan-searing or grilling.'
        },
        // Add more products as needed
      ];

      for (var data in productsData) {
        String id = FirebaseFirestore.instance.collection('products').doc().id;
        Product product = Product(
          id: id,
          name: data['name'],
          price: data['price'],
          description: data['description'],
        );

        await FirebaseFirestore.instance
            .collection('products')
            .doc(id)
            .set(product.toMap());
      }
    } catch (e) {
      print('Error adding products: $e');
    }
  }
}
