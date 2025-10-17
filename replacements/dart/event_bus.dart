import 'dart:async';
import 'dart:developer';

/// Package: https://pub.dev/packages/event_bus
///
/// Event bus is literally just a wrapper around a [Stream].
class EventBus {
  final _controller = StreamController.broadcast();

  void add<T>(T event) => _controller.sink.add(event);

  Stream<T> on<T>({bool Function(T event)? when}) {
    return _controller.stream
        .where((event) => event is T && (when?.call(event) ?? true))
        .cast<T>();
  }
}

void main() {
  final bus = EventBus();
  bus.on<String>(when: (event) => event == 'foo').listen(log);
  bus.add('foo');
  bus.add('bar');
  bus.add('baz');
  bus.add('foo');
}
