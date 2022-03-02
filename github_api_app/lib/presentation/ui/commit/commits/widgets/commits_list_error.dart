import 'package:flutter/material.dart';
import 'package:github_api_app/core/app_strings.dart';
import 'package:github_api_app/presentation/ui/widgets/text_title.dart';

class CommitsListError extends StatelessWidget {
  const CommitsListError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: TextTitleSmall(
          text: AppStrings.textErrorGetCommits,
          textAlign: TextAlign.center,
          color: appTheme.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
