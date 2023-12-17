import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/github/github_repo.dart';

class GitHubApi extends ChangeNotifier {
  GitHubApi._();

  static final _instance = GitHubApi._();
  static GitHubApi get instance => _instance;

  bool _showAll = false;
  Iterable<GitHubRepo> _repos = [];
  String _message = 'Loading github repos...';

  bool get showAll => _showAll;

  String get buttonLabel => _repos.isEmpty
      ? _message
      : 'View ${showAll ? 'few' : 'all'} repositories';

  Iterable<GitHubRepo> repos(final int count) =>
      _showAll ? _repos : _repos.take(count);

  void onToggle() {
    _showAll = !_showAll;
    notifyListeners();
  }

  Future<Iterable<GitHubRepo>> _parser(final String content) async =>
      List.from(jsonDecode(content)).map(GitHubRepo.fromJson);

  Future<void> fetchAsync() async {
    if (_repos.isNotEmpty) return;
    try {
      if (kDebugMode) {
        _repos =
            await rootBundle.loadStructuredData('assets/repos.json', _parser);
        await Future.delayed(const Duration(seconds: 2));
      } else {
        final res = await http.get(
          Uri.parse('https://api.github.com/users/mitulvaghamshi/repos'),
          headers: {'Accept': 'application/vnd.github+json'},
        );
        if (res.statusCode == HttpStatus.ok) _repos = await _parser(res.body);
      }
    } finally {
      if (_repos.isEmpty) _message = 'Unable to load github repos! 💔';
      notifyListeners();
    }
  }
}
