import 'package:flutter/foundation.dart';

// Immutable GitHub repository model
@immutable
class GitHubRepo {
  // Private constructor for creating a GitHubRepo instance
  const GitHubRepo._({
    required this.name,
    required this.htmlUrl,
    required this.language,
    required this.description,
  });

  // Factory constructor to create a GitHubRepo from a JSON map
  factory GitHubRepo.fromJson(final map) {
    // Pattern matching to extract data from the map
    if (map
        case {
          'name': final String name,
          'html_url': final String url,
          'language': final String? lang,
          'description': final String? desc,
        }) {
      // Create a GitHubRepo instance using the extracted data
      return GitHubRepo._(
        name: name,
        htmlUrl: url,
        // Default to 'Markdown' if language is not provided
        language: lang ?? 'Markdown',
        // Default to 'No description' if description is not provided
        description: desc ?? 'No description',
      );
    }
    // Throw an exception if the map does not match the expected format
    throw const FormatException('Invalid json data');
  }

  // Name of the GitHub repository
  final String name;
  // HTML URL of the GitHub repository
  final String htmlUrl;
  // Primary programming language used in the repository
  final String language;
  // Description of the GitHub repository
  final String description;
}
