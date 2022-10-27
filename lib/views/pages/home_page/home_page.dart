import 'package:firemax_football/bloc/live/live_bloc.dart';
import 'package:firemax_football/bloc/today/today_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/services/rating_service.dart';
import 'package:firemax_football/views/pages/home_page/component/home_allmatch_bar.dart';
import 'package:firemax_football/views/pages/home_page/component/home_header_bar.dart';
import 'package:firemax_football/views/pages/home_page/component/home_live_bar.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final ModelRoute? modelRoute;
  const HomePage({Key? key, this.modelRoute}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TodayBloc todayBloc;
  late LiveBloc liveBloc;
  final RatingService _ratingService = RatingService();

  @override
  void initState() {
    super.initState();
    todayBloc = BlocProvider.of<TodayBloc>(context);
    liveBloc = BlocProvider.of<LiveBloc>(context);
    todayBloc.add(LoadToday(1));
    liveBloc.add(LoadLive());
    getIntValuesSF();
  }

  Future refreshHome() async {
    todayBloc.add(LoadToday(1));
    liveBloc.add(LoadLive());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 12,
        title: homeHeaderBar(context),
        actions: [
          BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, state) {
              if (state is ValidationLoaded) {
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    GoRoute.push(
                      context: context,
                      routeName: Constant.xScreenSearch,
                      modelValidation: state.modelValidation,
                    );
                  },
                );
              }
              return Container();
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshHome,
        color: Constant.xColorAccents,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // homeSearchBar(context),
                // homeNativeBar(),
                // const CostumShowNativeAdsSemua(),
                // homeLigaBar(),
                // const CostumShowNativeAdsSemua(),
                // homeNativeBar(),
                homeLiveBar(context), 
                const CostumShowNativeAdsSemua(),
                const SizedBox(height: 10),
                homeAllMatchBar(context),
              ],
            ),
          ),
        ),
      ),
     
    );
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var count = prefs.getInt('welcome') ?? 0;

    count++;
    prefs.setInt('welcome', count);
    if (count == 4) {
      _ratingService.showRating();
    }
  }
}
