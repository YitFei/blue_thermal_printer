abstract class PrintType {
  String get type;

  void execute();

  Map<String, dynamic> toMap();
}

typedef PrintTypeFactory = PrintType Function(Map<String, dynamic>? data);

class PrintTypeRegistry {
  static final Map<String, PrintTypeFactory> _registry = {};

  static void register(String type, PrintTypeFactory factory) {
    _registry[type] = factory;
  }

  static PrintType? getPrintType(String type, [Map<String, dynamic>? data]) {
    final factory = _registry[type];
    if (factory != null) {
      return factory(data);
    }
    return null;
  }
}
