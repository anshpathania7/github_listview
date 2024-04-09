import 'package:flutter/foundation.dart';
import 'package:github_listview/src/model/github_last_commit_model.dart';
import 'package:github_listview/src/model/github_repository_model.dart';
import 'package:github_listview/src/service/github_api.dart';

class GithubRepositoriesProvider extends ChangeNotifier {
  //
  bool _loadingRepositories = true;
  bool _loadingLastCommit = true;

  get isRepositoryLoading => _loadingRepositories;
  get isLastCommitLoading => _loadingLastCommit;

  final String _repositoryName = 'freeCodeCamp';

  List<GithubRepositories?> githubRepo = [];
  List<List<GithubLastCommit?>> listOfLastCommitsForEachRepo = [];

  set updateRepositoryLoadingStatusTo(bool val) {
    _loadingRepositories = val;
    notifyListeners();
  }

  set updateLastCommitLoadingStatusTo(bool val) {
    _loadingLastCommit = val;
    notifyListeners();
  }

  void fetchRepositories(String user) async {
    updateRepositoryLoadingStatusTo = true;
    githubRepo = await GithubApi().fetchRepositoriesOfUser(user);
    updateRepositoryLoadingStatusTo = false;
    notifyListeners();
    if (githubRepo.isNotEmpty) {
      fetchLastFiveCommitsForEachRepository(user);
    }
  }

  void fetchLastFiveCommitsForEachRepository(String user) async {
    List<Future<List<GithubLastCommit?>>> listOfCommits =
        List.empty(growable: true);
    updateLastCommitLoadingStatusTo = true;
    for (GithubRepositories? repo in githubRepo) {
      final repoName = repo!.name;
      final lastCommits = GithubApi().fetchLastCommmit(user, repoName);
      listOfCommits.add(lastCommits);
    }

    listOfLastCommitsForEachRepo = await Future.wait(listOfCommits);

    updateLastCommitLoadingStatusTo = false;
    notifyListeners();
  }

  void init() {
    fetchRepositories(_repositoryName);
  }
}
