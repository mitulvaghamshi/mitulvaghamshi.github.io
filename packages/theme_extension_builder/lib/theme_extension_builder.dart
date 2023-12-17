library;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:theme_extension_builder/src/theme_extension_generator.dart';

Builder themeExtensionBuilder(BuilderOptions options) =>
    SharedPartBuilder([ThemeExtensionGenerator()], 'theme_extension_builder');
