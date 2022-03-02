part of 'commit_bloc.dart';

abstract class CommitState extends Equatable {
  const CommitState();

  @override
  List<Object> get props => [];
}

class CommitInitial extends CommitState {
  const CommitInitial();

  @override
  List<Object> get props => [];
}

class LoadedCommits extends CommitState {
  const LoadedCommits({required this.commits});

  final List<Commit> commits;

  @override
  List<Object> get props => [commits];
}

class LoadingCommits extends CommitState {
  const LoadingCommits();

  @override
  List<Object> get props => [];
}

class LoadErrorCommits extends CommitState {
  const LoadErrorCommits();

  @override
  List<Object> get props => [];
}
