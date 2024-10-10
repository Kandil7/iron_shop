import 'package:dartz/dartz.dart';
import 'package:iron_shop/features/domain/entity/product.dart';
import 'package:iron_shop/features/domain/failures/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProduct(int id);
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, Product>> deleteProduct(int id);
}