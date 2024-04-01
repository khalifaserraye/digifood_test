part of 'product_bloc.dart'; // Indicates that this file is part of the product_bloc.dart file

// Abstract class representing different states of products
abstract class ProductState {}

// Initial state when no actions have been performed yet
class InitialState extends ProductState {}

// State indicating that products are being loaded
class LoadingState extends ProductState {}

// State indicating that products have been successfully loaded
class LoadedState extends ProductState {
  final List<Product> allProducts; // List of all products

  // Constructor for LoadedState
  LoadedState({required this.allProducts});
}

// State indicating that there are no products available
class EmptyState extends ProductState {}

// State indicating an error while loading products
class LoadErrorState extends ProductState {
  final String error; // Error message

  // Constructor for LoadErrorState
  LoadErrorState({required this.error});
}

// State indicating that a product has been successfully added
class AddSuccessfulState extends ProductState {}

// State indicating that a product has been successfully deleted
class DeleteSuccessfulState extends ProductState {}

// State indicating an error while adding a product
class AddErrorState extends ProductState {
  final String error; // Error message

  // Constructor for AddErrorState
  AddErrorState({required this.error});
}

// State indicating an error while deleting a product
class DeleteErrorState extends ProductState {
  final String error; // Error message

  // Constructor for DeleteErrorState
  DeleteErrorState({required this.error});
}
