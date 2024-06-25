import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/github/github_repo.dart';
import 'package:portfolio/utils/app_data.dart';

typedef RepoList = Iterable<GitHubRepo>;

class GitHubApiService extends ChangeNotifier {
  // Private constructor to enforce singleton pattern
  GitHubApiService._();

  // Singleton instance
  static final _instance = GitHubApiService._();
  static GitHubApiService get instance => _instance;

  // Flag to control whether to show all repositories or a limited number
  bool _showAll = false;

  // List of fetched repositories
  RepoList _repos = [];

  // Message to display while fetching repositories
  String _message = 'Fetching GitHub repos...';

  // Getter for _showAll flag
  bool get showAll => _showAll;

  // Computed label for a button that toggles between showing all or few repositories
  String get buttonLabel => _repos.isEmpty
      ? _message
      : 'View ${showAll ? 'few' : 'all'} repositories';

  // Returns either all repositories or a limited number based on _showAll flag
  RepoList repos(final int count) => _showAll ? _repos : _repos.take(count);

  // Toggles the _showAll flag and notifies listeners
  void onToggle() {
    _showAll = !_showAll;
    notifyListeners();
  }

  /// Parses the response body into a list of GitHubRepo objects.
  Future<RepoList> _parser(final String content) async =>
      // Decode the JSON string and map it to a list of GitHubRepo objects.
      List.from(jsonDecode(content)).map(GitHubRepo.fromJson);

  Future<void> fetchAsync() async {
    // If repos are already loaded, return early
    if (_repos.isNotEmpty) return;

    try {
      if (kDebugMode) {
        // Load repos from local asset in debug mode
        const data = 'assets/repos.json';
        _repos = await rootBundle.loadStructuredData(data, _parser);
        // Simulate network delay for better UX in debug mode
        return await Future<void>.delayed(const Duration(seconds: 2));
      }

      // Fetch repos from GitHub API
      final res = await http.get(
        Uri.parse(AppData.githubApiUrl),
        headers: {'Accept': 'application/vnd.github+json'},
      );

      // Parse response if successful
      if (res.statusCode == HttpStatus.ok) _repos = await _parser(res.body);
    } finally {
      // Set error message if no repos were fetched
      if (_repos.isEmpty) _message = 'Unable to fetch GitHub repos! 💔';

      // Notify listeners about changes
      notifyListeners();
    }
  }
}
