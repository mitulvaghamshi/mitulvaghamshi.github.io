import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/github/github_controller.dart';
import 'package:portfolio/github/github_model.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/colors_model.dart';

@immutable
class RepoCard extends StatelessWidget {
  const RepoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AppScope.of(context).githubController;
    final count = (context.width / 500).round();
    return Frame.container(
      color: context.colors.repoContainer,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) => Column(
          children: [
            context.config.build(
              mobileSmall290: Wrap(
                alignment: .center,
                runAlignment: .center,
                children: controller.items(count * 2).map((repo) {
                  return SizedBox(
                    width: context.width / count - 32,
                    height: context.width > 420 ? 200 : 220,
                    child: _RepoItem(repo: repo),
                  );
                }).toList(),
              ),
            ),
            Frame.card(
              onTap: controller.toggleShowAll,
              color: context.colors.repoContainer,
              child: Text(controller.buttonLabel),
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

  final GitHubModel repo;

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
            overflow: .ellipsis,
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
            overflow: .ellipsis,
            style: theme.bodyMedium!.copyWith(color: context.colors.repoText),
          ),
        ],
      ),
    );
  }
}
