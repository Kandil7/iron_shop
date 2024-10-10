import 'package:dartz/dartz.dart';
import 'package:iron_shop/features/data/repository/product_repository_imp.dart';
import 'package:iron_shop/features/domain/entity/product.dart';
import 'package:iron_shop/features/domain/failures/failures.dart';

class GetProducts {
  final ProductRepositoryImpl repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return repository.getProducts();
  }
}