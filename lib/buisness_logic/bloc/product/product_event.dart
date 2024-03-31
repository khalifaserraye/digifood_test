// product_event.dart

part of 'product_bloc.dart';

abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Product productToAdd;

  AddProduct(this.productToAdd);
}

class DeleteProduct extends ProductEvent {
  final String productToDeleteId;

  DeleteProduct(this.productToDeleteId);
}
