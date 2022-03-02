import 'package:github_api_app/domain/models/commit.dart';

class RequestType {
  static const String get = 'get';
  static const String post = 'post';
  static const String put = 'put';
  static const String patch = 'patch';
  static const String delete = 'delete';
}

abstract class RemoteDataSource {
  Future<List<Commit>> getCommits();
}
