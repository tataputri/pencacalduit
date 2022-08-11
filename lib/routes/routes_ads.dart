import 'package:firemax_football/models/model_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:firemax_football/services/admob_service.dart';
import 'package:firemax_football/services/fan_service.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/models/model_validation.dart';

class GoRoute {
  static int initialClick = 0;

  static push({
    required BuildContext context,
    required String routeName,
    required ModelValidation modelValidation,
    int? index,
    String? data1,
    DataBola? data,
  }) {
    initialClick++;
    if (initialClick % modelValidation.ads!.interval! == 0) {
      switch (modelValidation.ads!.activeAds) {
        case "fan":
          return FanService.fanInterstitial(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            placementId: modelValidation.ads!.fan!.fanInterstitialId,
            modelValidation: modelValidation,
            index: index,
            data1: data1,
            data: data,
          );
        case "admob":
          return AdmobService.interstitialAd(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            unitIdInt: modelValidation.ads!.admob!.admobInterstitialId!,
            modelValidation: modelValidation,
            index: index,
            data1: data1,
            data: data
          );
        default:
      }
    } else {
      Navigator.pushNamed(context, routeName,
          arguments: ModelRoute(
              modelValidation: modelValidation,
              index: index,
              data1: data1,
              data: data));
    }
  }

  static pushReplace({
    required BuildContext context,
    required String routeName,
    required ModelValidation modelValidation,
  }) {
    initialClick++;
    if (initialClick % modelValidation.ads!.interval! == 0) {
      switch (modelValidation.ads!.activeAds) {
        case "fan":
          return FanService.fanInterstitial(
              context: context,
              typePush: 'pushreplace',
              nameRoutem: routeName,
              placementId: modelValidation.ads!.fan!.fanInterstitialId,
              modelValidation: modelValidation);
        case "admob":
          return AdmobService.interstitialAd(
              context: context,
              typePush: 'pushreplace',
              nameRoutem: routeName,
              unitIdInt: modelValidation.ads!.admob!.admobInterstitialId!,
              modelValidation: modelValidation);
        default:
      }
    } else {
      Navigator.pushReplacementNamed(context, routeName,
          arguments: ModelRoute(modelValidation: modelValidation));
    }
  }

  static back({
    required BuildContext context,
    required ModelValidation modelValidation,
  }) {
    initialClick++;
    if (initialClick % modelValidation.ads!.interval! == 0) {
      switch (modelValidation.ads!.activeAds) {
        case "fan":
          return FanService.fanInterstitial(
              context: context,
              typePush: 'back',
              placementId: modelValidation.ads!.fan!.fanInterstitialId,
              modelValidation: modelValidation);
        case "admob":
          return AdmobService.interstitialAd(
              context: context,
              unitIdInt: modelValidation.ads!.admob!.admobInterstitialId!,
              typePush: 'back',
              modelValidation: modelValidation);
        default:
      }
    } else {
      Navigator.pop(context);
    }
  }
}
