import 'package:firemax_football/bloc/today/today_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget homeAllMatchBar(BuildContext context) {
  return Container(
    margin: xSpaceOnly(bottom: 80),
    child: Column(
      children: [
        labelAllMatchBar(context),
        contentAllMatchBar(),
      ],
    ),
  );
}

Widget labelAllMatchBar(BuildContext context) => Padding(
      padding: xSpaceSymetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("TODAY MATCH",
                style: Theme.of(context).textTheme.headline5),
          ),
          BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, state) {
              if (state is ValidationLoaded) {
                return BlocBuilder<TodayBloc, TodayState>(
                  builder: (context, stateToday) {
                    if (stateToday is TodayLoaded) {
                      return InkWell(
                        onTap: () => GoRoute.push(
                            context: context,
                            routeName: Constant.xScreenALlMatch,
                            modelValidation: state.modelValidation,
                            modelToday: stateToday.modelToday),
                        child: Text("View All",
                            style: Theme.of(context).textTheme.bodySmall),
                      );
                    }
                    return Container();
                  },
                );
              }
              return Container();
            },
          )
        ],
      ),
    );

Widget contentAllMatchBar() => BlocBuilder<TodayBloc, TodayState>(
      builder: (context, state) {
        if (state is TodayLoaded) {
          return Container(
            margin: xSpaceOnly(bottom: 10, top: 10),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: state.modelToday.result!.length <= 5
                  ? state.modelToday.result!.length
                  : 5,
              separatorBuilder: (context, index) {
                 if (index == 3 ) {
                  return Container(
                    margin: Constant.xSpaceOnly(bottom: 10),
                    child: const CostumShowNativeAdsSemua(),
                  );
                } else {
                  return Container();
                }
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: Constant.xSpaceOnly(bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: xColorSubVariant,
                              child: Icon(
                                Icons.groups,
                                color: xColorVariant,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.modelToday.result![index].leagueName!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    state.modelToday.result![index].match![0]
                                        .leagueNameShort!,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                        itemCount:
                            state.modelToday.result![index].match!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int i) {
                          var data = state.modelToday.result![index].match![i];
                          return BlocBuilder<ValidationBloc, ValidationState>(
                            builder: (context, stateVal) {
                              if (stateVal is ValidationLoaded) {
                                return InkWell(
                                  onTap: () => GoRoute.push(
                                      context: context,
                                      routeName: Constant.xScreenDetail,
                                      modelValidation: stateVal.modelValidation,
                                      modelMatch: data),
                                  child: Container(
                                    width: Constant.xSizeWidth(context),
                                    padding: Constant.xSpaceSymetric(
                                        horizontal: 8, vertical: 10),
                                    margin: Constant.xSpaceSymetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Constant.xColorDarkSub,
                                      borderRadius: BorderRadius.circular(
                                          Constant.xDefaultSize),
                                    ),
                                    child: Container(
                                        padding: xSpaceSymetric(horizontal: 0),
                                        child: Column(
                                          children: [
                                            data.live!.status == "online"
                                                ? Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 10,
                                                        height: 10,
                                                        margin: xSpaceOnly(
                                                            right: 5),
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Constant
                                                                    .xColorAccents,
                                                                shape: BoxShape
                                                                    .circle),
                                                      ),
                                                      Text(
                                                        "LIVE",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      )
                                                    ],
                                                  )
                                                : Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      data.matchTime!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    )),
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
                                                        data.homeName!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  data.homeScore.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                                Padding(
                                                  padding: xSpaceSymetric(
                                                      horizontal: 5),
                                                  child: Text(
                                                    "VS",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5,
                                                  ),
                                                ),
                                                Text(
                                                  data.awayScore.toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
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
                                                        data.awayName!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
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
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
