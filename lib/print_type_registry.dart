abstract class PrinterType {
  int get type;

  void execute();

  Map<String, dynamic> toMap();
}

typedef PrinterTypeFactory = PrinterType Function(Map<String, dynamic>? data);

class PrinterTypeRegistry {
  static final Map<int, PrinterTypeFactory> _registry = {};
  static Map<int, PrinterTypeFactory> get registry => _registry;

  static void register(int type, PrinterTypeFactory factory) {
    _registry[type] = factory;
  }

  static PrinterType? getPrintType(int type, [Map<String, dynamic>? data]) {
    final factory = _registry[type];
    if (factory != null) {
      return factory(data);
    }
    return null;
  }
}
