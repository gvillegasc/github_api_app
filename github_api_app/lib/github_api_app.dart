import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api_app/presentation/blocs/theme/theme_bloc.dart';
import 'package:github_api_app/presentation/routes/routes.dart';
import 'package:github_api_app/presentation/theme/theme.dart';

import 'injection/injection.dart';

class GitHubApiApp extends StatelessWidget {
  const GitHubApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ThemeBloc>(),
        ),
      ],
      child: const _Init(),
    );
  }
}

class _Init extends StatefulWidget {
  const _Init({Key? key}) : super(key: key);

  @override
  State<_Init> createState() => _InitState();
}

class _InitState extends State<_Init> {
  @override
  void initState() {
    super.initState();
    final brightness = SchedulerBinding.instance!.window.platformBrightness;
    final themeBloc = context.read<ThemeBloc>();
    final event = OnChangeTheme((brightness == Brightness.dark) ? true : false);
    themeBloc.add(event);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'GitHubApi App',
          debugShowCheckedModeBanner: false,
          theme: state.isDark ? appThemeDark : appThemeLight,
          initialRoute: appInitialRoute,
          onGenerateRoute: generateRoutes,
        );
      },
    );
  }
}
