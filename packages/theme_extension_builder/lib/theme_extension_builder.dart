library;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:theme_extension_builder/src/theme_generator.dart';

Builder extensionBuilder(BuilderOptions options) {
  return SharedPartBuilder([const ThemeGenerator()], 'theme_extension_builder');
}
