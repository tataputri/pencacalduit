import 'package:applovin_max/applovin_max.dart';
import 'package:audience_network/audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/views/widgets/banner_ad_widget.dart';
import 'package:firemax_football/views/widgets/banner_fan_widget.dart';

import '../../constants/constant.dart';

class CustomShowKotakBannerAdsSemua extends StatelessWidget {
  const CustomShowKotakBannerAdsSemua({Key? key}) : super(key: key);

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
                if (state.modelValidation.ad!.admob!.banner!.status! == true) {
                  return Container(
                    height: 300,
                    width: Constant.xSizeWidth(context),
                    margin: Constant.xSpaceSymetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Constant.xColorDarkSub,
                      borderRadius:
                          BorderRadius.circular(Constant.xDefaultSize),
                    ),
                    child: CostumBannerAdmob(
                      unitId: state.modelValidation.ad!.admob!.banner!.adUnit!,
                      adSize: AdSize.mediumRectangle,
                    ),
                  );
                } else {
                  return Container();
                }
              case 'fan':
                if (state.modelValidation.ad!.fan!.banner!.status! == true) {
                  return Container(
                    height: 300,
                    width: Constant.xSizeWidth(context),
                    margin: Constant.xSpaceSymetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Constant.xColorDarkSub,
                      borderRadius:
                          BorderRadius.circular(Constant.xDefaultSize),
                    ),
                    child: CostumBannerFan(
                      placementId:
                          state.modelValidation.ad!.fan!.banner!.adUnit!,
                      bannerSize: BannerSize.MEDIUM_RECTANGLE,
                    ),
                  );
                } else {
                  return Container();
                }

              case 'applovin':
                if (state.modelValidation.ad!.applovin!.mrec!.status! == true) {
                  return Container(
                    height: 250,
                    width: Constant.xSizeWidth(context),
                    margin: Constant.xSpaceSymetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Constant.xColorDarkSub,
                      borderRadius:
                          BorderRadius.circular(Constant.xDefaultSize),
                    ),
                    child: MaxAdView(
                        adUnitId:
                            state.modelValidation.ad!.applovin!.mrec!.adUnit!,
                        adFormat: AdFormat.mrec,
                        listener: AdViewAdListener(
                            onAdLoadedCallback: (ad) {},
                            onAdLoadFailedCallback: (adUnitId, error) {},
                            onAdClickedCallback: (ad) {},
                            onAdExpandedCallback: (ad) {},
                            onAdCollapsedCallback: (ad) {})),
                  );
                } else {
                  return Container();
                }
              default:
            }
          }
          return Container();
        },
      ),
    );
  }
}
