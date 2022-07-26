import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:template_spam_playtore/constants/colors_style.dart';
import 'package:template_spam_playtore/controllers/admob_controller.dart';
import 'package:template_spam_playtore/controllers/fan_controller.dart';
import 'package:template_spam_playtore/routes/route.dart';
import 'package:template_spam_playtore/views/pages/validation_page/validation_page.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  AdmobController.initAdmob;
  FanController.initFan;
  //  OneSignal.shared.setAppId("5d8423d8-d747-453b-815a-3a96c79cca3b");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ValidationPage(),
      title: 'TITTLE APP',
      color: tspColorPrime,
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerate.generateRoute(settings),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
