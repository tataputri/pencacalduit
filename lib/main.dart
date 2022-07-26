import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_spam_playtore/constants/colors_style.dart';
import 'package:template_spam_playtore/routes/route.dart';
import 'package:template_spam_playtore/views/pages/validation_page/validation_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  MobileAds.instance.initialize();
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
