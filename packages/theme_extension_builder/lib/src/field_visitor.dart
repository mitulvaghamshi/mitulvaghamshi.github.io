import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor2.dart';

class FieldVisitor extends SimpleElementVisitor2 {
  FieldVisitor() : items = [];

  final List<String> items;

  @override
  void visitFieldElement(FieldElement element) {
    items.add(element.displayName);
  }
}
