import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductAppBar({super.key, required});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: SizedBox(
        width: 100,
        height: 30,
        child: Image.network(
          "https://assets-global.website-files.com/6514058c6f47d385996dc236/652935c86ef0a823ba1f9341_Logo-digifood-blue.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
