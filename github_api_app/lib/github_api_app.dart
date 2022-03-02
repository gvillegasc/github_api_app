import 'package:flutter/material.dart';
import 'package:github_api_app/presentation/routes/routes.dart';
import 'package:github_api_app/presentation/theme/theme.dart';

class GitHubApiApp extends StatelessWidget {
  const GitHubApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHubApi App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: appInitialRoute,
      onGenerateRoute: generateRoutes,
    );
  }
}
