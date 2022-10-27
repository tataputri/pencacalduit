import 'package:firemax_football/bloc/search/search_bloc.dart';
import 'package:firemax_football/constants/constant.dart'; 
import 'package:firemax_football/views/pages/search_page/component/liga.dart';
import 'package:firemax_football/views/pages/search_page/component/team.dart';
import 'package:firemax_football/views/widgets/costum_show_banner_applovin.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  bool isTyping = false;
  late SearchBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Container(
              height: 40,
              margin: Constant.xSpaceOnly(right: 20),
              child: TextField(
                cursorColor: Constant.xColorAccents,
                controller: _controller,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  fillColor: Constant.xColorDark,
                  filled: true,
                  hintText: 'League / Team Name',
                  suffixIcon: isTyping
                      ? InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            setState(() {
                              _controller.clear();
                              isTyping = false;
                            });
                          },
                          child: const Icon(Icons.close,
                              color: Constant.xColorLightSub),
                        )
                      : const SizedBox(),
                  contentPadding: Constant.xSpaceOnly(
                      bottom: 10, left: 15, right: 0, top: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                onSubmitted: (v) {
                  bloc.add(LoadSearch(keyword: v, page: '1'));
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(130.0),
              child: Column(
                children: [
                  const CostumShowBannerApplovin(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: Constant.xSizeWidth(context) / 2,
                      child: TabBar(
                        splashFactory: NoSplash.splashFactory,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: Theme.of(context).textTheme.headline6,
                        tabs: const [
                          Tab(
                            text: "League",
                          ),
                          Tab(
                            text: "Team",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SearchWaiting) {
                return const Center(child: CustomLoading());
              }
              if (state is SearchNull) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline_sharp, size: 35),
                      Text(
                        "Data Not Found",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                );
              }
              if (state is SearchError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline_sharp, size: 35),
                      Text(
                        "Data Not Found",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                );
              }
              if (state is SearchLoaded) {
                var newItem = state.dataSearch!.result!;
                return TabBarView(
                  children: [
                    LigaItemSearch(
                      keyword: _controller.text,
                      items: newItem,
                      lastPage: state.dataSearch!.meta!.lastPage!,
                    ),
                    TeamItemSearch(
                      keyword: _controller.text,
                      items: newItem,
                      lastpage: state.dataSearch!.meta!.lastPage!,
                    )
                  ],
                );
              }
              return Container();
            },
          )),
    );
  }
}
