// ignore_for_file: library_private_types_in_public_api

import 'package:digifood/data/models/product.dart';
import 'package:digifood/data/web_services/product_web_service.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/shared/toast_message.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  final VoidCallback onAddProduct;

  const AddProductForm({super.key, required this.onAddProduct});

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _price;
  late String _description;

  final _textInputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(), // Add an empty BorderSide
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
          color: secondaryColor), // Specify a color for focused border
    ),
    labelStyle: const TextStyle(color: mainFontColor),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            const Text("Add product",
                style: TextStyle(
                    color: mainFontColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              decoration:
                  _textInputDecoration.copyWith(labelText: "Product Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter product name';
                }
                return null;
              },
              onSaved: (value) => _name = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: _textInputDecoration.copyWith(labelText: 'Price'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || double.tryParse(value) == null) {
                  return 'Please enter a valid price';
                }
                return null;
              },
              onSaved: (value) => _price = double.parse(value!),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration:
                  _textInputDecoration.copyWith(labelText: 'Description'),
              maxLines: null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter product description';
                }
                return null;
              },
              onSaved: (value) => _description = value!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: mainFontColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final product = Product(
                      name: _name,
                      price: _price,
                      description: _description,
                    );
                    ProductsWebServices().addProduct(product);
                    showToast(
                        message: "Product added successfully",
                        status: ToastStatus.Success);
                    widget.onAddProduct();
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
