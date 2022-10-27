// ignore_for_file: avoid_print

import 'package:firemax_football/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/views/widgets/native_ad_widget.dart';
import 'package:firemax_football/views/widgets/native_fan_widget.dart';

class CostumShowNativeAdsSemua extends StatelessWidget {
  const CostumShowNativeAdsSemua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: xWidth(context),
      child: Center(
        child: BlocBuilder<ValidationBloc, ValidationState>(
          builder: (context, state) {
            if (state is ValidationLoaded) {
              switch (state.modelValidation.ad!.adActive!) {
                case 'admob':
                  if (state.modelValidation.ad!.admob!.native!.status == true) {
                    return Container(
                      width: Constant.xSizeWidth(context),
                      padding:
                          Constant.xSpaceSymetric(horizontal: 10, vertical: 10),
                      margin: Constant.xSpaceSymetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constant.xColorDarkSub,
                        borderRadius:
                            BorderRadius.circular(Constant.xDefaultSize),
                      ),
                      child: CostumNativeAdmob(
                        unitId:
                            state.modelValidation.ad!.admob!.native!.adUnit!,
                        height: 70,
                      ),
                    );
                  } else {
                    return Container();
                  }
                case 'fan':
                  if (state.modelValidation.ad!.fan!.native!.status == true) {
                    return Container(
                        width: Constant.xSizeWidth(context),
                        padding: Constant.xSpaceSymetric(
                            horizontal: 8, vertical: 10),
                        margin: Constant.xSpaceSymetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Constant.xColorDarkSub,
                          borderRadius:
                              BorderRadius.circular(Constant.xDefaultSize),
                        ),
                        child: CostumNativeFan(
                          placementId:
                              state.modelValidation.ad!.fan!.native!.adUnit!,
                          height: 70,
                        ));
                  } else {
                    return Container();
                  }
                default:
                  return Container();
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
