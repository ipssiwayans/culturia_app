import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get firaSans {
    return copyWith(
      fontFamily: 'FiraSans',
    );
  }

  TextStyle get numans {
    return copyWith(
      fontFamily: 'Numans',
    );
  }
}

class CustomTextStyles {
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );

  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );

  static get bodyLargeGray60001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray60001,
      );

  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );

  static get bodyMediumGray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray400,
      );

  static get bodyMediumGray50001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50001,
      );

  static get bodySmallGray50001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50001,
      );

  static get bodySmallGray50001_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50001,
      );

  static get headlineMediumGray900 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.gray900,
      );

  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );

  // MAIN
  static get titleMediumPrimaryColor => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.primaryColor,
      );
}
