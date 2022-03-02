import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api_app/injection/injection.dart';
import 'package:github_api_app/presentation/blocs/commit/commit_bloc.dart';
import 'package:github_api_app/presentation/ui/commit/commits/widgets/commits_header.dart';
import 'package:github_api_app/presentation/ui/commit/commits/widgets/commits_list.dart';
import 'package:github_api_app/presentation/ui/widgets/invisible_scroll.dart';

class CommitsPage extends StatelessWidget {
  const CommitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CommitBloc>(),
      child: const Scaffold(
        body: SafeArea(
          bottom: false,
          child: InvisibleScroll(
            child: CustomScrollView(
              slivers: [
                CommitsHeader(),
                CommitsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
