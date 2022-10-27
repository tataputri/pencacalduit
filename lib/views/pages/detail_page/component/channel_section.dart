import 'package:firemax_football/models/detail.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/channel/channel_bloc.dart';
import '../../../../constants/constant.dart';
import '../../../widgets/button_widget.dart';

Widget channelButton(BuildContext context, ModelValidation modelValidation) {
  return BlocBuilder<ChannelBloc, ChannelState>(
    builder: (context, state) {
    if(state is ChannelLoaded){
      return Container(
          width: Constant.xSizeWidth(context),
          margin: Constant.xSpaceSymetric(
            horizontal: 10,
            vertical: 0,
          ),
          padding: Constant.xSpaceSymetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Constant.xColorDarkSub,
            borderRadius: BorderRadius.circular(Constant.xDefaultSize),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () {
                  GoRoute.push(
                      context: context,
                      routeName: Constant.xScreenExoPlayer,
                      modelValidation: modelValidation,
                      modelDetail: ModelDetail(
                          title: "Channel 1",
                          url:
                              "https://live.fiaqlo.com/live/6413613_3f50309e91dd2a5da8176d341f26d354.m3u8?auth_key=1666813261-6359631de9b26-0-f2f90bdb4bf5bc973858717b13f42955"));
                },
                color: Constant.xColorAccents,
                child: Text(
                  "Channel 1",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Constant.xColorDark),
                ),
              ),
              CustomButton(
                onTap: () {
                  GoRoute.push(
                      context: context,
                      routeName: Constant.xScreenEmbedPLayer,
                      modelValidation: modelValidation,
                      modelDetail: ModelDetail(
                          title: "Channel 2",
                          url:
                              "https://live.balbal.cyou/?vid=aHR0cHM6Ly9zcG9ydHNvbmxpbmUudG8vY2hhbm5lbHMvaGQvaGQxLnBocA=="));
                },
                color: Constant.xColorAccents,
                child: Text(
                  "Channel 2",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Constant.xColorDark),
                ),
              ),
              CustomButton(
                onTap: () {},
                color: Constant.xColorAccents,
                child: Text(
                  "Channel 3",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Constant.xColorDark),
                ),
              ),
            ],
          ),
        );
    }
      return Container();
    },
  );
}
