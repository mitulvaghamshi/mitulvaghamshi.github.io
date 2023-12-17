import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme_extension/theme_extension.dart';

void main() {
  test('Test @colorConfig annotation.', () {
    assert(TestColors.color1.$1 == Colors.white);
    assert(TestColors.color1.$2 == Colors.black);
  });
}

@colorConfig
class TestColors {
  static const color1 = (Color(0xFFFFFFFF), Color(0xFF000000));
}
