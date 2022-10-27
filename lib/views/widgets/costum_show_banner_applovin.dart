// ignore_for_file: avoid_print

import 'package:applovin_max/applovin_max.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CostumShowBannerApplovin extends StatelessWidget {
  const CostumShowBannerApplovin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        if (state is ValidationLoaded) {
          if (state.modelValidation.ad!.adActive == "applovin" &&
              state.modelValidation.ad!.applovin!.banner!.status == true) {
            return Container(
              height: 70,
              width: Constant.xSizeWidth(context),
              padding: Constant.xSpaceSymetric(horizontal: 8, vertical: 10),
              margin: Constant.xSpaceSymetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Constant.xColorLight,
                borderRadius: BorderRadius.circular(Constant.xDefaultSize),
              ),
              child: MaxAdView(
                adUnitId: state.modelValidation.ad!.applovin!.banner!.adUnit!,
                adFormat: AdFormat.banner,
                listener: AdViewAdListener(
                  onAdLoadedCallback: (ad) {
                    print("AppLovin Loaded $ad");
                  },
                  onAdLoadFailedCallback: (adUnitId, error) {
                    print("AppLovin faile  + ");
                  },
                  onAdClickedCallback: (ad) {
                    print("AppLovin click ");
                  },
                  onAdExpandedCallback: (ad) {
                    print("AppLovin expanded ");
                  },
                  onAdCollapsedCallback: (ad) {
                    print("AppLovin collapsed ");
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        }
        return Container();
      },
    );
  }
}
