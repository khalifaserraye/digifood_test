import 'package:bloc/bloc.dart';
import 'package:digifood/data/models/product.dart';
import 'package:digifood/data/repositories/product_repository.dart';
part 'product_event.dart';
part 'product_state.dart';
// product_bloc.dart

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productsRepository;

  ProductBloc(this.productsRepository) : super(InitialState()) {
    on<LoadProducts>(_loadProducts);
    on<AddProduct>(_addProduct);
    on<DeleteProduct>(_deleteProduct);
  }

  Future<void> _loadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(LoadingState());
    try {
      List<Product> allProducts;
      allProducts = await productsRepository.getAllProducts();
      allProducts.isEmpty
          ? emit(EmptyState())
          : emit(LoadedState(allProducts: allProducts));
    } catch (error) {
      emit(ErrorState(error: error.toString()));
    }
  }

  Future<void> _addProduct(AddProduct event, Emitter<ProductState> emit) async {
    try {
      await productsRepository.addProduct(event.productToAdd);
      add(LoadProducts());
    } catch (error) {
      emit(ErrorState(error: error.toString()));
    }
  }

  Future<void> _deleteProduct(
      DeleteProduct event, Emitter<ProductState> emit) async {
    try {
      await productsRepository.deleteProduct(event.productToDeleteId);
      add(LoadProducts());
    } catch (error) {
      emit(ErrorState(error: error.toString()));
    }
  }
}
