 
import 'package:firemax_football/bloc/live/live_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart'; 
import 'package:firemax_football/constants/constant.dart'; 
import 'package:firemax_football/constants/space_style.dart'; 
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart'; 
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
        labelLiveBar(context),
        contentLiveBar(context),
      ],
    ),
  );
}

Widget labelLiveBar(BuildContext context) => Container(
      padding: xSpaceSymetric(horizontal: 12),
      margin: Constant.xSpaceOnly(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "LIVE NOW",
            style: Theme.of(context).textTheme.headline5,
          ),
          BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, state) {
              if (state is ValidationLoaded) {
                return BlocBuilder<LiveBloc, LiveState>(
                  builder: (context, stateLive) {
                    if (stateLive is LiveLoaded) {
                      return InkWell(
                        onTap: () => GoRoute.push(
                            context: context,
                            routeName: Constant.xScreenALlLive,
                            modelValidation: state.modelValidation,
                            listMatch: stateLive.modelLive.result),
                        child: Text(
                          "View All",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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

Widget contentLiveBar(BuildContext context) => BlocBuilder<LiveBloc, LiveState>(
      builder: (context, state) {
        if (state is LiveWaiting) {
          return SizedBox(
            height: xHeight(context) * 0.25,
            child: Container(
              width: Constant.xSizeWidth(context),
              padding: Constant.xSpaceSymetric(horizontal: 8, vertical: 10),
              margin: Constant.xSpaceSymetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Constant.xColorDarkSub,
                borderRadius: BorderRadius.circular(Constant.xDefaultSize),
              ),
              child: const Center(
                child: CustomLoading(
                  height: 30,
                  width: 30,
                  color: Constant.xColorAccents,
                ),
              ),
            ),
          );
        }
        if (state is LiveError) {
          return SizedBox(
              height: xHeight(context) * 0.25,
              child: Container(
                width: Constant.xSizeWidth(context),
                padding: Constant.xSpaceSymetric(horizontal: 8, vertical: 10),
                margin: Constant.xSpaceSymetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Constant.xColorDarkSub,
                  borderRadius: BorderRadius.circular(Constant.xDefaultSize),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.broadcast_on_personal,
                      color: Constant.xColorLight,
                      size: 30,
                    ),
                    Text(
                      "Sorry, no matches at the moment",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ));
        }
        if (state is LiveLoaded) {
          return SizedBox(
            height: xHeight(context) * 0.25,
            child: ListView.builder(
              itemCount: state.modelLive.result!.length <= 5
                  ? state.modelLive.result!.length
                  : 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var data = state.modelLive.result![index];
                return BlocBuilder<ValidationBloc, ValidationState>(
                  builder: (context, stateVal) {
                    if (stateVal is ValidationLoaded) {
                      return InkWell(
                        onTap: () => GoRoute.push(
                          context: context,
                          routeName: Constant.xScreenDetail,
                          modelValidation: stateVal.modelValidation,
                          modelMatch: data,
                        ),
                        child: Container(
                          width: Constant.xSizeWidth(context),
                          padding: Constant.xSpaceSymetric(
                              horizontal: 8, vertical: 10),
                          margin: Constant.xSpaceSymetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              color: Constant.xColorDarkSub,
                              borderRadius:
                                  BorderRadius.circular(Constant.xDefaultSize)),
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
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    margin: xSpaceOnly(right: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.green[800],
                                        shape: BoxShape.circle),
                                  ),
                                  Text(
                                    "LIVE",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Constant.xColorLight),
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
                                  Text(data.homeName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  const Spacer(),
                                  Text(data.homeScore.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ],
                              ),
                              const Spacer(flex: 1),
                              Align(
                                alignment: Alignment.center,
                                child: Text("VS",
                                    style:
                                        Theme.of(context).textTheme.headline4),
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
                                  Text(data.awayName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  const Spacer(),
                                  Text(data.awayScore.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
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
        return Container();
      },
    );
