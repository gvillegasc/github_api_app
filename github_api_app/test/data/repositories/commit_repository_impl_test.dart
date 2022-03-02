import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_app/core/error/exceptions.dart';
import 'package:github_api_app/core/error/failures.dart';
import 'package:github_api_app/data/data_sources/remote_data_source.dart';
import 'package:github_api_app/data/repositories/commit_repository_impl.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  late MockRemoteDataSource remoteDataSource;
  late CommitRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockRemoteDataSource();
    repository = CommitRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  group('getCommits', () {
    final commits = <Commit>[];
    test('should get commits from the data source', () async {
      when(() => remoteDataSource.getCommits())
          .thenAnswer((_) async => commits);
      // act
      final result = await repository.getCommits();
      // assert
      verify(remoteDataSource.getCommits);
      verifyNoMoreInteractions(remoteDataSource);
      expect(result, equals(Right(commits)));
    });

    test('should get a server failure from the data source', () async {
      when(() => remoteDataSource.getCommits()).thenThrow(ServerException());
      // act
      final result = await repository.getCommits();
      // assert
      verify(remoteDataSource.getCommits);
      verifyNoMoreInteractions(remoteDataSource);
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
