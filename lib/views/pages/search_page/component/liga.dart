import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:firemax_football/views/widgets/hasmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/search.dart';

class LigaItemSearch extends StatefulWidget {
  final String? keyword;
  final List<Result>? items;
  final int? lastPage;
  const LigaItemSearch({super.key, this.keyword, this.items, this.lastPage});

  @override
  State<LigaItemSearch> createState() => _LigaItemSearchState();
}

class _LigaItemSearchState extends State<LigaItemSearch> {
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
        if (currentPage == widget.lastPage) {
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

  Future<List<Result>?> fetch(int page) async {
    final data = await apiRepository.getSearch("${widget.keyword}", "$page");

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
      controller: _scrollController,
      itemCount: newItem.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index != newItem.length) {
          return BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, stateVal) {
              if (stateVal is ValidationLoaded) {
                return InkWell(
                  onTap: () {
                    GoRoute.push(
                        context: context,
                        routeName: Constant.xScreenDetailLiga,
                        modelValidation: stateVal.modelValidation,
                        listMatch: newItem[index].match);
                  },
                  child: Container(
                    width: Constant.xSizeWidth(context),
                    padding:
                        Constant.xSpaceSymetric(horizontal: 8, vertical: 10),
                    margin:
                        Constant.xSpaceSymetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Constant.xColorDarkSub,
                      borderRadius:
                          BorderRadius.circular(Constant.xDefaultSize),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Constant.xColorAccentsSub,
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
                                newItem[index].leagueName!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                newItem[index].match![0].leagueNameShort!,
                                style: Theme.of(context).textTheme.bodyText2,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container();
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
    super.dispose();
    newItem.clear();
  }
}
