import 'package:firemax_football/views/pages/all_liga_page/all_liga_page.dart';
import 'package:firemax_football/views/pages/all_live_page/all_live_page.dart';
import 'package:firemax_football/views/pages/all_match_page/all_match_page.dart';
import 'package:firemax_football/views/pages/play_page/play_page.dart';
import 'package:firemax_football/views/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/views/pages/blank_page/blank_page.dart';
import 'package:firemax_football/views/pages/home_page/home_page.dart';
import 'package:firemax_football/views/pages/validation_page/validation_page.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case xRouteVaValidation:
        return MaterialPageRoute(builder: (_) => const ValidationPage());
      case xRouteHome:
        var arg = settings.arguments as dynamic;
        return MaterialPageRoute(
            builder: (_) => HomePage(
                  modelRoute: arg,
                ));
      case xRouteSearch:
        var arg = settings.arguments as dynamic;
        return MaterialPageRoute(
            builder: (_) => SearchPage(
                  modelRoute: arg,
                ));
      case xRouteALlLive:
        var arg = settings.arguments as dynamic;
        return MaterialPageRoute(
            builder: (_) => AllLivePage(
                  modelRoute: arg,
                ));
      case xRouteALlLiga:
        var arg = settings.arguments as dynamic;
        return MaterialPageRoute(
            builder: (_) => AllLigaPage(
                  modelRoute: arg,
                ));
      case xRouteALlMatch:
        var arg = settings.arguments as dynamic;
        return MaterialPageRoute(
            builder: (_) => AllMatchPage(
                  modelRoute: arg,
                ));
      case xRoutePlay:
        var arg = settings.arguments as dynamic;
        return MaterialPageRoute(
            builder: (_) => PlayPage(
                  modelRoute: arg,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const BlankPage());
    }
  }
}
