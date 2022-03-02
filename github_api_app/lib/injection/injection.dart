import 'package:get_it/get_it.dart';
import 'package:github_api_app/data/data_sources/remote_data_source.dart';
import 'package:github_api_app/data/repositories/commit_repository_impl.dart';
import 'package:github_api_app/domain/repositories/commit_repository.dart';
import 'package:github_api_app/domain/use_cases/get_commits.dart';
import 'package:github_api_app/presentation/blocs/commit/commit_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  // Blocs
  getIt.registerLazySingleton(
    () => CommitBloc(
      getCommits: getIt<GetCommits>(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCommits(getIt<CommitRepository>()));

  // Repository
  getIt.registerLazySingleton<CommitRepository>(
    () => CommitRepositoryImpl(remoteDataSource: getIt<RemoteDataSource>()),
  );

  // Datasource
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: getIt()),
  );

  // External
  getIt.registerLazySingleton(() => http.Client());
}
