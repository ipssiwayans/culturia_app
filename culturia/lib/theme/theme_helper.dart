import 'package:culturia/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
// import '../core/app_export.dart';

String _appTheme = "lightCode";

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

// Une classe pour gérer les themes et les couleurs

class ThemeHelper {
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: appTheme.gray500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero),
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.fSize,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray100,
          fontSize: 14.fSize,
          fontFamily: 'Numans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 12.fSize,
          fontFamily: 'Numans',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 32.fSize,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 28.fSize,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray50001,
          fontSize: 12.fSize,
          fontFamily: 'Numans',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 20.fSize,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.fSize,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 14.fSize,
          fontFamily: 'Fira Sans',
          fontWeight: FontWeight.w600,
        ),
      );
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // Noir
  Color get black900 => const Color(0XFF000000);

  // Gris bleuté
  Color get blueGray100 => const Color(0XFFCDCDCD);

  // Gris
  Color get gray400 => const Color(0XFFC4C4C4);

  Color get gray500 => const Color(0XFFB9848C);

  Color get gray50001 => const Color(0XFF9D9D9D);

  Color get gray600 => const Color(0XFF725188);

  Color get gray60001 => const Color(0XFF806491);

  Color get gray900 => const Color(0XFF19191B);

  // Rouge
  Color get red400 => const Color(0XFFD45454);

  // Blanc
  Color get whiteA700 => const Color(0XFFFDFDFD);

  Color get whiteA70001 => const Color(0xFFFFFFFF);
}
