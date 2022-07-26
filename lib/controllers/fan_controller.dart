import 'package:audience_network/audience_network.dart';
import 'package:flutter/material.dart';

class FanController {
  static void get initFan {
    AudienceNetwork.init(testingId: '7ef5b822-bcb8-4b12-bb8d-23031a3f3e45');
  }

  static NativeAd fanNative({String? placementId, required double height}) {
    return NativeAd(
      placementId: placementId ?? NativeAd.testPlacementId,
      adType: NativeAdType.NATIVE_BANNER_AD,
      width: double.infinity,
      height: height,
      backgroundColor: Colors.white,
      titleColor: Colors.black87,
      descriptionColor: Colors.black54,
      buttonColor: Colors.indigoAccent,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      keepAlive:
          true, //set true if you do not want adview to refresh on widget rebuild
      keepExpandedWhileLoading:
          false, // set false if you want to collapse the native ad view when the ad is loading
      expandAnimationDuraion:
          300, //in milliseconds. Expands the adview with animation when ad is loaded
      listener: NativeAdListener(
        onError: (code, message) => print(message),
        onLoaded: () => print('loaded'),
        onClicked: () => print('clicked'),
        onLoggingImpression: () => print('logging impression'),
        onMediaDownloaded: () => print('media downloaded'),
      ),
    );
  }

  static InterstitialAd fanInterstitial({
    required BuildContext context,
    String? nameRoutem,
    String? placementId,
    required String typePush,
  }) {
    final interstitialAd =
        InterstitialAd(placementId ?? InterstitialAd.testPlacementId);
    interstitialAd.listener = InterstitialAdListener(
      onLoaded: () {
        interstitialAd.show();
      },
      onDismissed: () {
        interstitialAd.destroy();
      },
      onDisplayed: () {
        switch (typePush) {
          case 'push':
            Navigator.pushNamed(context, nameRoutem!);
            break;
          case 'back':
            Navigator.pop(context);
            break;
          case 'pushreplace':
            Navigator.pushReplacementNamed(context, nameRoutem!);
            break;
          default:
        }
      },
    );
    interstitialAd.load();
    return interstitialAd;
  }

  static BannerAd fanBanner({String? placementId, BannerSize? bannerSize}) {
    return BannerAd(
      placementId: placementId ?? BannerAd.testPlacementId,
      bannerSize: bannerSize ?? BannerSize.STANDARD,
      listener: BannerAdListener(
        onError: (code, message) => print('error'),
        onLoaded: () => print('loaded'),
        onClicked: () => print('clicked'),
        onLoggingImpression: () => print('logging impression'),
      ),
    );
  }
}
