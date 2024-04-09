// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:github_listview/src/model/github_last_commit_model.dart';
import 'package:github_listview/src/model/github_repository_model.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';

class GithubApi {
  static GithubApi? _instance;

  final access_token = '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';

  GithubApi._(); // private constructor

  factory GithubApi() {
    _instance ??= GithubApi._();
    return _instance!;
  }

  Future<List<GithubRepositories?>> fetchRepositoriesOfUser(String user) async {
    final url = repositoriesApi(user);
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'token $access_token',
      },
    );

    if (response.statusCode == 200) {
      //convert to dart object
      final List<dynamic> jsonList = jsonDecode(response.body);
      List<GithubRepositories> githubRepositoriesModel =
          jsonList.map((json) => GithubRepositories.fromJson(json)).toList();
      //final githubRepositoriesModel = GithubRepositories.fromJson(json);
      return githubRepositoriesModel;
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<List<GithubLastCommit?>> fetchLastCommmit(
      String user, String repositoryName) async {
    final url = lastCommitApi(user, repositoryName);
    final uri = Uri.parse(
      url,
    );
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'token $access_token',
      },
    );

    if (response.statusCode == 200) {
      //convert to dart object
      final List<dynamic> jsonList = jsonDecode(response.body);
      List<GithubLastCommit> githubLastCommit =
          jsonList.map((json) => GithubLastCommit.fromJson(json)).toList();
      //final githubLastCommit = GithubLastCommit.fromJson(json);
      return githubLastCommit;
    } else {
      print(response.statusCode);
      return [];
    }
  }
}
