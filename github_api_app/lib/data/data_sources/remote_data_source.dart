import 'dart:convert';

import 'package:github_api_app/app_config.dart';
import 'package:github_api_app/core/error/exceptions.dart';
import 'package:github_api_app/domain/models/commit.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RequestType {
  static const String get = 'get';
  static const String post = 'post';
}

abstract class RemoteDataSource {
  Future<List<Commit>> getCommits();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.client,
  });

  final http.Client client;

  Future<Response> _apiRequest(
    String endpoint, {
    String type = RequestType.get,
    Map<String, dynamic>? body,
  }) async {
    final apiHost = AppConfig.instance.apiHost;

    final headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse('$apiHost$endpoint');

    Response resp;

    switch (type) {
      case RequestType.get:
        resp = await http.get(url, headers: headers);
        return resp;
      case RequestType.post:
        resp =
            await client.post(url, headers: headers, body: json.encode(body));
        return resp;
      default:
        resp = await http.get(url, headers: headers);
        return resp;
    }
  }

  @override
  Future<List<Commit>> getCommits() async {
    final resp = await _apiRequest('/commit');
    if (resp.statusCode == 200) {
      final decodedData = json.decode(resp.body);
      final commits = CommitMapper.fromJsonList(decodedData).items;
      return commits;
    } else {
      throw ServerException();
    }
  }
}
