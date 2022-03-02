part of 'commit_bloc.dart';

abstract class CommitEvent extends Equatable {
  const CommitEvent();

  @override
  List<Object> get props => [];
}

class OnGetCommits extends CommitEvent {
  const OnGetCommits();

  @override
  List<Object> get props => [];
}
