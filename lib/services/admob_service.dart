import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/models/model_home.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/models/today.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../models/detail.dart';

class AdmobService {
  static late InterstitialAd intAd;
  static late BannerAd _bannerAd;
  static bool isBannerAdReady = false;

  static void get initAdmob {
    MobileAds.instance.initialize();
  }

  static Future<void> interstitialAd({
    required BuildContext context,
    required String typePush,
    required String unitIdInt,
    ModelValidation? modelValidation,
    String? nameRoutem,
    int? index,
    String? data1,
    DataBola? data,
    List<ModelMatch>? listMatch,
    ModelMatch? modelMatch,
    ModelToday? modelToday,
    ModelDetail? modelDetail,
  }) async {
    InterstitialAd.load(
      adUnitId: unitIdInt,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) async {
          ad.show();
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdWillDismissFullScreenContent: (ad) {
            debugPrint('MUNCUL INT dismiss full screen');
          }, onAdShowedFullScreenContent: (InterstitialAd ad) {
            debugPrint('MUNCUL INT FULL SCREEN');
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
          }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
            debugPrint('MUNCUL INT MISS FULL SCREEN');
            ad.dispose();
          }, onAdFailedToShowFullScreenContent:
                  (InterstitialAd ad, AdError error) {
            debugPrint('MUNCUL INT GAGAL');
            ad.dispose();
          }, onAdImpression: (InterstitialAd ad) {
            debugPrint('MUNCUL INT IMPRESI');
          });
        },
        onAdFailedToLoad: (err) {
          debugPrint("Ad int error : $err");
        },
      ),
    );
  }

  static BannerAd bannerAd({required String unitId, required AdSize adSize}) {
    _bannerAd = BannerAd(
      adUnitId: unitId,
      request: const AdRequest(),
      size: adSize,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady = true;
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
    return _bannerAd;
  }
}
