import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/views/pages/detail_page/component/frame_play.dart';
import 'package:firemax_football/views/pages/detail_page/component/info_section.dart';
import 'package:firemax_football/views/widgets/costum_show_banner_applovin.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';

import '../../../bloc/channel/channel_bloc.dart';
import 'component/channel_section.dart';
import 'component/info_score.dart';

class DetailPage extends StatefulWidget {
  final ModelMatch? modelMatch;
  const DetailPage({Key? key, this.modelMatch}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isLive;
  late ChannelBloc channelBloc;

  @override
  void initState() {
    super.initState();
    channelBloc = BlocProvider.of<ChannelBloc>(context);

    Wakelock.toggle(enable: true);
    if (widget.modelMatch!.live!.status! == "online") {
      setState(() {
        isLive = true;
      });
    } else {
      setState(() {
        isLive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Match"),
      ),
      body: RefreshIndicator(
        backgroundColor: Constant.xColorAccentsSub,
        color: Constant.xColorDark,
        onRefresh: refreshHome,
        child: SafeArea(
          child: ListView(
            children: [
              BlocBuilder<ValidationBloc, ValidationState>(
                builder: (context, state) {
                  if (state is ValidationLoaded) {
                    if (state.modelValidation.isOpen == true) {
                      if (isLive) {
                        return Column(
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
                                borderRadius: BorderRadius.circular(
                                    Constant.xDefaultSize),
                              ),
                              child: FramePlay(
                                urlVideo: widget.modelMatch!.live!.url1!,
                              ),
                            ),
                            ChannelButton(
                              modelValidation: state.modelValidation,
                              matchId: widget.modelMatch!.matchId!,
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    } else {
                      return Container();
                    }
                  }
                  return Container();
                },
              ),
              Container(
                  margin: Constant.xSpaceOnly(top: 10),
                  child: const CostumShowNativeAdsSemua()),
              infoScore(context, widget.modelMatch!),
              infoSection(context, widget.modelMatch!),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
      floatingActionButton: const CostumShowBannerApplovin(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future refreshHome() async {
    channelBloc.add(LoadChannel(widget.modelMatch!.matchId!));
  }

  @override
  void dispose() {
    super.dispose();
    Wakelock.toggle(enable: false);
  }
}
