extension Doubles on double {
  static double safe(double? d) {
    var newDouble;
    if (d == null) {
      newDouble = 0.0;
    } else {
      newDouble = d;
    }
    return newDouble;
  }
}

extension Strings on String {
  static String safe(String? s) {
    var newString;
    if (s == null) {
      newString = "";
    } else {
      newString = s;
    }
    return newString;
  }
}

extension Integers on int {
  static int safe(int? i) {
    var newInt;
    if (i == null) {
      newInt = 0;
    } else {
      newInt = i;
    }
    return newInt;
  }
}

extension Bools on bool {
  static bool safe(bool? i) {
    var newValue;
    if (i == null) {
      newValue = false;
    } else {
      newValue = i;
    }
    return newValue;
  }
}
