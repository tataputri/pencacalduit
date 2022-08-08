import 'package:flutter/cupertino.dart';
import 'package:template_spam_playtore/services/admob_service.dart';
import 'package:template_spam_playtore/services/fan_service.dart';
import 'package:template_spam_playtore/models/model_route.dart';
import 'package:template_spam_playtore/models/model_validation.dart';

class GoRoute {
  static int initialClick = 0;

  static push({
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
            typePush: 'push',
            nameRoutem: routeName,
            placementId: modelValidation.ads!.fan!.fanInterstitialId,

          );
        case "admob":
          return AdmobService.interstitialAd(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            unitIdInt: modelValidation.ads!.admob!.admobInterstitialId!,
          );
        default:
      }
    } else {
      Navigator.pushNamed(context, routeName,
          arguments: ModelRoute(modelValidation: modelValidation));
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
          );
        case "admob":
          return AdmobService.interstitialAd(
            context: context,
            typePush: 'pushreplace',
            nameRoutem: routeName,
            unitIdInt: modelValidation.ads!.admob!.admobInterstitialId!,
          );
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
          );
        case "admob":
          return AdmobService.interstitialAd(
            context: context,
            unitIdInt: modelValidation.ads!.admob!.admobInterstitialId!,
            typePush: 'back',
          );
        default:
      }
    } else {
      Navigator.pop(context);
    }
  }
}
