import 'package:flutter/cupertino.dart';

double lowValue = 10;
double normalValue = 20;

extension RadiusExtention on BuildContext {
  BorderRadius get radiusLow => BorderRadius.circular(lowValue);
  BorderRadius get radiusNormal => BorderRadius.circular(normalValue);

  BorderRadius radiusLowOnly(
          {bool topLeft = false,
          bool topRight = false,
          bool bottomLeft = false,
          bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: topLeft ? Radius.circular(lowValue) : Radius.zero,
        topRight: topRight ? Radius.circular(lowValue) : Radius.zero,
        bottomLeft: bottomLeft ? Radius.circular(lowValue) : Radius.zero,
        bottomRight: bottomRight ? Radius.circular(lowValue) : Radius.zero,
      );
  BorderRadius radiusNormalOnly(
          {bool topLeft = false,
          bool topRight = false,
          bool bottomLeft = false,
          bool bottomRight = false}) =>
      BorderRadius.only(
        topLeft: topLeft ? Radius.circular(normalValue) : Radius.zero,
        topRight: topRight ? Radius.circular(normalValue) : Radius.zero,
        bottomLeft: bottomLeft ? Radius.circular(normalValue) : Radius.zero,
        bottomRight: bottomRight ? Radius.circular(normalValue) : Radius.zero,
      );
}
