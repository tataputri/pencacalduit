import 'package:audience_network/ad/banner_ad.dart';
import 'package:flutter/material.dart';
import 'package:template_spam_playtore/controllers/fan_controller.dart';

class CostumBannerFan extends StatelessWidget {
  final BannerSize? bannerSize;
  final String? placementId;
  const CostumBannerFan({Key? key, this.bannerSize,  this.placementId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FanController.fanBanner();
  }
}
