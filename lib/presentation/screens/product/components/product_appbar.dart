import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.r,
      backgroundColor: backgroundColor,
      title: Text(
        "Products",
        style: TextStyle(
            color: mainColor, fontSize: 20.r, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
