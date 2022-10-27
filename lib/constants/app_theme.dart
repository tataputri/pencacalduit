import 'package:firemax_football/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    // highlightColor: Colors.transparent,
    // splashColor: Colors.transparent,
    scaffoldBackgroundColor: Constant.xColorDark,
    colorScheme: const ColorScheme.dark(
      primary: Constant.xColorLight,
      secondary: Constant.xColorPrimarySub,
      onPrimary: Constant.xColorAccents,
    ),
    iconTheme: const IconThemeData(
      color: Constant.xColorLight,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Constant.xColorDarkSub,
        titleTextStyle: GoogleFonts.jost(
          fontSize: 18,
          fontWeight: Constant.bold,
          color: Constant.xColorLight,
        ),
        titleSpacing: 0),
    textTheme: TextTheme(
      headline1: GoogleFonts.jost(
        fontSize: 24,
        color: Constant.xColorLight,
        fontWeight: Constant.bold,
      ),
      headline2: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: Constant.regular,
        color: Constant.xColorLight,
      ),
      headline3: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: Constant.medium,
        color: Constant.xColorLight,
      ),
      headline4: GoogleFonts.jost(
        fontSize: 18,
        fontWeight: Constant.bold,
        color: Constant.xColorLight,
      ),
      headline5: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: Constant.bold,
        color: Constant.xColorLight,
      ),
      headline6: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: Constant.medium,
        color: Constant.xColorLight,
      ),
      bodyText1: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: Constant.regular,
        color: Constant.xColorLight,
      ),
      bodyText2: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: Constant.light,
        color: Constant.xColorLightSub,
      ),
      subtitle1: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: Constant.regular,
        color: Constant.xColorLight,
      ),
      subtitle2: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: Constant.regular,
        color: Constant.xColorLightSub,
      ),
    ),
  );
}
