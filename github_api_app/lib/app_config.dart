class AppConfig {
  AppConfig();
  AppConfig._internal();

  void init({
    required String apiHost,
  }) {
    _apiHost = apiHost;
  }

  late String _apiHost;

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;
  String get apiHost => _apiHost;
}
