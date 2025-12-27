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

  final String? title;
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
        color: const Color(0xFFFC615C), // macOS Red
        hoverColor: const Color(0xFFF74E4A),
        icon: const Icon(Icons.close, size: 8, color: Colors.black45),
      ),
      const SizedBox(width: 8),
      // 2. Yellow (Minimize) Button
      _TrafficLightButton(
        onTap: onMinimize,
        color: const Color(0xFFFBBC2D), // macOS Yellow
        hoverColor: const Color(0xFFF0AF29),
        icon: const Icon(Icons.remove, size: 8, color: Colors.black45),
      ),
      const SizedBox(width: 8),
      // 3. Green (Maximize) Button
      _TrafficLightButton(
        onTap: onMaximize,
        color: const Color(0xFF28CA41), // macOS Green
        hoverColor: const Color(0xFF23B53A),
        icon: const Icon(Icons.fullscreen, size: 8, color: Colors.black45),
      ),
      const SizedBox(width: 12),
      Text(title ?? 'Terminal', style: const TextStyle(fontWeight: .bold)),
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
        width: 12,
        height: 12,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: _isHovering ? widget.hoverColor : widget.color,
          borderRadius: .circular(6), // Perfect circle
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
