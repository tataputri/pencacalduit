import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdmobCustom extends StatefulWidget {
  final String unitId;
    const NativeAdmobCustom({Key? key, required this.unitId}) : super(key: key);

  @override
  State<NativeAdmobCustom> createState() => NativeAdmobCustomState();
}

class NativeAdmobCustomState extends State<NativeAdmobCustom> {
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
      height: 70,
      child:isLoaded ? AdWidget(ad: nativeAd!) : Container(),
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
