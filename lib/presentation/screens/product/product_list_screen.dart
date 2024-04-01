import 'package:digifood/presentation/screens/product/components/product_appbar.dart';
import 'package:digifood/presentation/screens/product/components/product_body.dart';
import 'package:flutter/material.dart';
import 'package:digifood/buisness_logic/bloc/product/product_bloc.dart';
import 'package:digifood/data/repositories/product_repository.dart';
import 'package:digifood/data/web_services/product_web_service.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/screens/product/components/add_product_form.dart';
import 'package:digifood/presentation/screens/product/components/add_product_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListState();
}

class _ProductListState extends State<ProductListScreen> {
  final ProductBloc productBloc =
      ProductBloc(ProductsRepository(ProductsWebServices()));

  @override
  void initState() {
    super.initState();
    // Dispatch LoadEvent to load products when the screen initializes
    productBloc.add(LoadEvent());
  }

  // Function to show the bottom sheet for adding a new product
  void showAddPanel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      backgroundColor: backgroundColor,
      builder: (context) {
        return SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddProductForm(
              productBloc: productBloc,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Close the product bloc when the screen is disposed
    productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productBloc,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: const ProductAppBar(),
        body: ProductListBody(productBloc: productBloc),
        floatingActionButton:
            AddProductButton(onAddProductPressed: showAddPanel),
      ),
    );
  }
}
