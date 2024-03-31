import 'package:digifood/buisness_logic/bloc/product/product_bloc.dart';
import 'package:digifood/data/repositories/product_repository.dart';
import 'package:digifood/data/web_services/product_web_service.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/screens/product/add_product_form.dart';
import 'package:digifood/presentation/screens/product/components/add_product_button.dart';
import 'package:digifood/presentation/screens/product/components/product_body.dart';
import 'package:digifood/presentation/screens/product/components/product_header.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductBloc productBloc =
      ProductBloc(ProductsRepository(ProductsWebServices()));

  @override
  void initState() {
    super.initState();
    productBloc.add(LoadProducts());
  }

  void showAddPanel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: mainColor,
      builder: (context) {
        return SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddProductForm(
              onAddProduct: () {
                productBloc.add(LoadProducts());
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        appBar: const ProductAppBar(),
        body: ProductListBody(productBloc: productBloc),
        floatingActionButton:
            AddProductButton(onPressAddProduct: showAddPanel));
  }
}
