import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/models/today.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/costum_show_banner_applovin.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMatchPage extends StatefulWidget {
  final ModelRoute? modelRoute;
  const AllMatchPage({Key? key, this.modelRoute}) : super(key: key);

  @override
  State<AllMatchPage> createState() => _AllMatchPageState();
}

class _AllMatchPageState extends State<AllMatchPage> {
  final ScrollController _scrollController = ScrollController();
  ApiRepository apiRepository = ApiRepository();
  int page = 1;
  bool hasMore = true;
  List<Result> newItem = [];

  @override
  void initState() {
    super.initState();
    newItem.addAll(widget.modelRoute!.modelToday!.result!);
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (page == widget.modelRoute!.modelToday!.meta!.lastPage) {
          setState(() {
            hasMore = false;
          });
        } else {
          setState(() {
            page++;
          });

          fetch(page);
        }
      }
    });
  }

  Future<List<Result>?> fetch(int page) async {
    final data = await apiRepository.getToday("$page");

    if (data!.result!.isEmpty) {
      return null;
    } else {
      setState(() {
        newItem.addAll(data.result!);
      });
      return data.result!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: InkWell(
            onTap: () => GoRoute.back(
                  context: context,
                  modelValidation: widget.modelRoute!.modelValidation!,
                ),
            child: const Icon(Icons.arrow_back_rounded,
                color: Constant.xColorLight)),
        title: Text("All Today Match",
            style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          margin: Constant.xSpaceOnly(bottom: 100),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: newItem.length + 1,
              separatorBuilder: (context, index) {
                if (index % 5 == 0) {
                  return Container(
                    margin: Constant.xSpaceSymetric(vertical: 5),
                    child: const CostumShowNativeAdsSemua(),
                  );
                } else {
                  return Container();
                }
              },
              itemBuilder: (BuildContext context, int index) {
                if (index != newItem.length) {
                  var data = newItem[index];
                  return Container(
                    margin: Constant.xSpaceOnly(top: 10),
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
                                  color: Constant.xColorAccents,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.leagueName!,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      data.match![0].leagueNameShort!,
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
                          itemCount: data.match!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int i) {
                            var dataMatch = data.match![i];
                            return BlocBuilder<ValidationBloc, ValidationState>(
                              builder: (context, stateVal) {
                                if (stateVal is ValidationLoaded) {
                                  return InkWell(
                                    onTap: () => GoRoute.push(
                                        context: context,
                                        routeName: Constant.xScreenDetail,
                                        modelValidation:
                                            stateVal.modelValidation,
                                        modelMatch: dataMatch),
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
                                        child: Column(
                                          children: [
                                            dataMatch.live!.status == "online"
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
                                                        dataMatch.live!.status!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      )
                                                    ],
                                                  )
                                                : Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      dataMatch.matchTime!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    )),
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
                                                          url: dataMatch
                                                              .homeLogo!,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        dataMatch.homeName!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  dataMatch.homeScore
                                                      .toString(),
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
                                                        .headline4,
                                                  ),
                                                ),
                                                Text(
                                                  dataMatch.awayScore
                                                      .toString(),
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
                                                          url: dataMatch
                                                              .awayLogo!,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        dataMatch.awayName!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
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
                } else {
                  return hasMore
                      ? Center(
                          child: Padding(
                              padding: Constant.xSpaceSymetric(vertical: 10),
                              child: const CustomLoading()),
                        )
                      : Container();
                }
              }),
        ),
      ),
      floatingActionButton: const CostumShowBannerApplovin(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
