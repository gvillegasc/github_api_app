import 'package:flutter/material.dart';
import 'package:github_api_app/app_config.dart';
import 'package:github_api_app/github_api_app.dart';
import 'package:github_api_app/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.instance.init(
    apiHost: 'http://PUT-YOUR-IP:3000/api',
  );
  await init();
  runApp(const GitHubApiApp());
}
