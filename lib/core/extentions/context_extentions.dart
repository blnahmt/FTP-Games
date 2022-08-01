import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  double dynamicWidth(int value) =>
      MediaQuery.of(this).size.width * (value / 100);

  double dynamicHeight(int value) =>
      MediaQuery.of(this).size.height * (value / 100);

  get theme => Theme.of(this);
}
