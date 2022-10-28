 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/validation/validation_bloc.dart';
import '../../../constants/constant.dart';
import '../../../models/detail.dart';
import '../../../routes/routes_ads.dart';
import '../../widgets/costum_show_kotak_banner_ads_semua.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                  return const CustomShowKotakBannerAdsSemua();
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
