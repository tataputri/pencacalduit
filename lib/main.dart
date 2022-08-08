import 'dart:io';

import 'package:flutter/material.dart'; 
import 'package:template_spam_playtore/constants/colors_style.dart';
import 'package:template_spam_playtore/routes/route_constant.dart';
import 'package:template_spam_playtore/services/admob_service.dart';
import 'package:template_spam_playtore/services/fan_service.dart';
import 'package:template_spam_playtore/routes/route.dart';
import 'package:template_spam_playtore/services/http_override_service.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  AdmobService.initAdmob;
  FanService.initFan;
  //  OneSignal.shared.setAppId("5d8423d8-d747-453b-815a-3a96c79cca3b");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TITTLE APP',
      color: xColorMain,
      initialRoute: xRouteVaValidation,
      onGenerateRoute: (settings) => RouteGenerate.generateRoute(settings),
    );
  }
}


