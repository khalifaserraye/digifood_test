// product_state.dart

part of 'product_bloc.dart';

abstract class ProductState {}

class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class LoadedState extends ProductState {
  final List<Product> allProducts;

  LoadedState({required this.allProducts});
}

class ErrorState extends ProductState {
  final String error;
  ErrorState({required this.error});
}

class EmptyState extends ProductState {}
