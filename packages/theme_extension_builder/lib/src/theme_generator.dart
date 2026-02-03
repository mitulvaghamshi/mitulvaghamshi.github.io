import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:theme_extension/theme_extension.dart';
import 'package:theme_extension_builder/src/field_visitor.dart';
import 'package:theme_extension_builder/src/theme_template.dart';

class ThemeGenerator extends GeneratorForAnnotation<ColorConfig> {
  const ThemeGenerator();

  @override
  FutureOr<String> generateForAnnotatedElement(Element element, _, _) async {
    final visitor = FieldVisitor();
    element.visitChildren(visitor);

    final template = ThemeTemplate(
      clazz: element.displayName,
      items: visitor.items,
    );
    return template.toString();
  }
}
