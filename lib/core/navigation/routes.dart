enum Routes { init, gameDetail }

extension RoutesExtention on Routes {
  String get slash => "/";
  String get nameWithSlash => "/$name";
}
