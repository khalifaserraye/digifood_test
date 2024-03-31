// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:digifood/data/models/product.dart';
import 'package:digifood/data/web_services/product_web_service.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  final VoidCallback onDelete;

  const ProductTile({super.key, required this.product, required this.onDelete});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: listTileColor,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: mainColor,
            radius: 25.0,
            backgroundImage: AssetImage('assets/images/digifood_logo.png'),
          ),
          title: Text(
            '${widget.product.name} | ${widget.product.price} \$',
            style: TextStyle(
              color: mainFontColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          subtitle: Text(
            widget.product.description,
            style: TextStyle(fontSize: 14, color: mainFontColor),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              // color: avertissementColor,
            ),
            onPressed: () async {
              await ProductsWebServices().deleteProduct(widget.product.id!);
              widget.onDelete();
            },
          ),
        ),
      ),
    );
  }
}
