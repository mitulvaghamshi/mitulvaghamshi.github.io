import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/theme/colors_model.dart';

@immutable
class PictureWidget extends StatelessWidget {
  const PictureWidget({super.key, required this.width});

  final int width;

  @override
  Widget build(BuildContext context) => Image.asset(
    'assets/me.webp',
    width: width.toDouble(),
    cacheWidth: width,
    fit: .cover,
    colorBlendMode: .color,
    color: context.colors.imageBlend,
    frameBuilder: (_, child, _, _) =>
        Frame(margin: const .all(8), animate: true, child: child),
  );
}
