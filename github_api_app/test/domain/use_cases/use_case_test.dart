import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api_app/domain/entities/no_params.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:github_api_app/domain/repositories/commit_repository.dart';
import 'package:github_api_app/domain/use_cases/get_commits.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';

class MockCommitRepository extends Mock implements CommitRepository {}

void main() {
  late GetCommits usecase;
  late MockCommitRepository commitRepository;

  setUp(() {
    commitRepository = MockCommitRepository();
    usecase = GetCommits(commitRepository);
  });

  final commits =
      CommitMapper.fromJsonList(json.decode(fixture('commits.json'))).items;

  test(
    'should get commits from the repository',
    () async {
      when(() => commitRepository.getCommits())
          .thenAnswer((_) async => Right(commits));

      final result = await usecase(NoParams());

      expect(result, equals(Right(commits)));
      expect(commits.length, equals(7));
      verify(commitRepository.getCommits);
      verifyNoMoreInteractions(commitRepository);
    },
  );
}
