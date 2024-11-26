abstract class PrinterType {
  String get type;

  String get desc;

  void execute();

  Map<String, dynamic> toMap();
}

typedef PrinterTypeFactory = PrinterType Function(Map<String, dynamic>? data);

class PrinterTypeRegistry {
  static final Map<String, PrinterTypeFactory> _registry = {};

  static void register(String type, PrinterTypeFactory factory) {
    _registry[type] = factory;
  }

  static PrinterType? getPrintType(String type, [Map<String, dynamic>? data]) {
    final factory = _registry[type];
    if (factory != null) {
      return factory(data);
    }
    return null;
  }
}
