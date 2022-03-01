import 'package:dartz/dartz.dart';
import 'package:github_api_app/core/error/failures.dart';
import 'package:github_api_app/domain/entities/no_params.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:github_api_app/domain/repositories/commit_repository.dart';
import 'package:github_api_app/domain/use_cases/use_case.dart';

class GetCommits implements UseCase<List<Commit>, NoParams> {
  const GetCommits(this.repository);

  final CommitRepository repository;

  @override
  Future<Either<Failure, List<Commit>>> call(NoParams params) async {
    return repository.getCommits();
  }
}
