import 'package:dartz/dartz.dart';
import 'package:github_api_app/core/error/failures.dart';
import 'package:github_api_app/domain/models/commit.dart';

abstract class CommitRepository {
  Future<Either<Failure, List<Commit>>> getCommits();
}
