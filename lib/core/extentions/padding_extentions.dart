import 'package:flutter/cupertino.dart';

double zero = 0.0;
double lowValue = 4.0;
double normalValue = 8.0;
double mediumValue = 10.0;
double highValue = 12.0;

extension PaddingExtentions on BuildContext {
  //All side
  EdgeInsets get paddingLowAll => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormalAll => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMediumAll => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHighAll => EdgeInsets.all(highValue);

  //Symetric
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  //One side
  EdgeInsets paddingLowOnly(
          {bool top = false,
          bool bottom = false,
          bool left = false,
          bool right = false}) =>
      EdgeInsets.only(
        top: top ? lowValue : zero,
        left: left ? lowValue : zero,
        right: right ? lowValue : zero,
        bottom: bottom ? lowValue : zero,
      );
  EdgeInsets paddingNormalOnly(
          {bool top = false,
          bool bottom = false,
          bool left = false,
          bool right = false}) =>
      EdgeInsets.only(
        top: top ? normalValue : zero,
        left: left ? normalValue : zero,
        right: right ? normalValue : zero,
        bottom: bottom ? normalValue : zero,
      );
  EdgeInsets paddingMediumOnly(
          {bool top = false,
          bool bottom = false,
          bool left = false,
          bool right = false}) =>
      EdgeInsets.only(
        top: top ? mediumValue : zero,
        left: left ? mediumValue : zero,
        right: right ? mediumValue : zero,
        bottom: bottom ? mediumValue : zero,
      );
  EdgeInsets paddingHighOnly(
          {bool top = false,
          bool bottom = false,
          bool left = false,
          bool right = false}) =>
      EdgeInsets.only(
        top: top ? highValue : zero,
        left: left ? highValue : zero,
        right: right ? highValue : zero,
        bottom: bottom ? highValue : zero,
      );
}
