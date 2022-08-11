import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/pages/play_page/component/back_play.dart'; 
import 'package:firemax_football/views/pages/play_page/component/frame_play.dart';
import 'package:firemax_football/views/widgets/banner_ad_widget.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PlayPage extends StatefulWidget {
  final ModelRoute? modelRoute;
  const PlayPage({Key? key, this.modelRoute}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            BlocBuilder<ValidationBloc, ValidationState>(
              builder: (context, state) {
                if (state is ValidationLoaded) {
                  if (state.modelValidation.check == "allow") {
                    return Container(
                      height: 250,
                      width: xWidth(context),
                      color: xColorSubVariant,
                      child: widget.modelRoute!.data!.link!.server1!.link !=
                              null
                          ? Stack(
                              children: [
                                FramePlay(
                                    urlVideo: widget
                                        .modelRoute!.data!.link!.server1!.link),
                                backPlay(context, xColorPrimary)
                              ],
                            )
                          : Stack(
                            children: [
                              Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Transmissão não disponível agora !",
                                        style: xFontP,
                                      ),
                                      Text(
                                        "Veja o calendário de partidas...",
                                        style: xFontSmall,
                                      ),
                                    ],
                                  ),
                                ),
                                 backPlay(context, xColorSubMain)
                            ],
                          ),
                    );
                  } else {
                    return Container(
                        height: 50,
                        width: xWidth(context),
                        color: xColorSubVariant,
                        margin: xSpaceOnly(bottom: 30),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                GoRoute.back(
                                  context: context,
                                  modelValidation: state.modelValidation,
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: xColorSubMain,
                              ),
                            ),
                            Text(
                              "Live Score",
                              style: xFontH2,
                            )
                          ],
                        ));
                  }
                }
                return Container();
              },
            ),
            Container(
              padding: xSpaceSymetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.modelRoute!.data!.leagueName!,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: xFontH1,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CustomCacheImg(
                          url: widget.modelRoute!.data!.homeLogo!,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.modelRoute!.data!.home!,
                          style: xFontH3,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        widget.modelRoute!.data!.homeScore.toString(),
                        style: xFontH2,
                      )
                    ],
                  ),
                  const Divider(
                    color: xColorVariant,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                          child: CustomCacheImg(
                        url: widget.modelRoute!.data!.awayLogo!,
                        width: 60,
                        height: 60,
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.modelRoute!.data!.away!,
                          style: xFontH3,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        widget.modelRoute!.data!.awayScore.toString(),
                        style: xFontH2,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: xWidth(context),
          height: 70,
          child: CostumBannerAdmob(
            adSize: AdSize.fullBanner,
            unitId:
                widget.modelRoute!.modelValidation!.ads!.admob!.admobBannerId!,
          ),
        ));
  }
}
