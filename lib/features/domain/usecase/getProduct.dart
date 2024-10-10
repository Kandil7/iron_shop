import 'package:iron_shop/features/data/remote/data_sources/product_remote_datasource.dart';
import 'package:iron_shop/features/data/repository/product_repository.dart';
import 'package:iron_shop/features/domain/entity/product.dart';
import 'package:iron_shop/features/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:iron_shop/features/domain/failures/server_failure.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure('Failed to connect to the server'));
      } else if (e is CacheException) {
        return Left(CacheFailure('Failed to fetch from cache'));
      } else {
        return Left(UnexpectedFailure('Unexpected error occurred'));
      }
    }
  }
}

//-----------------------------------------------------------

class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

class UnexpectedException implements Exception {
  final String message;

  UnexpectedException(this.message);
}

class NoInternetException implements Exception {
  final String message;

  NoInternetException(this.message);
}

class NoServiceFoundException implements Exception {
  final String message;

  NoServiceFoundException(this.message);
}

class InvalidFormatException implements Exception {
  final String message;

  InvalidFormatException(this.message);
}

class InvalidInputException implements Exception {
  final String message;

  InvalidInputException(this.message);
}




