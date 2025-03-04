import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:theme_extension/theme_extension.dart';
import 'package:theme_extension_builder/src/field_visitor.dart';
import 'package:theme_extension_builder/src/theme_template.dart';

class ThemeExtensionGenerator extends GeneratorForAnnotation<ColorConfig> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final template = ThemeTemplate(
      element: element,
      visitor: FieldVisitor(className: element.displayName),
    )..visit();
    return template.toString();
  }
}
