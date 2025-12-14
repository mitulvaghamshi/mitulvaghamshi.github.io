import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/github/github_api.dart';
import 'package:portfolio/github/github_repo.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';

@immutable
class RepoCard extends StatelessWidget {
  const RepoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final handler = AppScope.of(context).githubApiService;
    final count = (context.width / 500).round();
    return Frame.container(
      color: context.colors.repoContainer,
      child: ListenableBuilder(
        listenable: handler,
        builder: (context, child) => Column(
          children: [
            context.config.build(
              mobileSmall290: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: handler.items(count * 2).map((e) {
                  return SizedBox(
                    width: context.width / count - 32,
                    height: context.width > 420 ? 200 : 220,
                    child: _RepoItem(repo: e),
                  );
                }).toList(),
              ),
            ),
            Frame.card(
              onTap: handler.toggleShowAll,
              color: context.colors.repoContainer,
              child: Text(handler.buttonLabel),
            ),
          ],
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
    final theme = Theme.of(context).textTheme.apply(
      bodyColor: context.colors.repoText,
      displayColor: context.colors.repoText,
    );
    return Frame.link(
      url: repo.url,
      color: context.colors.repoCard,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            repo.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.headlineSmall!.copyWith(
              color: context.colors.repoTitle,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            repo.subTitle,
            style: theme.titleMedium!.copyWith(
              color: context.colors.repoSubtitle,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            repo.desc,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.bodyMedium!.copyWith(color: context.colors.repoText),
          ),
        ],
      ),
    );
  }
}
