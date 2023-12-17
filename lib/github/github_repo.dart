import 'package:flutter/foundation.dart';

@immutable
class GitHubRepo {
  const GitHubRepo._({
    required this.name,
    required this.htmlUrl,
    required this.language,
    required this.description,
  });

  factory GitHubRepo.fromJson(final map) {
    if (map
        case {
          'name': final String name,
          'html_url': final String url,
          'language': final String? lang,
          'description': final String? desc,
        }) {
      return GitHubRepo._(
        name: name,
        htmlUrl: url,
        language: lang ?? 'Markdown',
        description: desc ?? 'No description',
      );
    }
    throw const FormatException('Invalid JSON');
  }

  final String name;
  final String htmlUrl;
  final String language;
  final String description;
}
