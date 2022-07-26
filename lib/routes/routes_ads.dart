import 'package:flutter/cupertino.dart';
import 'package:template_spam_playtore/controllers/admob_controller.dart';
import 'package:template_spam_playtore/controllers/fan_controller.dart';

class GoRoute {
  static int initialClick = 0;

  static push({
    required BuildContext context,
    required String routeName,
    required int intervalClick,
    required String typeAds,
    String? unitId,
    String? placementId,
  }) {
    initialClick++;
    if (initialClick % intervalClick == 0) {
      switch (typeAds) {
        case "fan":
          return FanController.fanInterstitial(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            placementId: placementId,
          );
        case "admob":
          return AdmobController.interstitialAd(
            context: context,
            typePush: 'push',
            nameRoutem: routeName,
            unitIdInt: unitId!,
          );
        default:
      }
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  static pushReplace({
    required BuildContext context,
    required String routeName,
    required int intervalClick,
    required String typeAds,
    String? unitId,
    String? placementId,
  }) {
    initialClick++;
    if (initialClick % intervalClick == 0) {
      switch (typeAds) {
        case "fan":
          return FanController.fanInterstitial(
            context: context,
            typePush: 'pushreplace',
            nameRoutem: routeName,
            placementId: placementId,
          );
        case "admob":
          return AdmobController.interstitialAd(
            context: context,
            typePush: 'pushreplace',
            nameRoutem: routeName,
            unitIdInt: unitId!,
          );
        default:
      }
    } else {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  static back({
    required BuildContext context,
    required int intervalClick,
    required String typeAds,
    String? unitId,
    String? placementId,
  }) {
    initialClick++;
    if (initialClick % intervalClick == 0) {
      switch (typeAds) {
        case "fan":
          return FanController.fanInterstitial(
            context: context,
            typePush: 'back',
          );
        case "admob":
          return AdmobController.interstitialAd(
              context: context, unitIdInt: unitId, typePush: 'back');
        default:
      }
    } else {
      Navigator.pop(context);
    }
  }
}
