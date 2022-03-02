import 'package:flutter/material.dart';
import 'package:github_api_app/presentation/ui/commit/commits/commits_page.dart';

class AppRoutes {
  static const String commits = '/';
}

Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.commits:
      return MaterialPageRoute<void>(
        builder: (_) => const CommitsPage(),
      );
    default:
      return null;
  }
}

const String appInitialRoute = AppRoutes.commits;
