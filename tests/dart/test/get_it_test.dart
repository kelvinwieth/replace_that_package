import 'dart:io';

import 'package:dart/get_it.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class Service {}

void main() {
  tearDown(() => ServiceLocator.clear());

  test('registerSingleton works', () {
    // Arrange
    final service = Service();

    // Act
    ServiceLocator.registerSingleton(service);

    // Assert
    expect(ServiceLocator.get<Service>(), equals(service));
    expect(ServiceLocator.get<Service>(), equals(service));
  });

  test('registerFactory works', () {
    // Arrange
    // Act
    ServiceLocator.registerFactory(Service.new);

    // Assert
    expect(
      ServiceLocator.get<Service>(),
      isNot(equals(ServiceLocator.get<Service>())),
    );
  });

  test('unregister works', () {
    // Arrange
    ServiceLocator.registerSingleton(Service());
    expect(ServiceLocator.get<Service>, returnsNormally);

    // Act
    ServiceLocator.unregister<Service>();

    // Assert
    expect(ServiceLocator.get<Service>, throwsA(anything));
  });

  test('clear works', () {
    // Arrange
    ServiceLocator.registerSingleton(Service());
    ServiceLocator.registerSingleton('foo');
    expect(ServiceLocator.get<Service>, returnsNormally);
    expect(ServiceLocator.get<String>, returnsNormally);

    // Act
    ServiceLocator.clear();

    // Assert
    expect(ServiceLocator.get<Service>, throwsA(anything));
    expect(ServiceLocator.get<String>, throwsA(anything));
  });

  test('class duplication is correct', () async {
    // Arrange
    final referenceFile = File('../../replacements/dart/get_it.dart');
    final referenceContent = referenceFile.readAsStringSync();
    final filteredReferenceContent = referenceContent
        .split('\n')
        .where((line) => !line.trimLeft().startsWith('///'))
        .join('\n');

    // Act
    final currentContent = File('lib/get_it.dart').readAsStringSync();

    // Assert
    expect(currentContent, equals(filteredReferenceContent));
  });
}
