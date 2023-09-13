import 'package:shopify_flutter/models/src/product/product.dart';


abstract class IProductRepository {
  Future<List<Product>> fetchProducts();
}
