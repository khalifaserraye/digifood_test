import 'package:digifood/data/models/product.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTile extends StatefulWidget {
  final Product product;

  final VoidCallback onDeleteProduct;

  const ProductTile(
      {super.key, required this.product, required this.onDeleteProduct});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Card(
        color: listTileColor,
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 20.r,
            backgroundImage:
                const AssetImage('assets/images/digifood_logo.png'),
          ),
          title: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14.r,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.product.name,
                ),
                TextSpan(
                  text: ' ${widget.product.price} €',
                  style: const TextStyle(
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Text(
            widget.product.description,
            style: TextStyle(fontSize: 12.r, color: mainColor),
          ),
          trailing: IconButton(
            icon: Icon(
              size: 20.r,
              Icons.delete,
            ),
            onPressed: () async {
              widget.onDeleteProduct();
            },
          ),
        ),
      ),
    );
  }
}
