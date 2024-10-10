abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
