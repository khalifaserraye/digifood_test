import 'package:digifood/presentation/screens/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'key',
    appId: 'AIzaSyDsWZRN5nXNnuDYjyP7XkTjRScHvT8tzGc',
    messagingSenderId: '28956210325',
    projectId: 'digifood-36787',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductList(),
    );
  }
}
