import 'package:audience_network/ad/banner_ad.dart';
import 'package:firemax_football/bloc/search/search_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/pages/search_page/component/search_clip_background.dart';
import 'package:firemax_football/views/widgets/banner_ad_widget.dart';
import 'package:firemax_football/views/widgets/banner_fan_widget.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/card_glass_effect.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:firemax_football/views/widgets/native_ad_widget.dart';
import 'package:firemax_football/views/widgets/native_fan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SearchPage extends StatefulWidget {
  final ModelRoute? modelRoute;
  const SearchPage({Key? key, this.modelRoute}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc bloc;
  final TextEditingController _controller = TextEditingController();
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of(context);
  }

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
                  modelValidation: widget.modelRoute!.modelValidation!);
            },
            child: const Icon(Icons.arrow_back_rounded, color: xColorSubMain)),
        title: Container(
          height: 40,
          margin: xSpaceOnly(right: 20),
          child: TextField(
            cursorColor: xColorSubMain,
            controller: _controller,
            style: xFontP.copyWith(
                fontSize: 12, color: xColorMain, fontWeight: FontWeight.w100),
            decoration: InputDecoration(
              hintStyle: xFontP.copyWith(
                  fontSize: 12,
                  color: xColorSubMain,
                  fontWeight: FontWeight.w100),
              fillColor: xColorSubVariant,
              filled: true,
              hintText: 'Procure Aqui...',
              suffixIcon: isTyping
                  ? InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          _controller.clear();
                          isTyping = false;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: xColorSubMain.withOpacity(1),
                      ),
                    )
                  : const SizedBox(),
              contentPadding:
                  xSpaceOnly(bottom: 10, left: 15, right: 0, top: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            onSubmitted: (v) {
              bloc.add(LoadSearch(v));
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  isTyping = true;
                });
              }
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          searchClipBg(context),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchWaiting) {
                return const Center(
                  child: CustomLoading(
                    color: xColorSubMain,
                    width: 30,
                    height: 30,
                  ),
                );
              }
              if (state is SearchError) {
                return Center(
                    child: CustomCardGlassEffect(
                  width: xWidth(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 100,
                          child: widget.modelRoute!.modelValidation!.ads!
                                      .activeAds ==
                                  "admob"
                              ? CostumBannerAdmob(
                                  unitId: widget.modelRoute!.modelValidation!
                                      .ads!.admob!.admobBannerId!,
                                  adSize: AdSize.largeBanner,
                                )
                              : CostumBannerFan(
                                  placementId: widget.modelRoute!
                                      .modelValidation!.ads!.fan!.fanBannerId,
                                  bannerSize: BannerSize.LARGE,
                                )),
                      const Spacer(),
                      const Icon(Icons.error, color: xColorSubMain, size: 38),
                      Text(
                        "Nenhum dado encontrado",
                        style: xFontH2,
                      ),
                      const Spacer(),
                    ],
                  ),
                ));
              }
              if (state is SearchLoaded) {
                return ListView.separated(
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
                                    unitId: stateVal.modelValidation.ads!.admob!
                                        .admobNative!,
                                    height: 70,
                                  ),
                                );
                              } else {
                                return CustomCardGlassEffect(
                                    width: xWidth(context),
                                    child: CostumNativeFan(
                                      height: 70,
                                      placementId: stateVal.modelValidation.ads!
                                          .fan!.fanNativeId,
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
                  itemCount: state.dataSearch!.length <= 5
                      ? state.dataSearch!.length
                      : 5,
                  itemBuilder: (BuildContext context, int index) {
                    var data = state.dataSearch![index];
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
                                                  overflow: TextOverflow.ellipsis,
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
                                                  overflow: TextOverflow.ellipsis,
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
