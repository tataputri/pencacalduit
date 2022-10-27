// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:math';

import 'package:applovin_max/applovin_max.dart';
import 'package:firemax_football/models/detail.dart';
import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/models/model_home.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/models/today.dart';
import 'package:flutter/material.dart';

class LovinService {
  LovinService._();

  static double _interstitialRetryAttempt = 0;

  static _initializeBannerAds(unitId) {
    AppLovinMAX.createBanner(unitId, AdViewPosition.bottomCenter);
  }

  static showBannerLovin(unitId) {
    _initializeBannerAds(unitId);
    AppLovinMAX.showBanner(unitId);
  }

  static void initializeInterstitialAds({
    required BuildContext context,
    required String typePush,
    required String unitIdInt,
    String? nameRoutem,
    DataBola? data,
    int? index,
    String? data1,
    ModelValidation? modelValidation,
    List<ModelMatch>? listMatch,
    ModelMatch? modelMatch,
    ModelToday? modelToday,
    ModelDetail? modelDetail,
  }) {
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        print('Interstitial ad loaded from ' + ad.networkName);
        AppLovinMAX.showInterstitial(unitIdInt);
        print('Interstitial ad sudah di show kan from ' + ad.adUnitId);
        _interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        _interstitialRetryAttempt = _interstitialRetryAttempt + 1;

        int retryDelay = pow(2, min(6, _interstitialRetryAttempt)).toInt();

        print('Interstitial ad failed to load with code ' +
            error.code.toString() +
            ' - retrying in ' +
            retryDelay.toString() +
            's');
        switch (typePush) {
          case 'push':
            Navigator.pushNamed(context, nameRoutem!,
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
            break;
          case 'back':
            Navigator.pop(context);
            break;
          case 'pushreplace':
            Navigator.pushReplacementNamed(context, nameRoutem!,
                arguments: ModelRoute(modelValidation: modelValidation));
            break;
          default:
        }
        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial(unitIdInt);
        });
      },
      onAdDisplayedCallback: (ad) {
        print('Interstitial ad display from ' + ad.adUnitId);
        switch (typePush) {
          case 'push':
            Navigator.pushNamed(context, nameRoutem!,
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
            break;
          case 'back':
            Navigator.pop(context);
            break;
          case 'pushreplace':
            Navigator.pushReplacementNamed(context, nameRoutem!,
                arguments: ModelRoute(modelValidation: modelValidation));
            break;
          default:
        }
      },
      onAdDisplayFailedCallback: (ad, error) {},
      onAdClickedCallback: (ad) {},
      onAdHiddenCallback: (ad) {},
    ));

    AppLovinMAX.loadInterstitial(unitIdInt);
  }

  static Future<void> intLovinLoad({
    required BuildContext context,
    required String typePush,
    required String unitIdInt,
    String? nameRoutem,
    DataBola? data,
    int? index,
    String? data1,
    ModelValidation? modelValidation,
    List<ModelMatch>? listMatch,
    ModelMatch? modelMatch,
    ModelToday? modelToday,
    ModelDetail? modelDetail,
  }) async {
    initializeInterstitialAds(
      context: context,
      typePush: typePush,
      unitIdInt: unitIdInt,
      nameRoutem: nameRoutem,
      data: data,
      modelValidation: modelValidation,
      listMatch: listMatch,
      modelMatch: modelMatch,
      modelToday: modelToday,
      modelDetail: modelDetail,
    );
  }
}
