import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:firemax_football/views/widgets/hasmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/search.dart';

class TeamItemSearch extends StatefulWidget {
  final String? keyword;
  final List<Result>? items;
  final int? lastpage;
  const TeamItemSearch({super.key, this.keyword, this.items, this.lastpage});

  @override
  State<TeamItemSearch> createState() => _TeamItemSearchState();
}

class _TeamItemSearchState extends State<TeamItemSearch> {
  final ScrollController _scrollController = ScrollController();
  ApiRepository apiRepository = ApiRepository();
  int page = 1;

  int currentPage = 1;
  List<Result> newItem = [];
  bool hasMore = false;

  @override
  void initState() {
    super.initState();
    newItem.addAll(widget.items!);
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage == widget.lastpage) {
          setState(() {
            hasMore = false;
          });
        } else {
          setState(() {
            hasMore = true;
            currentPage++;
          });

          fetch(currentPage);
        }
      }
    });
  }

  Future<List<Result>?> fetch(int currentPage) async {
    final data =
        await apiRepository.getSearch("${widget.keyword}", "$currentPage");

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
    return ListView.separated(
      separatorBuilder: (context, i) {
        if (i % 5 == 0) {
          return Container(
            margin: Constant.xSpaceSymetric(vertical: 5),
            child: const CostumShowNativeAdsSemua(),
          );
        } else {
          return Container();
        }
      },
      controller: _scrollController,
      itemCount: newItem.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index != newItem.length) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newItem[index].match!.length,
            itemBuilder: (BuildContext context, int i) {
              var team = newItem[index].match![i];
              return BlocBuilder<ValidationBloc, ValidationState>(
                builder: (context, stateVal) {
                  if (stateVal is ValidationLoaded) {
                    return InkWell(
                      onTap: () {
                        GoRoute.push(
                          context: context,
                          routeName: Constant.xScreenDetail,
                          modelValidation: stateVal.modelValidation,
                          modelMatch: team,
                        );
                      },
                      child: Container(
                        width: Constant.xSizeWidth(context),
                        padding: Constant.xSpaceSymetric(
                            horizontal: 8, vertical: 10),
                        margin: Constant.xSpaceSymetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                            color: team.live!.status == "online"
                                ? Constant.xColorAccentsSub.withOpacity(0.9)
                                : Constant.xColorDarkSub,
                            borderRadius:
                                BorderRadius.circular(Constant.xDefaultSize)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    team.leagueName!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color:
                                                team.live!.status! == "online"
                                                    ? Constant.xColorDarkSub
                                                    : Constant.xColorLight),
                                  ),
                                ),
                                team.live!.status! == "online"
                                    ? Text(
                                        "Live",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: Constant.xColorDark),
                                      )
                                    : Text(
                                        team.matchTime!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: Constant.xColorLight),
                                      ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 15,
                                        backgroundColor:
                                            Constant.xColorLightSub,
                                        child: ClipOval(
                                          child: CustomCacheImg(
                                              fit: BoxFit.cover,
                                              height: 20,
                                              width: 20,
                                              url: team.homeLogo!),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(team.homeName!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: team.live!.status! ==
                                                    "online"
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        color:
                                                            Constant.xColorDark)
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(team.homeScore.toString(),
                                    style: team.live!.status! == "online"
                                        ? Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: Constant.xColorDark)
                                        : Theme.of(context).textTheme.headline5)
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 15,
                                        backgroundColor:
                                            Constant.xColorLightSub,
                                        child: ClipOval(
                                          child: CustomCacheImg(
                                              height: 20,
                                              width: 20,
                                              fit: BoxFit.cover,
                                              url: team.awayLogo!),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(team.awayName!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: team.live!.status! ==
                                                    "online"
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        color:
                                                            Constant.xColorDark)
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(team.awayScore.toString(),
                                    style: team.live!.status! == "online"
                                        ? Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: Constant.xColorDark)
                                        : Theme.of(context).textTheme.headline5)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              );
            },
          );
        } else if (newItem.isEmpty) {
          return Container();
        } else {
          return HasMore(hasMore: hasMore);
        }
      },
    );
  }

  @override
  void dispose() {
    newItem.clear();
    super.dispose();
  }
}
