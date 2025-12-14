import 'package:flutter/foundation.dart';

// Immutable GitHub repository model
@immutable
class GitHubRepo {
  // Private constructor for creating a GitHubRepo instance
  const GitHubRepo._({
    required this.name,
    required this.url,
    required this.lang,
    required this.desc,
    required this.size,
    required this.stars,
    required this.forks,
  });

  // Factory constructor to create a GitHubRepo from a JSON map
  factory GitHubRepo.fromJson(final Map<String, dynamic> json) {
    // Pattern matching to extract data from the json data
    if (json case {
      'name': String name,
      'html_url': String url,
      'language': String? lang,
      'description': String? desc,
      'size': int size,
      'stargazers_count': int stars,
      'forks_count': int forks,
    }) {
      // Create a GitHubRepo instance using the extracted data
      return GitHubRepo._(
        name: name,
        url: url,
        lang: lang ?? 'Markdown',
        desc: desc ?? 'No description',
        size: size,
        stars: stars,
        forks: forks,
      );
    }
    // Throw an exception if the map does not match the expected format
    throw const FormatException('Invalid json data');
  }

  final String name;
  final String url;
  final String lang;
  final String desc;
  final int size;
  final int stars;
  final int forks;
}

extension Utils on GitHubRepo {
  String get subTitle => '$lang ($repoSize) - $stars Stars - $forks Forks';

  String get repoSize => size ~/ 1024 <= 0
      ? '$size KB' //
      : '${(size / 1024).toStringAsFixed(2)} MB';
}
