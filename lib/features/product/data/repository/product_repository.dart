import 'package:injectable/injectable.dart';
import 'package:shopify_flutter/models/src/product/product.dart';
import 'package:shopify_flutter/shopify/src/shopify_store.dart';

import '../../domain/repository/i_product_repository.dart';

@Injectable(as: IProductRepository)
class ProductRepository extends IProductRepository {


  @override
  Future<List<Product>> fetchProducts() async {
    final response = ShopifyStore.instance.getAllProducts();
    return response;
  }
}
