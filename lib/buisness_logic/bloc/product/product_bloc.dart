import 'package:bloc/bloc.dart';
import 'package:digifood/data/models/product.dart';
import 'package:digifood/data/repositories/product_repository.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productsRepository;

  // Constructor for ProductBloc
  ProductBloc(this.productsRepository) : super(InitialState()) {
    // Event listeners
    on<LoadEvent>(_loadProducts);
    on<AddEvent>(_addProduct);
    on<DeleteEvent>(_deleteProduct);
  }

  // Load products event handler
  Future<void> _loadProducts(
      LoadEvent event, Emitter<ProductState> emit) async {
    emit(LoadingState()); // Emit loading state
    try {
      List<Product> allProducts;
      allProducts = await productsRepository.getAllProducts(); // Fetch products
      allProducts.isEmpty
          ? emit(EmptyState()) // Emit empty state if no products found
          : emit(LoadedState(
              allProducts: allProducts)); // Emit loaded state with products
    } catch (e) {
      emit(LoadErrorState(
          error: e.toString())); // Emit load error state if an error occurs
    }
  }

  // Add product event handler
  Future<void> _addProduct(AddEvent event, Emitter<ProductState> emit) async {
    try {
      await productsRepository.addProduct(event.productToAdd); // Add product
      emit(AddSuccessfulState()); // Emit add successful state
      add(LoadEvent()); // Trigger load event to refresh products
    } catch (e) {
      emit(AddErrorState(
          error: e.toString())); // Emit add error state if an error occurs
    }
  }

  // Delete product event handler
  Future<void> _deleteProduct(
      DeleteEvent event, Emitter<ProductState> emit) async {
    try {
      await productsRepository
          .deleteProduct(event.productToDeleteId); // Delete product
      emit(DeleteSuccessfulState()); // Emit delete successful state
      add(LoadEvent()); // Trigger load event to refresh products
    } catch (e) {
      emit(DeleteErrorState(
          error: e.toString())); // Emit delete error state if an error occurs
    }
  }
}
