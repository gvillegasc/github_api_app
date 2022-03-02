import 'package:flutter/widgets.dart';
import 'package:github_api_app/presentation/blocs/commit/commit_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api_app/presentation/ui/commit/commits/widgets/commits_item.dart';
import 'package:github_api_app/presentation/ui/commit/commits/widgets/commits_list_error.dart';
import 'package:github_api_app/presentation/ui/widgets/sliver_loading.dart';

class CommitsList extends StatefulWidget {
  const CommitsList({
    Key? key,
  }) : super(key: key);

  @override
  _CommitsListState createState() => _CommitsListState();
}

class _CommitsListState extends State<CommitsList> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CommitBloc>();
    bloc.add(const OnGetCommits());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommitBloc, CommitState>(
      builder: (context, state) {
        if (state is LoadingCommits) {
          return const SliverLoading();
        } else if (state is LoadedCommits) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int i) => (i == state.commits.length - 1)
                  ? SafeArea(
                      top: false,
                      child: CommitsItem(commit: state.commits[i]),
                    )
                  : CommitsItem(commit: state.commits[i]),
              childCount: state.commits.length,
            ),
          );
        } else {
          return const CommitsListError();
        }
      },
    );
  }
}
