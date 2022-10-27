import 'dart:io';

import 'package:applovin_max/applovin_max.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firemax_football/bloc/channel/channel_bloc.dart';
import 'package:firemax_football/bloc/date/date_bloc.dart';
import 'package:firemax_football/bloc/jadwal/jadwal_bloc.dart';
import 'package:firemax_football/bloc/live/live_bloc.dart';
import 'package:firemax_football/bloc/score/score_bloc.dart';
import 'package:firemax_football/bloc/search/search_bloc.dart';
import 'package:firemax_football/bloc/today/today_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/app_theme.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firemax_football/constants/colors_style.dart';
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
  await AppLovinMAX.initialize(
      "exEMohPo0fCzgZa-ZZHXUpyhz4OSztd5EonoyRahwwB_CF255nlBtb5wyad0o3-ebFq2cNbuIR3EkkHymNvF0Q");
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
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => LiveBloc(),
        ),
        BlocProvider(
          create: (context) => TodayBloc(),
        ),
        BlocProvider(
          create: (context) => DateBloc(),
        ),
        BlocProvider(
          create: (context) => JadwalBloc(),
        ),
        BlocProvider(
          create: (context) => ScoreBloc(),
        ),
        BlocProvider(
          create: (context) => ChannelBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firemax',
        color: xColorVariant,
        initialRoute: Constant.xScreenRoot,
        onGenerateRoute: (settings) => RouteGenerate.generateRoute(settings),
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
