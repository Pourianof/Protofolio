import 'package:flutter/material.dart';

abstract final class AppStyles {
  static const cardBorderRadiusValue = 25.0;
  static const mainViewPadding = 40.0;
  static const inputBorderRadius = 15.0;

  static const inputFontSize = 18.0;

  static final cardBorderRadius =
      BorderRadius.circular(AppStyles.cardBorderRadiusValue);
  static final tableRowBorderRadius = BorderRadius.circular(20);

  static const cardPadding = EdgeInsets.symmetric(horizontal: 36, vertical: 25);
  static const tableRowPadding = EdgeInsets.all(15);
}
