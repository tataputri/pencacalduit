import 'package:applovin_max/applovin_max.dart';
import 'package:audience_network/audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/views/widgets/banner_ad_widget.dart';
import 'package:firemax_football/views/widgets/banner_fan_widget.dart';

class CostumShowBannerAdsSemua extends StatelessWidget {
  final bool? isKotak;
  const CostumShowBannerAdsSemua({Key? key, this.isKotak = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: xWidth(context),
      color: Colors.transparent,
      child: BlocBuilder<ValidationBloc, ValidationState>(
        builder: (context, state) {
          if (state is ValidationLoaded) {
            switch (state.modelValidation.ad!.adActive!) {
              case 'admob':
                return SizedBox(
                  height: isKotak! ? 300 : 70,
                  child: CostumBannerAdmob(
                    unitId: state.modelValidation.ad!.admob!.banner!.adUnit!,
                    adSize:
                        isKotak! ? AdSize.mediumRectangle : AdSize.fullBanner,
                  ),
                );
              case 'fan':
                return SizedBox(
                  height: isKotak! ? 300 : 70,
                  child: CostumBannerFan(
                    placementId: state.modelValidation.ad!.fan!.banner!.adUnit!,
                    bannerSize: isKotak!
                        ? BannerSize.MEDIUM_RECTANGLE
                        : BannerSize.STANDARD,
                  ),
                );
              case 'applovin':
                return MaxAdView(
                    adUnitId:
                        state.modelValidation.ad!.applovin!.banner!.adUnit!,
                    adFormat: AdFormat.banner,
                    listener: AdViewAdListener(
                        onAdLoadedCallback: (ad) {},
                        onAdLoadFailedCallback: (adUnitId, error) {},
                        onAdClickedCallback: (ad) {},
                        onAdExpandedCallback: (ad) {},
                        onAdCollapsedCallback: (ad) {}));
              default:
            }
          }
          return Container();
        },
      ),
    );
  }
}
