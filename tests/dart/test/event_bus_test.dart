import 'dart:async';
import 'package:dart/event_bus.dart';
import 'package:test/test.dart';

void main() {
  test('when event of matching type is added, listener receives it', () async {
    // Arrange
    final bus = EventBus();
    final received = <String>[];

    // Act
    bus.on<String>().listen(received.add);
    bus.add('foo');
    bus.add('bar');
    bus.add(123); // ignored (wrong type)
    await Future.delayed(Duration.zero);

    // Assert
    expect(received, ['foo', 'bar']);
  });

  test('when filter is provided, only matching events are received', () async {
    // Arrange
    final bus = EventBus();
    final received = <String>[];

    // Act
    bus.on<String>(when: (e) => e.startsWith('b')).listen(received.add);
    bus.add('foo');
    bus.add('bar');
    bus.add('baz');
    await Future.delayed(Duration.zero);

    // Assert
    expect(received, ['bar', 'baz']);
  });

  test('when no listeners, adding events does not throw', () {
    // Arrange
    final bus = EventBus();

    // Act / Assert
    expect(() => bus.add('test'), returnsNormally);
  });

  test('when multiple listeners, all receive matching events', () async {
    // Arrange
    final bus = EventBus();
    final listener1 = <String>[];
    final listener2 = <String>[];

    // Act
    bus.on<String>().listen(listener1.add);
    bus.on<String>().listen(listener2.add);
    bus.add('foo');
    await Future.delayed(Duration.zero);

    // Assert
    expect(listener1, ['foo']);
    expect(listener2, ['foo']);
  });
}
