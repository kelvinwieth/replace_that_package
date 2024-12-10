/// ServiceLocator is an implementation of the "Service Locator" design pattern for Dart and Flutter projects.
///
/// Main functionalities:
/// - Register a singleton: `ServiceLocator.registerSingleton(service)`
/// - Register a factory: `ServiceLocator.registerFactory(Service.new)`
/// - Retrieve a service: `ServiceLocator.get<Service>()`
///
/// Advantages over the official `get_it` package:
/// - A more beginner-friendly name, reflecting a well-known design pattern.
/// - A more concise implementation, avoiding the 2700 lines of code in the official `get_it` package.
/// - Flexibility for customizations, such as retrieving a service by runtime type, not just by the registered type.
///
/// Example usage:
/// ```dart
/// final service = MyService();
/// ServiceLocator.registerSingleton(service);
/// final retrievedService = ServiceLocator.get<MyService>();
/// ```
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
