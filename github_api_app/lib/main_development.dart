import 'package:flutter/material.dart';
import 'package:github_api_app/app_config.dart';
import 'package:github_api_app/github_api_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.instance.init(
    apiHost: 'http://192.168.1.100:3000/api',
  );
  runApp(const GitHubApiApp());
}
