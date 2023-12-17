import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/github/github_repo.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';

@immutable
class RepoCard extends StatelessWidget {
  const RepoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final github = AppScope.of(context).githubApiService;
    final count = (context.width / 500).round();
    final size = Size(context.width / count - context.layout.dp * 1.5,
        context.layout.dp * 14);

    return AnimatedBuilder(
      animation: github,
      builder: (context, child) => Frame.container(
        color: context.colors.repoContainer,
        child: context.config.build(
          mobileSmall290: Column(children: [
            Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: github.repos(count * 2).map((e) {
                return SizedBox.fromSize(size: size, child: _RepoItem(repo: e));
              }).toList(),
            ),
            TextButton(
              onPressed: github.toggleShowAll,
              child: Text(
                github.buttonLabel,
                style: TextStyle(
                  color: context.colors.repoTitle,
                  fontSize: context.layout.dp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

@immutable
class _RepoItem extends StatelessWidget {
  const _RepoItem({required this.repo});

  final GitHubRepo repo;

  @override
  Widget build(BuildContext context) {
    return Frame.link(
      url: repo.htmlUrl,
      color: context.colors.repoCard,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          repo.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: context.colors.repoTitle,
            fontSize: context.layout.dp * 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.layout.dp / 2),
        Text(
          repo.language,
          style: TextStyle(
            color: context.colors.repoSubtitle,
            fontSize: context.layout.dp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.layout.dp / 2),
        Text(
          repo.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: context.colors.repoText,
            fontSize: context.layout.dp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
