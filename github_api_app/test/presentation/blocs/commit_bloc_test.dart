import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_app/core/error/failures.dart';
import 'package:github_api_app/domain/entities/no_params.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:github_api_app/domain/use_cases/get_commits.dart';
import 'package:github_api_app/presentation/blocs/commit/commit_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';

class MockGetCommits extends Mock implements GetCommits {}

void main() {
  late MockGetCommits getCommits;
  late CommitBloc bloc;

  setUp(() {
    getCommits = MockGetCommits();
    bloc = CommitBloc(getCommits: getCommits);
  });

  test('initialState should be CommitInitial', () {
    expect(bloc.state, equals(const CommitInitial()));
  });

  group('GetCommits', () {
    final commits = CommitMapper.fromJsonList(
            json.decode(fixture('commits.json'))['commits'])
        .items;

    blocTest(
      'emit [LoadingCommits, LoadedCommits] when data is successfully',
      build: () {
        when(() => getCommits(NoParams()))
            .thenAnswer((_) async => Right(commits));
        return CommitBloc(getCommits: getCommits);
      },
      act: (CommitBloc bloc) => bloc.add(const OnGetCommits()),
      expect: () => [
        const LoadingCommits(),
        LoadedCommits(commits: commits),
      ],
    );

    blocTest(
      'emit [LoadingCommits, LoadErrorCommits] when data fails',
      build: () {
        when(() => getCommits(NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));
        return CommitBloc(getCommits: getCommits);
      },
      act: (CommitBloc bloc) => bloc.add(const OnGetCommits()),
      expect: () => [
        const LoadingCommits(),
        const LoadErrorCommits(),
      ],
    );
  });
}
