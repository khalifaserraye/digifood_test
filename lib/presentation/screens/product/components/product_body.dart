import 'package:digifood/buisness_logic/bloc/product/product_bloc.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/screens/product/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListBody extends StatefulWidget {
  final ProductBloc productBloc;
  const ProductListBody({super.key, required this.productBloc});

  @override
  State<ProductListBody> createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.productBloc,
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ProductTile(
                  product: state.allProducts[index],
                  onDelete: () {
                    widget.productBloc.add(LoadProducts());
                  },
                );
              },
              itemCount: state.allProducts.length,
            );
          } else if (state is EmptyState) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.production_quantity_limits_outlined,
                    size: 100,
                    color: mainColor,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No products available',
                    style: TextStyle(fontSize: 18, color: mainColor),
                  ),
                ],
              ),
            );
          } else if (state is ErrorState) {
            return Text(state.error);
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 12,
                      backgroundColor: mainColor,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(backgroundColor),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Loading products ...',
                    style: TextStyle(fontSize: 18, color: mainColor),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
