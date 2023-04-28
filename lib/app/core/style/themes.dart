// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import das telas
import 'package:search_and_stay/app/core/style/app_colors.dart';

class Themes {
  Themes._();

  // Light colors
  static const Color _backgroundColorLight = AppColors.whiteSmoke;
  static const Color _primaryColorLight = AppColors.orangeRed;
  static const Color _secondaryColorLight = AppColors.pinkSwan;
  static const Color _tertiaryColorLight = AppColors.chateauGreen;
  static const Color _textPrimaryLight = AppColors.blueCharcoal;

  // .****************
  // Theme - Light
  // .****************
  static const DividerThemeData _dividerThemeDataLight = DividerThemeData(
    color: _secondaryColorLight,
    indent: 16,
    endIndent: 16,
    thickness: 2,
  );

  static const TextStyle _headlineLargeTextLight = TextStyle(
    fontWeight: FontWeight.bold,
    color: _textPrimaryLight,
    fontSize: 18,
  );

  static const TextStyle _displayLargeTextLight = TextStyle(
    fontWeight: FontWeight.w600,
    color: _textPrimaryLight,
    fontSize: 20,
  );

  static const TextStyle _displayMediumTextLight = TextStyle(
    fontWeight: FontWeight.w500,
    color: _textPrimaryLight,
    fontSize: 16,
  );

  static const TextStyle _displaySmallTextLight = TextStyle(
    color: _tertiaryColorLight,
    fontSize: 17,
  );

  static const TextStyle _defaultTextLight = TextStyle(
    color: _textPrimaryLight,
  );

  static const TextStyle _labelMediumTextLight = TextStyle(
    color: _textPrimaryLight,
    fontSize: 15,
  );

  static const TextStyle _labelSmallTextLight = TextStyle(
    color: _tertiaryColorLight,
    fontSize: 12,
  );

  static const TextTheme _textThemeLight = TextTheme(
    headlineLarge: _headlineLargeTextLight,
    displayLarge: _displayLargeTextLight,
    displayMedium: _displayMediumTextLight,
    displaySmall: _displaySmallTextLight,
    bodyMedium: _defaultTextLight,
    labelMedium: _labelMediumTextLight,
    labelSmall: _labelSmallTextLight,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColorLight,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: _primaryColorLight,
      ),
      iconTheme: IconThemeData(
        color: _textPrimaryLight,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _primaryColorLight,
      surfaceTintColor: _secondaryColorLight,
    ),
    textTheme: _textThemeLight,
    colorScheme: const ColorScheme.dark(
      background: _backgroundColorLight,
      primary: _primaryColorLight,
      secondary: _secondaryColorLight,
      tertiary: _tertiaryColorLight,
      error: AppColors.cinnabar,
    ),
    cardTheme: CardTheme(
      color: _primaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 10 ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: _primaryColorLight,
      size: 18,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _backgroundColorLight,
      titleTextStyle: TextStyle(
        color: _textPrimaryLight,
        fontSize: 20,
      ),
      contentTextStyle: TextStyle(
        color: _textPrimaryLight,
      ),
    ),
    dividerTheme: _dividerThemeDataLight,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      labelStyle: _defaultTextLight,
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: _primaryColorLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _primaryColorLight,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _tertiaryColorLight,
        padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 12 ),
        side: const BorderSide(
          color: _tertiaryColorLight,
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}