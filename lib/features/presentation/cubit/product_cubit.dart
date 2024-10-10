
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_shop/features/domain/entity/product.dart';
import 'package:iron_shop/features/domain/failures/server_failure.dart';
import 'package:iron_shop/features/domain/usecase/getProduct.dart';

part 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;

  ProductCubit(this.getProducts) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await getProducts();
    result.fold(
          (failure) {
        if (failure is ServerFailure) {
          emit(ProductError('Server error: ${failure.message}'));
        } else if (failure is NetworkFailure) {
          emit(ProductError('Network error: ${failure.message}'));
        } else {
          emit(ProductError('An unexpected error occurred'));
        }
      },
          (products) => emit(ProductLoaded(products)),
    );
  }
}
