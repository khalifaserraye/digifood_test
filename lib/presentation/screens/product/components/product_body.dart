import 'package:digifood/buisness_logic/bloc/product/product_bloc.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/screens/product/components/product_tile.dart';
import 'package:digifood/presentation/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListBody extends StatefulWidget {
  final ProductBloc productBloc;

  const ProductListBody({super.key, required this.productBloc});

  @override
  State<ProductListBody> createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody> {
  bool _toastShown = false;

  @override
  Widget build(BuildContext context) {
    // BlocBuilder to rebuild the UI based on the state changes in the product bloc
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        // If the state is LoadedState, display the list of products
        if (state is LoadedState) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return BlocListener<ProductBloc, ProductState>(
                listener: (context, state) {
                  // Show toast message when a product is successfully deleted or when an error occurs during deletion
                  if (!_toastShown) {
                    if (state is DeleteSuccessfulState) {
                      showToast(message: "Product deleted successfully");
                    } else if (state is DeleteErrorState) {
                      showToast(message: state.error);
                    }
                    _toastShown = true;
                  }
                },
                child: ProductTile(
                  product: state.allProducts[index],
                  onDeleteProduct: () {
                    // Dispatch DeleteEvent when a product is deleted
                    widget.productBloc
                        .add(DeleteEvent(state.allProducts[index].id));
                    _toastShown = false;
                  },
                ),
              );
            },
            itemCount: state.allProducts.length,
          );
        }
        // If the state is EmptyState, display a message indicating no products available
        else if (state is EmptyState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.production_quantity_limits_outlined,
                  size: 100.r,
                  color: mainColor,
                ),
                SizedBox(height: 20.h),
                Text(
                  'No products available',
                  style: TextStyle(fontSize: 18.r, color: mainColor),
                ),
              ],
            ),
          );
        }
        // If the state is LoadingState or InitialState, display a loading indicator
        else if (state is LoadingState || state is InitialState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.r,
                  height: 100.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 12.r,
                    backgroundColor: mainColor,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(backgroundColor),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Loading products ...',
                  style: TextStyle(fontSize: 18.r, color: mainColor),
                ),
              ],
            ),
          );
        }
        // If the state is LoadErrorState, display an error message
        else if (state is LoadErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 100.r,
                  color: mainColor,
                ),
                SizedBox(height: 20.h),
                Text(
                  state.error,
                  style: TextStyle(fontSize: 18.r, color: mainColor),
                ),
              ],
            ),
          );
        }
        // If none of the above states match, display a generic error message
        else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 100.r,
                  color: mainColor,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Something went wrong!",
                  style: TextStyle(fontSize: 18.r, color: mainColor),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
