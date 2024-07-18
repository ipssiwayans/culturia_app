import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray400.withOpacity(0.15),
  );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
    10.h,
  );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
    20.h,
  );
}