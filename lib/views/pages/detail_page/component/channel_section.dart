import 'package:firemax_football/models/detail.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/channel/channel_bloc.dart';
import '../../../../constants/constant.dart';
import '../../../widgets/button_widget.dart';

class ChannelButton extends StatefulWidget {
  const ChannelButton({super.key, required this.modelValidation, required this.matchId});
  final ModelValidation modelValidation;
  final int matchId;

  @override
  State<ChannelButton> createState() => _ChannelButtonState();
}

class _ChannelButtonState extends State<ChannelButton> {
  late ChannelBloc channelBloc;

  @override
  void initState() {
    super.initState();
    channelBloc = BlocProvider.of<ChannelBloc>(context);
    channelBloc.add(LoadChannel(widget.matchId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelBloc, ChannelState>(
      builder: (context, state) {
        if (state is ChannelLoaded) {
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
                  onTap: (state.modelChannel.channel1!.link == "") ? null : () {
                    if (state.modelChannel.channel1!.isIframe == true) {
                      GoRoute.push(
                        context: context,
                        routeName: Constant.xScreenEmbedPLayer,
                        modelValidation: widget.modelValidation,
                        modelDetail: ModelDetail(
                          title: "Channel 1",
                          url: state.modelChannel.channel1!.link,
                        ),
                      );
                    } else {
                      GoRoute.push(
                        context: context,
                        routeName: Constant.xScreenExoPlayer,
                        modelValidation: widget.modelValidation,
                        modelDetail: ModelDetail(
                          title: "Channel 1",
                          url: state.modelChannel.channel1!.link,
                        ),
                      );
                    }
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
                  onTap: (state.modelChannel.channel2!.link == "")
                      ? null
                      : () {
                    if (state.modelChannel.channel2!.isIframe == true) {
                      GoRoute.push(
                        context: context,
                        routeName: Constant.xScreenEmbedPLayer,
                        modelValidation: widget.modelValidation,
                        modelDetail: ModelDetail(
                          title: "Channel 2",
                          url: state.modelChannel.channel2!.link,
                        ),
                      );
                    } else {
                      GoRoute.push(
                        context: context,
                        routeName: Constant.xScreenExoPlayer,
                        modelValidation: widget.modelValidation,
                        modelDetail: ModelDetail(
                          title: "Channel 2",
                          url: state.modelChannel.channel2!.link,
                        ),
                      );
                    }
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
                  onTap: (state.modelChannel.channel3!.link == "")
                      ? null
                      : () {
                    if (state.modelChannel.channel3!.isIframe == true) {
                      GoRoute.push(
                        context: context,
                        routeName: Constant.xScreenEmbedPLayer,
                        modelValidation: widget.modelValidation,
                        modelDetail: ModelDetail(
                          title: "Channel 3",
                          url: state.modelChannel.channel3!.link,
                        ),
                      );
                    } else {
                      GoRoute.push(
                        context: context,
                        routeName: Constant.xScreenExoPlayer,
                        modelValidation: widget.modelValidation,
                        modelDetail: ModelDetail(
                          title: "Channel 3",
                          url: state.modelChannel.channel3!.link,
                        ),
                      );
                    }
                  },
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
        if (state is ChannelError) {
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
                  onTap: null,
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
                  onTap: null,
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
                  onTap: null,
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
}

// Widget channelButton(BuildContext context, ModelValidation modelValidation) {
//   return 
// }
