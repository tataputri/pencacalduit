import 'package:flutter/material.dart';

class Constant {
  static const String xScreenRoot = "/";
  static const String xScreenBlokir = "/blokir";
  static const String xScreenDash = "/dash";
  static const String xScreenALlMatch = "/all-match";
  static const String xScreenALlLive = "/all-live";
  static const String xScreenSearch = "/search";
  static const String xScreenDetail = "/detail";
  static const String xScreenDetailLiga = "/detail-liga";
  static const String xScreenBlank = "/blank";
  static const String xScreenExoPlayer = "/exo-player";
  static const String xScreenEmbedPLayer = "/embed-player";
  // static const String xScreenALlLiga = "/all-liga";

  static const Color xColorDark = Color(0xff222831);
  static const Color xColorDarkSub = Color(0xff393E46);

  static const Color xColorLight = Color(0xffEEEEEE);
  static const Color xColorLightSub = Color(0xff999999);

  static const Color xColorPrimary = Color(0xff56042C);
  static const Color xColorPrimarySub = Color(0xffF2DAE6);

  static const Color xColorAccents = Color(0xff59CE8F);
  static const Color xColorAccentsSub = Color(0xFFAFF5CF);

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  static const double xDefaultSize = 12;
  static double xSizeWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double xSizeHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets xSpaceSymetric({
    double vertical = 0,
    double horizontal = 0,
  }) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static EdgeInsets xSpaceOnly({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) =>
      EdgeInsets.only(bottom: bottom, left: left, right: right, top: top);
}
