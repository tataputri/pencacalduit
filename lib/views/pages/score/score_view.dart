import 'package:firemax_football/bloc/date/date_bloc.dart';
import 'package:firemax_football/bloc/score/score_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:firemax_football/views/pages/score/component.dart/item_liga.dart';
import 'package:firemax_football/views/pages/score/component.dart/item_match.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:firemax_football/views/widgets/hasmore.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/score.dart';

class ScoreView extends StatefulWidget {
  const ScoreView({super.key});

  @override
  State<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  late DateBloc jadwalBloc;
  late ScoreBloc _scoreBloc;
  final ScrollController _scrollController = ScrollController();
  final ApiRepository apiRepository = ApiRepository();
  int? lastPage;
  String? date;
  int initIndex = 0;
  int currentPage = 1;
  bool hasMore = true;
  List<Result> newItem = [];
  @override
  void initState() {
    jadwalBloc = BlocProvider.of<DateBloc>(context);
    _scoreBloc = BlocProvider.of<ScoreBloc>(context);
    jadwalBloc.add(LoadDate());

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage == lastPage) {
          setState(() {
            hasMore = false;
          });
        } else {
          setState(() {
            currentPage++;
          });
          fetch();
        }
      }
    });
    super.initState();
  }

  Future<List<Result>?> fetch() async {
    final data = await apiRepository.getScore(date!, currentPage.toString());

    if (data!.result!.isEmpty) {
      return null;
    } else {
      setState(() {
        newItem.addAll(data.result!);
      });
      return data.result!;
    }
  }

  Future refreshHome() async {
    jadwalBloc.add(LoadDate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        backgroundColor: Constant.xColorAccentsSub,
        color: Constant.xColorAccents,
        onRefresh: refreshHome,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: 100,
              floating: true,
              pinned: true,
              snap: false,
              title: Container(
                margin: Constant.xSpaceSymetric(
                    horizontal: Constant.xDefaultSize,
                    vertical: Constant.xDefaultSize),
                child: Text(
                  "Score",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(Constant.xSizeWidth(context), 50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BlocConsumer<DateBloc, DateState>(
                    listener: (context, state) {
                      if (state is DateLoaded) {
                        date = state.scoreDate[0].nama!;
                        _scoreBloc.add(
                          LoadScore(date: date!, page: "$currentPage"),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is DateLoaded) {
                        var item = state.scoreDate;
                        return SizedBox(
                          height: 30,
                          child: ListView.builder(
                            itemCount: item.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  newItem.clear();
                                  setState(() {
                                    currentPage = 1;
                                    initIndex = index;
                                    date = state.scoreDate[index].nama!;
                                  });
                                  _scoreBloc.add(
                                    LoadScore(
                                        date: date!, page: "$currentPage"),
                                  );
                                },
                                child: Center(
                                  child: Container(
                                    margin:
                                        Constant.xSpaceSymetric(horizontal: 5),
                                    padding: Constant.xSpaceSymetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: initIndex == index
                                          ? Constant.xColorAccents
                                          : Colors.transparent,
                                    ),
                                    child: Text(item[index].value!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              color: initIndex == index
                                                  ? Constant.xColorDark
                                                  : Constant.xColorLightSub,
                                            )),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocConsumer<ScoreBloc, ScoreState>(
                    listener: (context, state) {
                      if (state is ScoreLoaded) {
                        newItem.addAll(state.modelScore.result!);
                        lastPage = state.modelScore.meta!.lastPage;
                      }
                    },
                    builder: (context, state) {
                      if (state is ScoreWaiting) {
                        return SizedBox(
                          height: Constant.xSizeHeight(context),
                          child: const Center(child: CustomLoading()),
                        );
                      }
                      if (state is ScoreLoaded) {
                        return Container(
                          padding: Constant.xSpaceOnly(bottom: 100),
                          child: ListView.separated(
                            separatorBuilder: (context, i) {
                              if (i % 5 == 0) {
                                return Container(
                                  margin: Constant.xSpaceSymetric(vertical: 0),
                                  child: const CostumShowNativeAdsSemua(),
                                );
                              } else {
                                return Container();
                              }
                            },
                            itemCount: newItem.length + 1,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              if (index != newItem.length) {
                                var itemLiga = newItem[index];
                                return Container(
                                  margin: Constant.xSpaceSymetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      ItemLigaScore(itemLiga: itemLiga),
                                      ItemMatchScore(
                                        match: itemLiga.match!,
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return HasMore(hasMore: hasMore);
                              }
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}
