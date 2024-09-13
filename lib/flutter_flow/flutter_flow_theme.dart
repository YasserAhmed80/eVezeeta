// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color customColor1;
  late Color richBlackFOGRA39;
  late Color blue;
  late Color turquoise;
  late Color cultured;
  late Color cerise;
  late Color customColor2;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF00D76D);
  late Color secondary = const Color(0xFF4169E1);
  late Color tertiary = const Color(0xFF6FAF73);
  late Color alternate = const Color(0xFFF1F5F9);
  late Color primaryText = const Color(0xFF333333);
  late Color secondaryText = const Color(0xFF757575);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFECF3EC);
  late Color accent1 = const Color(0xFF9C27B0);
  late Color accent2 = const Color(0xFFBBD3BD);
  late Color accent3 = const Color(0xFFFF4081);
  late Color accent4 = const Color(0xFF00BCD4);
  late Color success = const Color(0xFF8BC34A);
  late Color warning = const Color(0xFFFFC107);
  late Color error = const Color(0xFFF44336);
  late Color info = const Color(0xFF03A9F4);

  late Color customColor1 = Color(0xFFA1A9AE);
  late Color richBlackFOGRA39 = Color(0xFF070707);
  late Color blue = Color(0xFF6FAF73);
  late Color turquoise = Color(0xFF34D1BF);
  late Color cultured = Color(0xFFEFEFEF);
  late Color cerise = Color(0xFFD1345B);
  late Color customColor2 = Color(0x9800D76D);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Cairo';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.w300,
        fontSize: 52.0,
      );
  String get displayMediumFamily => 'Cairo';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Cairo';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Cairo';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Cairo';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Cairo';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Cairo';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Cairo';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Cairo',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Cairo';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Cairo',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Cairo';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Cairo',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Cairo';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Cairo',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Cairo';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Cairo',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Cairo';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Cairo';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Cairo';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Cairo',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4169E1);
  late Color secondary = const Color(0xFFFFE01B);
  late Color tertiary = const Color(0xFF303F9F);
  late Color alternate = const Color(0xFFD5CBC7);
  late Color primaryText = const Color(0xFFEEEEEE);
  late Color secondaryText = const Color(0xFFBDBDBD);
  late Color primaryBackground = const Color(0xFF121212);
  late Color secondaryBackground = const Color(0xFF212121);
  late Color accent1 = const Color(0xFF7B1FA2);
  late Color accent2 = const Color(0xFF1976D2);
  late Color accent3 = const Color(0xFFD81B60);
  late Color accent4 = const Color(0xFF0097A7);
  late Color success = const Color(0xFF689F38);
  late Color warning = const Color(0xFFFFA000);
  late Color error = const Color(0xFFD32F2F);
  late Color info = const Color(0xFF0288D1);

  late Color customColor1 = Color(0xFF068B53);
  late Color richBlackFOGRA39 = Color(0xFF070707);
  late Color blue = Color(0xFF3A28DE);
  late Color turquoise = Color(0xFF34D1BF);
  late Color cultured = Color(0xFFEFEFEF);
  late Color cerise = Color(0xFFD1345B);
  late Color customColor2 = Color(0xFF1EC675);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
