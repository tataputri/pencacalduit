import 'dart:developer';
import 'package:firemax_football/bloc/today/today_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:firemax_football/views/pages/liga/components/item_liga.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:firemax_football/views/widgets/hasmore.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/today.dart';

class LigaView extends StatefulWidget {
  const LigaView({super.key});

  @override
  State<LigaView> createState() => _LigaViewState();
}

class _LigaViewState extends State<LigaView> {
  final ScrollController _scrollController = ScrollController();
  late TodayBloc _todayBloc;
  ApiRepository apiRepository = ApiRepository();
  int currentPage = 1;
  int? lastPage;
  List<Result> newItem = [];
  bool hasMore = true;
  bool isScroll = false;

  @override
  void initState() {
    _todayBloc = BlocProvider.of<TodayBloc>(context);
    _todayBloc.add(LoadToday(1));
    _scrollController.addListener(() {
      if (_scrollController.offset > 5) {
        setState(() {
          isScroll = true;
        });
      } else {
        setState(() {
          isScroll = false;
        });
      }
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

          fetch(currentPage);
        }
      }
    });
    super.initState();
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

  Future refreshHome() async {
    _todayBloc.add(LoadToday(1));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Constant.xColorAccentsSub,
      color: Constant.xColorAccents,
      onRefresh: refreshHome,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                isScroll ? Constant.xColorDarkSub : Colors.transparent,
            elevation: 0,
            title: InkWell(
              onTap: () {
                log(newItem.length.toString());
              },
              child: Container(
                margin: Constant.xSpaceSymetric(
                  horizontal: Constant.xDefaultSize,
                ),
                child: Text(
                  "League",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            //  padding: Constant.xSpaceOnly(bottom: 100),
            child: BlocConsumer<TodayBloc, TodayState>(
              listener: (context, state) {
                if (state is TodayLoaded) {
                  newItem.addAll(state.modelToday.result!);
                  lastPage = state.modelToday.meta!.lastPage!;
                }
              },
              builder: (context, state) {
                if (state is TodayWaiting) {
                  return SizedBox(
                    height: Constant.xSizeHeight(context),
                    child: const Center(child: CustomLoading()),
                  );
                }
                if (state is TodayLoaded) {
                  return Container(
                    padding: Constant.xSpaceOnly(bottom: 100),
                    child: ListView.separated(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        if (index % 8 == 0) {
                          return Container(
                            margin: Constant.xSpaceSymetric(vertical: 5),
                            child: const CostumShowNativeAdsSemua(),
                          );
                        } else {
                          return Container();
                        }
                      },
                      itemCount: newItem.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index != newItem.length) {
                          return ItemLiga(itemLiga: newItem[index]);
                        } else {
                          return HasMore(hasMore: hasMore);
                        }
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
