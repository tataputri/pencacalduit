import 'package:flutter/material.dart';
import 'package:template_spam_playtore/routes/route_constant.dart';
import 'package:template_spam_playtore/views/pages/blank_page/blank_page.dart';
import 'package:template_spam_playtore/views/pages/home_page/home_page.dart';
import 'package:template_spam_playtore/views/pages/validation_page/validation_page.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case xRouteVaValidation:
        return MaterialPageRoute(builder: (_) => const ValidationPage());
      case xRouteHome:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case xRouteDetail:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const BlankPage());
    }
  }
}
