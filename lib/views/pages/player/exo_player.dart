import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/validation/validation_bloc.dart';
import '../../../constants/constant.dart';
import '../../../models/detail.dart';
import '../../../routes/routes_ads.dart';
import '../detail_page/component/frame_play.dart';

class ExoPlayer extends StatelessWidget {
  const ExoPlayer({super.key, required this.modelDetail});
  final ModelDetail modelDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BlocBuilder<ValidationBloc, ValidationState>(
          builder: (context, state) {
            if (state is ValidationLoaded) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => GoRoute.back(
                    context: context, modelValidation: state.modelValidation),
              );
            }
            return Container();
          },
        ),
        title: Text(modelDetail.title!),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: Constant.xSizeWidth(context),
            margin: Constant.xSpaceSymetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Constant.xColorDarkSub,
              borderRadius: BorderRadius.circular(Constant.xDefaultSize),
            ),
            child: FramePlay(
              urlVideo: modelDetail.url,
            ),
          ),
          BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, state) {
              if (state is ValidationLoaded) {
                if (state.modelValidation.ad!.adActive == "applovin" &&
                    state.modelValidation.ad!.applovin!.mrec!.status! == true) {
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
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
