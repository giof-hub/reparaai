extension MapExtensions on Map? {
  T getValueOrDefault<T>({required dynamic key, required T def}) {
    var value = this?[key];
    if (value == null) return def;
    if (value is T) return value;

    return _tryParseValue(value, def);
  }

  dynamic _tryParseValue<T>(dynamic value, T def) {
    try {
      if (T.toString().startsWith("String")) {
        return value.toString() as T?;
      } else if (T.toString().startsWith("double")) {
        return double.parse(value.toString()) as T?;
      } else if (T.toString().startsWith("int")) {
        return int.parse(value.toString()) as T?;
      } else if (T.toString().startsWith("bool")) {
        return (value.toString().toLowerCase() == "true") as T?;
      } else if (T.toString().startsWith("DateTime")) {
        return DateTime.parse(value.toString()) as T?;
      } else if (T.toString().startsWith("Null")) {
        return value;
      }

      return value as T?;
    } catch (e) {
      return null;
    }
  }
}