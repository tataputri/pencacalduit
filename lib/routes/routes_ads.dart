import 'package:firemax_football/models/detail.dart';
import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/models/model_home.dart';
import 'package:firemax_football/models/today.dart';
import 'package:firemax_football/services/applovin_service.dart';
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
    List<ModelMatch>? listMatch,
    ModelMatch? modelMatch,
    ModelToday? modelToday,
    ModelDetail? modelDetail,
  }) {
    initialClick++;
    if (initialClick % modelValidation.ad!.adInterval! == 0) {
      switch (modelValidation.ad!.adActive) {
        case "fan":
          return FanService.fanInterstitial(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            placementId: modelValidation.ad!.fan!.interstitial!.adUnit!,
            modelValidation: modelValidation,
            index: index,
            data1: data1,
            data: data,
            listMatch: listMatch,
            modelMatch: modelMatch,
            modelToday: modelToday,
            modelDetail: modelDetail,
          );
        case "admob":
          return AdmobService.interstitialAd(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            unitIdInt: modelValidation.ad!.admob!.interstitial!.adUnit!,
            modelValidation: modelValidation,
            index: index,
            data1: data1,
            data: data,
            listMatch: listMatch,
            modelMatch: modelMatch,
            modelToday: modelToday,
            modelDetail: modelDetail,
          );
        case "applovin":
          return LovinService.intLovinLoad(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            unitIdInt: modelValidation.ad!.applovin!.interstitial!.adUnit!,
            modelValidation: modelValidation,
            index: index,
            data1: data1,
            data: data,
            listMatch: listMatch,
            modelMatch: modelMatch,
            modelToday: modelToday,
            modelDetail: modelDetail,
          );
        default:
      }
    } else {
      Navigator.pushNamed(context, routeName,
          arguments: ModelRoute(
            modelValidation: modelValidation,
            index: index,
            data1: data1,
            data: data,
            listMatch: listMatch,
            modelMatch: modelMatch,
            modelToday: modelToday,
            modelDetail: modelDetail,
          ));
    }
  }

  static pushReplace({
    required BuildContext context,
    required String routeName,
    required ModelValidation modelValidation,
  }) {
    initialClick++;
    if (modelValidation.ad!.adActive == "applovin") {
      return LovinService.intLovinLoad(
        context: context,
        typePush: 'pushreplace',
        nameRoutem: routeName,
        unitIdInt: modelValidation.ad!.applovin!.interstitial!.adUnit!,
        modelValidation: modelValidation,
      );
    } else {
      if (initialClick % modelValidation.ad!.adInterval! == 0) {
        switch (modelValidation.ad!.adActive) {
          case "fan":
            return FanService.fanInterstitial(
                context: context,
                typePush: 'pushreplace',
                nameRoutem: routeName,
                placementId: modelValidation.ad!.fan!.interstitial!.adUnit!,
                modelValidation: modelValidation);
          case "admob":
            return AdmobService.interstitialAd(
                context: context,
                typePush: 'pushreplace',
                nameRoutem: routeName,
                unitIdInt: modelValidation.ad!.admob!.interstitial!.adUnit!,
                modelValidation: modelValidation);
          default:
        }
      } else {
        Navigator.pushReplacementNamed(context, routeName,
            arguments: ModelRoute(modelValidation: modelValidation));
      }
    }
  }

  static back({
    required BuildContext context,
    required ModelValidation modelValidation,
  }) {
    initialClick++;
    if (initialClick % modelValidation.ad!.adInterval! == 0) {
      switch (modelValidation.ad!.adActive) {
        case "fan":
          return FanService.fanInterstitial(
              context: context,
              typePush: 'back',
              placementId: modelValidation.ad!.fan!.interstitial!.adUnit!,
              modelValidation: modelValidation);
        case "admob":
          return AdmobService.interstitialAd(
              context: context,
              unitIdInt: modelValidation.ad!.admob!.interstitial!.adUnit!,
              typePush: 'back',
              modelValidation: modelValidation);
        case "applovin":
          return LovinService.intLovinLoad(
            context: context,
            typePush: 'back',
            unitIdInt: modelValidation.ad!.applovin!.interstitial!.adUnit!,
          );
        default:
      }
    } else {
      Navigator.pop(context);
    }
  }
}
