import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/util/extension.dart';
import 'package:flutter_assignment/core/widgets/base_view.dart';
import 'package:flutter_assignment/features/product/presentation/widget/add_to_cart_button.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:styled_widget/styled_widget.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: product.title,
      bottomNavigationBar: AddToCartButton(
        onPressed: () {},
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: PageView(
              children: List.generate(
                product.images.length,
                (index) => CachedNetworkImage(
                  imageUrl: product.images[index].originalSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              4.verticalSpace,
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.red),
              ),
              4.verticalSpace,
              Text(
                product.description ?? '',
                textAlign: TextAlign.justify,
              ),
            ],
          ).padding(all: 12)
        ],
      ),
    );
  }
}
