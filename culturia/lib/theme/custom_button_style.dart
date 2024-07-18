import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomButtonStyles {
  static ButtonStyle get fillGrayTL10 => ElevatedButton.styleFrom(
      backgroundColor: appTheme.gray60001,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.h),
      ),
  );
  static ButtonStyle get fillGrayTL101 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray400.withOpacity(0.15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(color: Colors.transparent)
    )
  );
}