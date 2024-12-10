sealed class ServiceLocator {
  static final Map<Type, dynamic> _services = {};

  static void registerSingleton<T>(T service) => _services[T] = service;

  static void registerFactory<T>(T Function() func) => _services[T] = func;

  static T get<T>() {
    final singletonOrFactory = _services[T];
    if (singletonOrFactory is T Function()) return singletonOrFactory.call();
    return singletonOrFactory;
  }

  static void unregister<T>() => _services.remove(T);

  static void clear() => _services.clear();
}
