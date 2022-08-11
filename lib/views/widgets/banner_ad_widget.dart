import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firemax_football/services/admob_service.dart';

class CostumBannerAdmob extends StatelessWidget {
  final String unitId;
  final AdSize adSize;

  const CostumBannerAdmob({Key? key, required this.unitId, required this.adSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AdWidget(
        ad: AdmobService.bannerAd(
            unitId: unitId,
            adSize: adSize),
      ),
    );
  }
}
