import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopify_flutter/models/src/product/product.dart';

import '../../domain/controller/i_product_controller.dart';

part 'product_event.dart';

part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  IProductController controller;

  ProductBloc(this.controller) : super(FetchProductLoadingState()) {
    on<ProductEvent>((event, emit) async {
      if (event is FetchProductEvent) {
        final response = await controller.fetchProducts();
        emit(FetchProductLoadedState(response));
      } else if (event is LoadMoreEvent) {}
    });
  }
}
