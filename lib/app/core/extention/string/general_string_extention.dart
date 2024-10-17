final class GeneralStringExtention {
  GeneralStringExtention(String value) : _string = value;

  final String _string;

  String get removeAfterDot {
    int dotIndex = _string.indexOf('.');

    if (dotIndex != -1) {
      return _string.substring(0, dotIndex);
    }

    return _string;
  }
}
