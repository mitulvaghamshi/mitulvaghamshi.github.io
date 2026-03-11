import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/frame_factory.dart';

@immutable
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: FrameFactory.card(
      onTap: () {},
      animate: true,
      color: context.colors.introCard,
      child: const SizedBox.shrink(),
    ),
  );
}
