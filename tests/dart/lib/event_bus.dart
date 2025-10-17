import 'dart:async';

class EventBus {
  final _controller = StreamController.broadcast();

  void add<T>(T event) => _controller.sink.add(event);

  Stream<T> on<T>({bool Function(T event)? when}) {
    return _controller.stream
        .where((event) => event is T && (when?.call(event) ?? true))
        .cast<T>();
  }
}
