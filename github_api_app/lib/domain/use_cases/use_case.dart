import 'package:dartz/dartz.dart';
import 'package:github_api_app/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type?>> call(Params params);
}
