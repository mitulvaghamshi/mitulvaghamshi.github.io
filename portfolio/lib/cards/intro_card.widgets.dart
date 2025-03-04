part of 'intro_card.dart';

@immutable
class FullName extends StatelessWidget {
  const FullName({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.apply(
      bodyColor: context.colors.introText,
      displayColor: context.colors.introText,
    );
    return Frame.card(
      color: context.colors.introCard,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const MacOSTrafficLights(),
          Text.rich(
            TextSpan(
              text: '\$> whoami',
              style: style.titleMedium,
              children: [
                TextSpan(
                  text: '_\n',
                  style: style.headlineMedium!.copyWith(
                    color: context.colors.themeButton,
                  ),
                ),
                TextSpan(
                  text: '<Software Developer />\n',
                  style: style.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '^Mitul Vaghamshi',
                  style: style.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
    'assets/me.webp',
    width: 280,
    cacheWidth: 280,
    fit: BoxFit.contain,
    colorBlendMode: BlendMode.color,
    color: context.colors.imageBlend,
    frameBuilder: (_, child, _, _) =>
        Frame(margin: const EdgeInsets.all(8), animate: true, child: child),
  );
}

@immutable
class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.apply(
      bodyColor: context.colors.introText,
      displayColor: context.colors.introText,
    );
    return Frame.card(
      color: context.colors.introCard,
      child: Text(AppData.introText, style: style.bodyLarge),
    );
  }
}

@immutable
class SocialButtonBar extends StatelessWidget {
  const SocialButtonBar({super.key});

  @override
  Widget build(BuildContext context) => Frame.card(
    color: context.colors.introCard,
    child: context.config.build(
      mobileSmall290: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: AppData.socialLinks.map(SocialButton.new).toList(),
      ),
      laptopSmall940: Column(
        children: AppData.socialLinks.map(SocialButton.new).toList(),
      ),
    ),
  );
}

@immutable
class SocialButton extends StatelessWidget {
  const SocialButton(this.link, {super.key});

  final Deux link;

  @override
  Widget build(BuildContext context) => Link(
    uri: Uri.parse(link.url),
    target: LinkTarget.blank,
    builder: (_, followLink) => Frame(
      onTap: followLink,
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(8),
      child: SvgPicture.string(
        AppData.buildSVG(color: context.colors.introText!, data: link.value),
        width: context.width > 420 ? 32.0 : 24.0,
        height: context.width > 420 ? 32.0 : 24.0,
      ),
    ),
  );
}

@immutable
class MacOSTrafficLights extends StatelessWidget {
  const MacOSTrafficLights({
    super.key,
    this.onClose,
    this.onMinimize,
    this.onMaximize,
  });

  /// Callback for the Close (Red) button.
  final VoidCallback? onClose;

  /// Callback for the Minimize (Yellow) button.
  final VoidCallback? onMinimize;

  /// Callback for the Maximize/Fullscreen (Green) button.
  final VoidCallback? onMaximize;

  // The buttons are arranged in a horizontal Row.
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min, // Keep the row snug around the buttons
    children: [
      // 1. Red (Close) Button
      _TrafficLightButton(
        color: const Color(0xFFFC615C), // macOS Red
        hoverColor: const Color(0xFFF74E4A),
        onTap: onClose,
        icon: const Icon(Icons.close, size: 8, color: Colors.black45),
      ),
      const SizedBox(width: 8), // Standard spacing between the lights
      // 2. Yellow (Minimize) Button
      _TrafficLightButton(
        color: const Color(0xFFFBBC2D), // macOS Yellow
        hoverColor: const Color(0xFFF0AF29),
        onTap: onMinimize,
        icon: const Icon(Icons.remove, size: 8, color: Colors.black45),
      ),
      const SizedBox(width: 8),

      // 3. Green (Maximize) Button
      _TrafficLightButton(
        color: const Color(0xFF28CA41), // macOS Green
        hoverColor: const Color(0xFF23B53A),
        onTap: onMaximize,
        icon: const Icon(Icons.fullscreen, size: 8, color: Colors.black45),
      ),
      const SizedBox(width: 12),
      const Text('Terminal', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}

// Private helper widget for a single traffic light button.
@immutable
class _TrafficLightButton extends StatefulWidget {
  const _TrafficLightButton({
    required this.color,
    required this.hoverColor,
    required this.onTap,
    this.icon,
  });

  final Color color;
  final Color hoverColor;
  final VoidCallback? onTap;
  final Widget? icon;

  @override
  _TrafficLightButtonState createState() => _TrafficLightButtonState();
}

class _TrafficLightButtonState extends State<_TrafficLightButton> {
  bool _isHovering = false;

  // GestureDetector handles the tap action.
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: widget.onTap,
    // MouseRegion handles the hover effect, which is key to the macOS look.
    child: MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 12,
        height: 12,
        // Shape and background color
        decoration: BoxDecoration(
          color: _isHovering ? widget.hoverColor : widget.color,
          borderRadius: BorderRadius.circular(6), // Perfect circle
        ),
        // Center the icon when hovering
        child: Center(
          child: AnimatedOpacity(
            opacity: _isHovering ? 1.0 : 0.0, // Icon appears on hover
            duration: const Duration(milliseconds: 100),
            child: widget.icon,
          ),
        ),
      ),
    ),
  );
}
