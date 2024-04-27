import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/github/github_repo.dart';
import 'package:portfolio/utils/app_data.dart';

typedef RepoList = Iterable<GitHubRepo>;

class GitHubApiService extends ChangeNotifier {
  GitHubApiService._();

  static final _instance = GitHubApiService._();
  static GitHubApiService get instance => _instance;

  bool _showAll = false;
  RepoList _repos = [];
  String _message = 'Fetching GitHub repos...';

  bool get showAll => _showAll;

  String get buttonLabel => _repos.isEmpty
      ? _message
      : 'View ${showAll ? 'few' : 'all'} repositories';

  RepoList repos(final int count) => _showAll ? _repos : _repos.take(count);

  void onToggle() {
    _showAll = !_showAll;
    notifyListeners();
  }

  Future<RepoList> _parser(final String content) async =>
      List.from(jsonDecode(content)).map(GitHubRepo.fromJson);

  Future<void> fetchAsync() async {
    if (_repos.isNotEmpty) return;
    try {
      if (kDebugMode) {
        const data = 'assets/repos.json';
        _repos = await rootBundle.loadStructuredData(data, _parser);
        return await Future<void>.delayed(const Duration(seconds: 2));
      }
      final res = await http.get(
        Uri.parse(AppData.githubApiUrl),
        headers: {'Accept': 'application/vnd.github+json'},
      );
      if (res.statusCode == HttpStatus.ok) _repos = await _parser(res.body);
    } finally {
      if (_repos.isEmpty) _message = 'Unable to fetch GitHub repos! 💔';
      notifyListeners();
    }
  }
}
