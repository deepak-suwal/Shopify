part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

class FetchProductLoadingState extends ProductState {}

class FetchProductLoadedState extends ProductState {
  final List<Product> productList;

  FetchProductLoadedState(this.productList);
}

class FetchProductFailureState extends ProductState {
  final String error;
  FetchProductFailureState(this.error);
}
