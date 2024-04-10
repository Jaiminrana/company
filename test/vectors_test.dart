import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:company/resources/resources.dart';

void main() {
  test('vectors assets test', () {
    expect(File(Vectors.imagePlaceholder).existsSync(), isTrue);
    expect(File(Vectors.search).existsSync(), isTrue);
  });
}
