import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/theme/colors_model.dart';

@immutable
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Frame.card(
      onTap: () {},
      animate: true,
      color: context.colors.introCard,
      child: const SizedBox.shrink(),
    ),
  );
}
