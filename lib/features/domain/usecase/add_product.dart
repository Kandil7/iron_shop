
import 'package:dartz/dartz.dart';
import 'package:iron_shop/features/domain/entity/product.dart';
import 'package:iron_shop/features/domain/failures/failures.dart';
import 'package:iron_shop/features/domain/repository/Product_repository.dart';

class CreateProduct{
  final ProductRepository repository;

  CreateProduct(this.repository);

  Future<Future<Either<Failure, Product>>> execute(Product product) async {
    return repository.createProduct(product);
  }
}