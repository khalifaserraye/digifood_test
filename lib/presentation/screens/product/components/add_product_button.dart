import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatelessWidget {
  final VoidCallback onPressAddProduct;
  const AddProductButton({super.key, required this.onPressAddProduct});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressAddProduct();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      backgroundColor: mainColor,
      child: const Icon(
        Icons.add,
        color: backgroundColor,
      ),
    );
  }
}
