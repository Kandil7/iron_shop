import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_shop/features/presentation/cubit/product_cubit.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text('\$${product.minPrice} - \$${product.maxPrice}'),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      )

    );
  }
}
