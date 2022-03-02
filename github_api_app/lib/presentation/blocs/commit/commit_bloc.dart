import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_api_app/domain/entities/no_params.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:github_api_app/domain/use_cases/get_commits.dart';

part 'commit_event.dart';
part 'commit_state.dart';

class CommitBloc extends Bloc<CommitEvent, CommitState> {
  CommitBloc({
    required this.getCommits,
  }) : super(const CommitInitial()) {
    on<OnGetCommits>(_onGetCommits);
  }

  final GetCommits getCommits;

  Future<void> _onGetCommits(OnGetCommits event, Emitter emit) async {
    emit(const LoadingCommits());
    final failureOrCommits = await getCommits(NoParams());
    emit(
      failureOrCommits.fold(
        (failure) => const LoadErrorCommits(),
        (commits) => LoadedCommits(commits: commits),
      ),
    );
  }
}
