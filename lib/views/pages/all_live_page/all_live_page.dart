import 'package:firemax_football/bloc/home/home_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/pages/search_page/component/search_clip_background.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/card_glass_effect.dart';
import 'package:firemax_football/views/widgets/native_ad_widget.dart';
import 'package:firemax_football/views/widgets/native_fan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllLivePage extends StatelessWidget {
  final ModelRoute? modelRoute;
  const AllLivePage({Key? key, this.modelRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: xColorVariant,
          titleSpacing: 0,
          leading: InkWell(
              onTap: () {
                GoRoute.back(
                    context: context,
                    modelValidation: modelRoute!.modelValidation!);
              },
              child:
                  const Icon(Icons.arrow_back_rounded, color: xColorSubMain)),
          title: Text("Todos ao vivo", style: xFontH1)),
      body: Stack(
        children: [
          searchClipBg(context),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return Container(
                  margin: xSpaceOnly(bottom: 10),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      if (index % 3 == 0) {
                        return Padding(
                          padding: xSpaceOnly(bottom: 10),
                          child: BlocBuilder<ValidationBloc, ValidationState>(
                            builder: (context, stateVal) {
                              if (stateVal is ValidationLoaded) {
                                if (stateVal.modelValidation.ads!.activeAds! ==
                                    "admob") {
                                  return CustomCardGlassEffect(
                                    width: xWidth(context),
                                    child: CostumNativeAdmob(
                                      unitId: stateVal.modelValidation.ads!
                                          .admob!.admobNative!,
                                      height: 70,
                                    ),
                                  );
                                } else {
                                  return CustomCardGlassEffect(
                                      width: xWidth(context),
                                      child: CostumNativeFan(
                                        height: 70,
                                        placementId: stateVal.modelValidation
                                            .ads!.fan!.fanNativeId,
                                      ));
                                }
                              }
                              return Container();
                            },
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.dataLive!.length <= 5
                        ? state.dataLive!.length
                        : 5,
                    itemBuilder: (BuildContext context, int index) {
                      var data = state.dataLive![index];
                      return BlocBuilder<ValidationBloc, ValidationState>(
                        builder: (context, stateVal) {
                          if (stateVal is ValidationLoaded) {
                            return InkWell(
                              onTap: () => GoRoute.push(
                                context: context,
                                routeName: xRoutePlay,
                                modelValidation: stateVal.modelValidation,
                                data: data,
                              ),
                              child: CustomCardGlassEffect(
                                child: Container(
                                    padding: xSpaceSymetric(horizontal: 0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            data.leagueName!,
                                            style: xFontSmall,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                    child: CustomCacheImg(
                                                      url: data.homeLogo!,
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    data.home!,
                                                    style: xFontP,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(data.homeScore.toString(),
                                                style: xFontH1),
                                            Padding(
                                              padding:
                                                  xSpaceSymetric(horizontal: 5),
                                              child: Text(
                                                "VS",
                                                style: xFontSmall,
                                              ),
                                            ),
                                            Text(data.awayScore.toString(),
                                                style: xFontH1),
                                            const Spacer(),
                                            Expanded(
                                              flex: 5,
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                    child: CustomCacheImg(
                                                      url: data.awayLogo!,
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    data.away!,
                                                    style: xFontP,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        data.isLive == "online"
                                            ? Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    margin:
                                                        xSpaceOnly(right: 5),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: xColorAction,
                                                            shape: BoxShape
                                                                .circle),
                                                  ),
                                                  Text(
                                                    data.isLive!,
                                                    style: xFontSmall,
                                                  )
                                                ],
                                              )
                                            : Align(
                                                alignment: Alignment.center,
                                                child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Hora da partida : ",
                                                      style: xFontSmall,
                                                    ),
                                                    TextSpan(
                                                      text: data.matchTime,
                                                      style: xFontSmall,
                                                    ),
                                                  ]),
                                                ),
                                              )
                                      ],
                                    )),
                              ),
                            );
                          }
                          return Container();
                        },
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
