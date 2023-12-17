import 'package:analyzer/dart/element/element.dart';
import 'package:theme_extension_builder/src/field_visitor.dart';

class ThemeTemplate {
  const ThemeTemplate({required this.element, required this.visitor});

  final Element element;
  final FieldVisitor visitor;

  String get className => visitor.className;

  void visit() => element.visitChildren(visitor);

  @override
  String toString() {
    return '''
@immutable
class  \$$className extends ThemeExtension<\$$className> {
  const \$$className._({${visitor.constructorBuffer}});

  ${visitor.variableBuffer}

  @override
  ThemeExtension<\$$className> copyWith({
    ${visitor.variableBuffer.toString().replaceAll(';', ',')}
  }) {
    return \$$className._(${visitor.copyWithBuffer});
  }

  @override
  ThemeExtension<\$$className> lerp(
    covariant ThemeExtension<\$$className>? other,
    double t,
  ) {
    if (other is! \$$className) return this;
    return \$$className._(${visitor.lerpBuffer});
  }

  static final \$$className _lightTheme = \$$className._(${visitor.lightBuffer});

  static final \$$className _darkTheme = \$$className._(${visitor.darkBuffer});
}

extension ${className}ThemeExtension on $className {
  \$$className get lightTheme => \$$className._lightTheme;
  \$$className get darkTheme => \$$className._darkTheme;
}

extension \$${className}Extension on BuildContext {
  \$$className get colors => Theme.of(this).extension<\$$className>()!;
}

''';
  }
}
