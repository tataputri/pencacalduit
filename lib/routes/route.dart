import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/views/pages/all_live_page/all_live_page.dart';
import 'package:firemax_football/views/pages/all_match_page/all_match_page.dart';
import 'package:firemax_football/views/pages/alternative/alternative_page.dart';
import 'package:firemax_football/views/pages/blokir/blokir_page.dart';
import 'package:firemax_football/views/pages/dashboard/dashboard.dart';
import 'package:firemax_football/views/pages/liga/details/detail_liga.dart';
import 'package:firemax_football/views/pages/detail_page/detail_page.dart';
import 'package:firemax_football/views/pages/player/exo_player.dart';
import 'package:firemax_football/views/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:firemax_football/views/pages/blank_page/blank_page.dart';
import 'package:firemax_football/views/pages/validation_page/validation_page.dart';

import '../views/pages/player/embed_player.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constant.xScreenRoot:
        return MaterialPageRoute(builder: (_) => const ValidationPage());
      case Constant.xScreenAlternative:
        return MaterialPageRoute(builder: (_) => const AlternativePage());
      case Constant.xScreenBlokir:
        return MaterialPageRoute(builder: (_) => const BlokirPage());
      case Constant.xScreenDash:
        var arg = settings.arguments as ModelRoute;
        return MaterialPageRoute(
            builder: (_) => Dashboard(
                  modelValidation: arg.modelValidation,
                ));
      case Constant.xScreenSearch:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case Constant.xScreenDetailLiga:
        var arg = settings.arguments as ModelRoute;
        return MaterialPageRoute(
            builder: (_) => DetailLiga(match: arg.listMatch!));
      case Constant.xScreenALlLive:
        var arg = settings.arguments as ModelRoute;
        return MaterialPageRoute(
            builder: (_) => AllLivePage(
                  items: arg.listMatch,
                ));
      // case Constant.xScreenALlLiga:
      //   var arg = settings.arguments as dynamic;
      //   return MaterialPageRoute(
      //       builder: (_) => AllLigaPage(
      //             modelRoute: arg,
      //           ));
      case Constant.xScreenALlMatch:
        var arg = settings.arguments as dynamic;
        return MaterialPageRoute(
            builder: (_) => AllMatchPage(
                  modelRoute: arg,
                ));
      case Constant.xScreenDetail:
        var arg = settings.arguments as ModelRoute;
        return MaterialPageRoute(
            builder: (_) => DetailPage(modelMatch: arg.modelMatch));
      case Constant.xScreenExoPlayer:
        var arg = settings.arguments as ModelRoute;
        return MaterialPageRoute(
            builder: (_) => ExoPlayer(modelDetail: arg.modelDetail!));
      case Constant.xScreenEmbedPLayer:
        var arg = settings.arguments as ModelRoute;
        return MaterialPageRoute(
            builder: (_) => EmbedPLayer(modelDetail: arg.modelDetail!));
      default:
        return MaterialPageRoute(builder: (_) => const BlankPage());
    }
  }
}
