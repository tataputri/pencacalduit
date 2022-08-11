import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/views/widgets/card_glass_effect.dart';
import 'package:firemax_football/views/widgets/native_ad_widget.dart';
import 'package:firemax_football/views/widgets/native_fan_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget homeNativeBar() {
  return Padding(
    padding: xSpaceOnly(bottom: 10),
    child: BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        if (state is ValidationLoaded) {
          if (state.modelValidation.ads!.activeAds! == "admob") {
            return CustomCardGlassEffect(
              width: xWidth(context),
              child: CostumNativeAdmob(
                unitId: state.modelValidation.ads!.admob!.admobNative!,
                height: 70,
              ),
            );
          } else {
            return CustomCardGlassEffect(
                width: xWidth(context),
                child: CostumNativeFan(
                  height: 70,
                  placementId: state.modelValidation.ads!.fan!.fanNativeId,
                ));
          }
        }
        return Container();
      },
    ),
  );
}
