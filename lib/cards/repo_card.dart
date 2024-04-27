import 'package:flutter/material.dart';
import 'package:portfolio/github/github_repo.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/frame.dart';

@immutable
class RepoCard extends StatelessWidget {
  const RepoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final github = AppScope.of(context).githubApiService;
    final layout = context.layout.data;
    final colors = context.colors;
    final width = context.width;
    final count = (width / 500).round();
    final size = Size(width / count - layout.dp * 1.5, layout.dp * 14);
    return AnimatedBuilder(
      animation: github,
      builder: (context, child) => Frame.container(
        color: colors.repoContainer,
        child: context.layout.build(
          mobileSmall290: Column(children: [
            Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: github.repos(count * 2).map((e) {
                return SizedBox.fromSize(size: size, child: RepoItem(repo: e));
              }).toList(),
            ),
            TextButton(
              onPressed: github.onToggle,
              child: Text(
                github.buttonLabel,
                style: TextStyle(
                  color: colors.repoTitle,
                  fontSize: layout.dp,
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
class RepoItem extends StatelessWidget {
  const RepoItem({super.key, required this.repo});

  final GitHubRepo repo;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout.data;
    final space = SizedBox(height: layout.dp / 2);
    final style = TextStyle(
      fontSize: layout.dp,
      fontWeight: FontWeight.bold,
    );
    return Frame.link(
      url: repo.htmlUrl,
      color: colors.repoCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repo.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style.copyWith(
              color: colors.repoTitle,
              fontSize: layout.dp * 1.5,
            ),
          ),
          space,
          Text(
            repo.language,
            style: style.copyWith(color: colors.repoSubtitle),
          ),
          space,
          Text(
            repo.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: style.copyWith(color: colors.repoText),
          ),
        ],
      ),
    );
  }
}
