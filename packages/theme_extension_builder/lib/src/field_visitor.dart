import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class FieldVisitor extends SimpleElementVisitor {
  FieldVisitor({required this.className});

  final String className;

  final constructorBuffer = StringBuffer();
  final variableBuffer = StringBuffer();
  final copyWithBuffer = StringBuffer();
  final lerpBuffer = StringBuffer();
  final lightBuffer = StringBuffer();
  final darkBuffer = StringBuffer();

  @override
  void visitFieldElement(FieldElement element) {
    final color = element.displayName;
    constructorBuffer.write('required this.$color,');
    variableBuffer.write('final Color? $color;');
    copyWithBuffer.write('$color: $color,');
    lerpBuffer.write('$color: Color.lerp($color, other.$color, t),');
    lightBuffer.write('$color: $className.$color.\$1,');
    darkBuffer.write('$color: $className.$color.\$2,');
  }
}
