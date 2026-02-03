import 'package:flutter_test/flutter_test.dart';
import 'package:theme_extension_builder/src/theme_template.dart';

// Reference Color Class.
//
// @colorconfig
// class AppColors {
//   static const buttonColor = (Colors.green, Colors.lightGreen);
//   static const surfaceColor = (Colors.blue, Colors.lightBlue);
// }

void main() {
  /// Will assume that build_runner does its job and spits out correct result.
  group('Test ThemeTemplate class output.', () {
    const className = 'AppColors';
    const fieldName1 = 'buttonColor';
    const fieldName2 = 'surfaceColor';

    /// ThemeTemplate expects result from FieldVisitor class,
    /// the FieldVisitor class will parse the annotated class and
    /// provides list of strings containing field names.
    /// - className: String - from root class (Element.displayName)
    /// - items: List<String> - name of source class fields.
    final output = const ThemeTemplate(
      clazz: className,
      items: [fieldName1, fieldName2],
    ).toString();

    test('Generated output is not empty.', () {
      expect(output, isNotEmpty);
    });
    test('hasClassDeclaration', () {
      final hasClassDeclaration = output.contains(
        '@immutable class \$$className extends ThemeExtension<\$$className>',
      );
      expect(hasClassDeclaration, isTrue);
    });

    test('$fieldName1 and has $fieldName2', () {
      final hasButtonColor = output.contains('final Color? $fieldName1;');
      final hasSurfaceColor = output.contains('final Color? $fieldName2;');
      expect(hasButtonColor, isTrue);
      expect(hasSurfaceColor, isTrue);
    });

    test('hasCopyWithMethod', () {
      final hasCopyWithMethod = output.contains(
        '@override ThemeExtension<\$$className> copyWith',
      );
      expect(hasCopyWithMethod, isTrue);
    });

    test('hasLerpMethod', () {
      final hasLerpMethod = output.contains(
        '@override ThemeExtension<\$$className> '
        'lerp(\$$className? other, double t)',
      );
      expect(hasLerpMethod, isTrue);
    });

    test('hasLightThemeExt amd hasDarkThemeExt', () {
      final hasLightThemeExt = output.contains(
        'static final \$$className _lightThemeExt = '
        '._($fieldName1: $className.$fieldName1.\$1,'
        '$fieldName2: $className.$fieldName2.\$1,);',
      );
      final hasDarkThemeExt = output.contains(
        'static final \$$className _darkThemeExt = '
        '._($fieldName1: $className.$fieldName1.\$2,'
        '$fieldName2: $className.$fieldName2.\$2,);',
      );
      expect(hasLightThemeExt, isTrue);
      expect(hasDarkThemeExt, isTrue);
    });

    test(
      'hasAppColorsThemeExtension with light-theme and dark-theme getters.',
      () {
        final hasAppColorsThemeExtension = output.contains(
          'extension AppColorsThemeExtension on AppColors',
        );
        final hasLightThemeExtensionGetter = output.contains(
          '\$$className get lightThemeExtension => ._lightThemeExt;',
        );
        final hasDarkThemeExtensionGetter = output.contains(
          '\$$className get darkThemeExtension => ._darkThemeExt;',
        );
        expect(hasAppColorsThemeExtension, isTrue);
        expect(hasLightThemeExtensionGetter, isTrue);
        expect(hasDarkThemeExtensionGetter, isTrue);
      },
    );

    test('hasExtensionOnBuildContext and colors getter.', () {
      final hasExtensionOnBuildContext = output.contains(
        'extension \$${className}Extension on BuildContext',
      );
      final hasColorsGetterOnBuildContext = output.contains(
        '\$$className get colors => '
        'Theme.of(this).extension<\$$className>()!;',
      );
      expect(hasExtensionOnBuildContext, isTrue);
      expect(hasColorsGetterOnBuildContext, isTrue);
    });
  });
}
