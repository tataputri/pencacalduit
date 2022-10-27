 
import 'package:applovin_max/applovin_max.dart';
import 'package:firemax_football/models/detail.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart'; 

import '../../../bloc/validation/validation_bloc.dart';
import '../../../constants/constant.dart';

class EmbedPLayer extends StatefulWidget {
  const EmbedPLayer({super.key, required this.modelDetail});
  final ModelDetail modelDetail;

  @override
  State<EmbedPLayer> createState() => _EmbedPLayerState();
}

class _EmbedPLayerState extends State<EmbedPLayer> {
  @override
  void initState() {
    super.initState();
  }

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
        title: Text(widget.modelDetail.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(widget.modelDetail.url!),
                ),
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: false,
                      mediaPlaybackRequiresUserGesture: false,
                    ),
                    android: AndroidInAppWebViewOptions(
                      useHybridComposition: true,
                    ),
                    ios: IOSInAppWebViewOptions(
                      allowsInlineMediaPlayback: true,
                    )),
              ),
            ),
            BlocBuilder<ValidationBloc, ValidationState>(
              builder: (context, state) {
                if (state is ValidationLoaded) {
                  if (state.modelValidation.ad!.adActive == "applovin" &&
                      state.modelValidation.ad!.applovin!.mrec!.status! ==
                          true) {
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
      ),
    );
  }
}
