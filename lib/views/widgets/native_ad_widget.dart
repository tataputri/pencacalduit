import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CostumNativeAdmob extends StatefulWidget {
  final String unitId;
  final double height;
  const CostumNativeAdmob({Key? key, required this.unitId, required this.height}) : super(key: key);

  @override
  State<CostumNativeAdmob> createState() => CostumNativeAdmobState();
}

class CostumNativeAdmobState extends State<CostumNativeAdmob> {
  NativeAd? nativeAd;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    showNativeAd(widget.unitId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: isLoaded ? AdWidget(ad: nativeAd!) : Container(),
    );
  }

  showNativeAd(String unitIdNative) {
    nativeAd = NativeAd(
      adUnitId: unitIdNative,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            nativeAd = ad as NativeAd;
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    nativeAd!.load();
  }
}
