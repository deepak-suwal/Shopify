import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/strings.dart';
import 'package:flutter_assignment/core/injection/injection.dart';
import 'package:flutter_assignment/core/widgets/base_view.dart';
import 'package:flutter_assignment/core/widgets/loading_widget.dart';
import 'package:flutter_assignment/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_assignment/features/product/presentation/widget/product_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/no_data_widget.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late TextEditingController searchController;
  final ProductBloc productBloc;

  _ProductPageState() : productBloc = getIt<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: appName,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        )
      ],
      body: BlocProvider(
        create: (context) => productBloc,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<ProductBloc, ProductState>(
            bloc: productBloc..add(FetchProductEvent()),
            builder: (context, state) {
              return switch (state) {
                FetchProductLoadingState() => const LoadingWidget(),
                FetchProductLoadedState() => GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.productList.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (ctx, index) {
                    return ProductWidget(
                      product: state.productList[index],
                    );
                  },
                ),
                FetchProductFailureState() => const NoDataWidget(),
              };
            },
          ),
        ),
      ),
    );
  }
}
