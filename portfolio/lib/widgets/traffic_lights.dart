import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class TrafficLights extends StatelessWidget {
  const TrafficLights({
    super.key,
    this.title,
    this.onClose,
    this.onMinimize,
    this.onMaximize,
  });

  final Widget? title;
  final VoidCallback? onClose;
  final VoidCallback? onMinimize;
  final VoidCallback? onMaximize;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: .min,
    children: [
      // 1. Red (Close) Button
      _TrafficLightButton(
        onTap: onClose,
        color: const Color(0xFFFF5950),
        hoverColor: CupertinoColors.destructiveRed,
        icon: const Icon(Icons.close, size: 10),
      ),
      const SizedBox(width: 8),
      // 2. Yellow (Minimize) Button
      _TrafficLightButton(
        onTap: onMinimize,
        color: const Color(0xFFFFD83D),
        hoverColor: CupertinoColors.systemYellow,
        icon: const Icon(Icons.remove, size: 10),
      ),
      const SizedBox(width: 8),
      // 3. Green (Maximize) Button
      _TrafficLightButton(
        onTap: onMaximize,
        color: CupertinoColors.systemGreen,
        hoverColor: CupertinoColors.activeGreen,
        icon: const Icon(Icons.fullscreen, size: 10),
      ),
      const SizedBox(width: 12),
      ?title,
    ],
  );
}

@immutable
class _TrafficLightButton extends StatefulWidget {
  const _TrafficLightButton({
    required this.color,
    required this.hoverColor,
    required this.onTap,
    this.icon,
  });

  final Color? color;
  final Color hoverColor;
  final VoidCallback? onTap;
  final Widget? icon;

  @override
  State<_TrafficLightButton> createState() => _TrafficLightButtonState();
}

class _TrafficLightButtonState extends State<_TrafficLightButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: widget.onTap,
    // MouseRegion handles the hover effect, which is key to the macOS look.
    child: MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        width: 14,
        height: 14,
        clipBehavior: .antiAlias,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: _isHovering ? widget.hoverColor : widget.color,
          borderRadius: .circular(10), // Perfect circle
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _isHovering ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 100),
            child: widget.icon,
          ),
        ),
      ),
    ),
  );
}
