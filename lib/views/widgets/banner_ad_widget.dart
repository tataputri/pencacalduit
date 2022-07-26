import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:template_spam_playtore/controllers/admob_controller.dart';

class CostumBannerAdmob extends StatelessWidget {
  final String unitId;
  final AdSize adSize;

  const CostumBannerAdmob({Key? key, required this.unitId, required this.adSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AdWidget(
        ad: AdmobController.bannerAd(
            unitId: unitId,
            adSize: adSize),
      ),
    );
  }
}
