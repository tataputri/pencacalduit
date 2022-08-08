import 'package:flutter/material.dart';
import 'package:template_spam_playtore/services/fan_service.dart';

class CostumNativeFan extends StatelessWidget {
  final String? placementId;
  final double height;
  const CostumNativeFan({Key? key, this.placementId, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FanService.fanNative(height: 60 , placementId: placementId );
  }
}
