class ThemeTemplate {
  const ThemeTemplate({required this.clazz, required this.items});

  final String clazz;
  final Iterable<String> items;

  @override
  String toString() {
    final constructors = StringBuffer();
    final variables = StringBuffer();
    final parameters = StringBuffer();
    final copyWith = StringBuffer();
    final lerp = StringBuffer();
    final light = StringBuffer();
    final dark = StringBuffer();

    for (var color in items) {
      constructors.write('required this.$color,');
      variables.write('final Color? $color;');
      parameters.write('Color? $color,');
      copyWith.write('$color: $color,');
      lerp.write('$color: .lerp($color, other.$color, t),');
      light.write('$color: $clazz.$color.\$1,');
      dark.write('$color: $clazz.$color.\$2,');
    }

    return '''
      @immutable class \$$clazz extends ThemeExtension<\$$clazz> {
      const \$$clazz._({$constructors});

      $variables

      @override ThemeExtension<\$$clazz> copyWith({$parameters}) => \$$clazz._($copyWith);

      @override ThemeExtension<\$$clazz> lerp(\$$clazz? other, double t) {
        if (other is! \$$clazz) return this;
        return \$$clazz._($lerp);
      }

      static final \$$clazz _lightThemeExt = ._($light);

      static final \$$clazz _darkThemeExt = ._($dark);
      }

      extension ${clazz}ThemeExtension on $clazz {
        \$$clazz get lightThemeExtension => ._lightThemeExt;
        \$$clazz get darkThemeExtension => ._darkThemeExt;
      }

      extension \$${clazz}Extension on BuildContext {
        \$$clazz get colors => Theme.of(this).extension<\$$clazz>()!;
      }
    ''';
  }
}
