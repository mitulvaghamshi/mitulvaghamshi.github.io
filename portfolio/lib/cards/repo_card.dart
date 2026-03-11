import 'package:flutter/material.dart';
import 'package:portfolio/github/github_handler.dart';
import 'package:portfolio/github/github_repo.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/breakpoint.dart';
import 'package:portfolio/widgets/frame_factory.dart';

@immutable
class RepoCard extends StatefulWidget {
  const RepoCard({super.key});

  @override
  State<RepoCard> createState() => _RepoCardState();
}

class _RepoCardState extends State<RepoCard> {
  bool _isMinimized = false;

  @override
  Widget build(BuildContext context) {
    final controller = AppScope.of(context).githubController;
    return FrameFactory.controls(
      title: 'GitHub',
      titleColor: context.colors.repoTitle,
      color: context.colors.repoContainer,
      isMinimized: _isMinimized,
      onMinimize: () => setState(() => _isMinimized = !_isMinimized),
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) => Column(
          children: [
            context.breakpoint.build(
              smallMobile: _CardCountWidget(count: 1, controller: controller),
              largeTablet: _CardCountWidget(count: 2, controller: controller),
              smallLaptop: _CardCountWidget(count: 3, controller: controller),
              smallDesktop: _CardCountWidget(count: 4, controller: controller),
            ),
            FrameFactory.card(
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
class _CardCountWidget extends StatelessWidget {
  const _CardCountWidget({required this.count, required this.controller});

  final int count;
  final GitHubHandler controller;

  @override
  Widget build(BuildContext context) => Wrap(
    alignment: .center,
    runAlignment: .center,
    children: controller.items(count * 2).map((item) {
      return SizedBox(
        width: (context.width - 64) / count,
        height: context.width > 420 ? 200 : 220,
        child: _RepoItem(repo: item),
      );
    }).toList(),
  );
}

@immutable
class _RepoItem extends StatelessWidget {
  const _RepoItem({required this.repo});

  final GitHubRepo repo;

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context).apply(
      bodyColor: context.colors.repoText,
      displayColor: context.colors.repoText,
    );
    return FrameFactory.link(
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
            maxLines: 1,
            overflow: .ellipsis,
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
