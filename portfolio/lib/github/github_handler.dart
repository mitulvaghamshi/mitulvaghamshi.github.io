import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/github/github_repo.dart';
import 'package:portfolio/utils/static_data.dart';

typedef RepoList = Iterable<GitHubRepo>;

class GitHubHandler extends ChangeNotifier {
  // List of fetched repositories
  RepoList _repos = [];

  // Flag to control whether to show all repositories or a limited number
  bool _showAll = false;

  // Message to display while fetching repositories
  String _status = 'Connecting to GitHub...';

  // Toggles the _showAll flag and notifies listeners
  void toggleShowAll() {
    _showAll = !_showAll;
    notifyListeners();
  }

  Future<void> fetchAsync() async {
    // If repos are already loaded, return early
    if (_repos.isNotEmpty) return;
    try {
      kDebugMode ? await _fetchDebug : await _fetchNetwork;
    } finally {
      if (_repos.isEmpty) {
        _status = 'Unable to connect to GitHub 💔';
      }
      notifyListeners();
    }
  }
}

extension on GitHubHandler {
  // Decode the JSON string and map it to a list of GitHubRepo objects
  RepoList _parser(String content) {
    if (content.isEmpty) return const .empty();
    if (jsonDecode(content) case Iterable<dynamic> items) {
      return items.map(GitHubRepo.fromJson);
    }
    return const .empty();
  }

  Future<void> get _fetchDebug async {
    // Load repos from local asset file and parse into list it GitHubRepo
    final content = await rootBundle.loadString('assets/repos.json');
    _repos = _parser(content);
    // Add 2 second delay for network request simulation
    await Future<void>.delayed(const .new(seconds: 2));
  }

  Future<void> get _fetchNetwork async {
    // Fetch repos from GitHub Api
    final res = await http.get(
      .parse(StaticData.githubApiUrl),
      headers: {HttpHeaders.acceptHeader: 'application/vnd.github+json'},
    );
    if (res.statusCode == HttpStatus.ok) {
      _repos = _parser(res.body);
    }
  }
}

extension Utils on GitHubHandler {
  // Returns either all repositories or a limited number based on _showAll flag
  RepoList items(int count) => _showAll ? _repos : _repos.take(count);

  // Label for a button that toggles between showing all or few repositories
  String get buttonLabel => _repos.isEmpty
      ? _status
      : 'View ${_showAll ? 'few' : 'all'} repositories';
}
