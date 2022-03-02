import 'package:github_api_app/core/error/exceptions.dart';
import 'package:github_api_app/data/data_sources/remote_data_source.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:github_api_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:github_api_app/domain/repositories/commit_repository.dart';

class CommitRepositoryImpl extends CommitRepository {
  CommitRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Commit>>> getCommits() async {
    try {
      final commits = await remoteDataSource.getCommits();
      return Right(commits);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
