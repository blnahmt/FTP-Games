extension StringExtention on String {
  String get inCaps => "${this[0].toUpperCase()}${substring(1)}";
}
