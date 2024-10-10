import 'package:iron_shop/features/domain/failures/failures.dart';

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class AuthFailure extends Failure {
  const AuthFailure(String message) : super(message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(String message) : super(message);
}

//-----------------------------------------------------------

