part of 'product_bloc.dart'; // Indicates that this file is part of the product_bloc.dart file

// Abstract class representing events related to products
abstract class ProductEvent {}

// Event to load products
class LoadEvent extends ProductEvent {}

// Event to add a product
class AddEvent extends ProductEvent {
  final Product productToAdd; // Product to add

  // Constructor for AddEvent
  AddEvent(this.productToAdd);
}

// Event to delete a product
class DeleteEvent extends ProductEvent {
  final String productToDeleteId; // ID of the product to delete

  // Constructor for DeleteEvent
  DeleteEvent(this.productToDeleteId);
}
