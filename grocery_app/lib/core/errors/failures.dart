class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure({required this.message});
}

class ConnectionFailure extends Failure {
  final String message;
  const ConnectionFailure({required this.message});
}

class DatabaseFailure extends Failure {
  final String message;
  const DatabaseFailure({required this.message});
}
