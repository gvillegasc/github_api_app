import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_app/core/error/exceptions.dart';
import 'package:github_api_app/core/error/failures.dart';
import 'package:github_api_app/data/data_sources/remote_data_source.dart';
import 'package:github_api_app/data/repositories/commit_repository_impl.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  late MockRemoteDataSource remoteDataSource;
  late CommitRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockRemoteDataSource();
    repository = CommitRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  group('getCommits', () {
    final commits = CommitMapper.fromJsonList(
            json.decode(fixture('commits.json'))['commits'])
        .items;

    test('should get commits from the data source', () async {
      when(() => remoteDataSource.getCommits())
          .thenAnswer((_) async => commits);

      final result = await repository.getCommits();

      verify(remoteDataSource.getCommits);
      verifyNoMoreInteractions(remoteDataSource);
      expect(result, equals(Right(commits)));
    });

    test('should get a server failure from the data source', () async {
      when(() => remoteDataSource.getCommits()).thenThrow(ServerException());

      final result = await repository.getCommits();

      verify(remoteDataSource.getCommits);
      verifyNoMoreInteractions(remoteDataSource);
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
