import 'package:injectable/injectable.dart';
import 'package:shopify_flutter/models/src/product/product.dart';

import '../repository/i_product_repository.dart';

abstract class IProductController {
  Future<List<Product>> fetchProducts();
}

@Injectable(as: IProductController)
class ProductController extends IProductController {
  IProductRepository repository;

  ProductController(this.repository);

  @override
  Future<List<Product>> fetchProducts() {
    return repository.fetchProducts();
  }
}
