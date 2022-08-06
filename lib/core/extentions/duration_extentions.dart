import 'package:flutter/cupertino.dart';

int lowValue = 500; //Milisaniye
int normalValue = 1; //Saniye
int mediumValue = 2;

extension DurationExtentions on BuildContext {
  Duration get durationLow => Duration(milliseconds: lowValue);
  Duration get durationNormal => Duration(seconds: normalValue);
  Duration get durationMedium => Duration(seconds: mediumValue);
}
