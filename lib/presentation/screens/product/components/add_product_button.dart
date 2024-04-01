import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductButton extends StatelessWidget {
  final VoidCallback onAddProductPressed;
  const AddProductButton({super.key, required this.onAddProductPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onAddProductPressed();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.r)),
      backgroundColor: mainColor,
      child: Icon(
        size: 24.r,
        Icons.add,
        color: backgroundColor,
      ),
    );
  }
}
