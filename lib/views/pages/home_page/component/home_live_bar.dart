import 'package:firemax_football/bloc/home/home_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/card_glass_effect.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget homeLiveBar(BuildContext context) {
  return Container(
    margin: xSpaceSymetric(vertical: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelLiveBar(),
        contentLiveBar(context),
      ],
    ),
  );
}

Widget labelLiveBar() => Padding(
      padding: xSpaceSymetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "VIVER",
            style: xFontH1,
          ),
          BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, state) {
              if (state is ValidationLoaded) {
                return InkWell(
                  onTap: () => GoRoute.push(
                      context: context,
                      routeName: xRouteALlLive,
                      modelValidation: state.modelValidation),
                  child: Text(
                    "Ver Tudo",
                    style: xFontSmall,
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );

Widget contentLiveBar(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeWaiting) {
          return SizedBox(
            height: xHeight(context) * 0.25,
            child: CustomCardGlassEffect(
              width: xWidth(context),
              child: const Center(
                child: CustomLoading(
                  height: 30,
                  width: 30,
                  color: xColorSubMain,
                ),
              ),
            ),
          );
        }
        if (state is HomeLoaded) {
          if (state.dataLive!.isEmpty) {
            return SizedBox(
                height: xHeight(context) * 0.25,
                child: CustomCardGlassEffect(
                  width: xWidth(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.broadcast_on_personal,
                        color: xColorSubMain,
                        size: 30,
                      ),
                      Text(
                        "Sorry, no matches at the moment",
                        style: xFontP,
                      ),
                    ],
                  ),
                ));
          } else {
            return SizedBox(
              height: xHeight(context) * 0.25,
              child: ListView.builder(
                itemCount: state.dataLive!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var data = state.dataLive![index];
                  return BlocBuilder<ValidationBloc, ValidationState>(
                    builder: (context, stateVal) {
                    if(stateVal is ValidationLoaded){
                      return InkWell(
                        onTap: () => GoRoute.push(
                          context: context,
                          routeName: xRoutePlay,
                          modelValidation: stateVal.modelValidation,
                          data: data,
                        ),
                        child: CustomCardGlassEffect(
                            width: state.dataLive!.length == 1
                                ? xWidth(context) * 0.96
                                : xWidth(context) * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        data.leagueName!,
                                        style: xFontSmall,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 10,
                                      height: 10,
                                      margin: xSpaceOnly(right: 5),
                                      decoration: const BoxDecoration(
                                          color: xColorAction,
                                          shape: BoxShape.circle),
                                    ),
                                    Text(
                                      data.isLive!,
                                      style: xFontSmall,
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipOval(
                                      child: CustomCacheImg(
                                        url: data.homeLogo!,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      data.home!,
                                      style: xFontP,
                                    ),
                                    const Spacer(),
                                    Text(
                                      data.homeScore.toString(),
                                      style: xFontH2,
                                    ),
                                  ],
                                ),
                                const Spacer(flex: 1),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "VS",
                                    style: xFontH2,
                                  ),
                                ),
                                const Spacer(flex: 1),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipOval(
                                      child: CustomCacheImg(
                                        url: data.awayLogo!,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      data.away!,
                                      style: xFontP,
                                    ),
                                    const Spacer(),
                                    Text(
                                      data.awayScore.toString(),
                                      style: xFontH2,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
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
        }
        return Container();
      },
    );
