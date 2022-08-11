import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firemax_football/bloc/bloc/liga_bloc.dart';
import 'package:firemax_football/bloc/home/home_bloc.dart';
import 'package:firemax_football/bloc/search/search_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/services/admob_service.dart';
import 'package:firemax_football/services/fan_service.dart';
import 'package:firemax_football/routes/route.dart';
import 'package:firemax_football/services/http_override_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  AdmobService.initAdmob;
  FanService.initFan;
  OneSignal.shared.setAppId("6b93d828-bc30-477b-a7c6-400bfab314e7");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ValidationBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => LigaBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firemax',
        color: xColorVariant,
        initialRoute: xRouteVaValidation,
        onGenerateRoute: (settings) => RouteGenerate.generateRoute(settings),
      ),
    );
  }
}
