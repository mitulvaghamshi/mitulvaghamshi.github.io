import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme_extension/src/color_config.dart';

void main() {
  group('Test annotation and source color class.', () {
    test('Test @colorConfig annotation.', () {
      expect(colorconfig, const ColorConfig());
    });
    test('Test color getter of color Record.', () {
      expect(TestColors.color.$1, Colors.white);
      expect(TestColors.color.$2, Colors.black);
    });
  });
}

@colorconfig
interface class TestColors {
  static const color = (Color(0xFFFFFFFF), Color(0xFF000000));
}
