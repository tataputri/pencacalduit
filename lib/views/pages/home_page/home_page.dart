import 'package:firemax_football/bloc/home/home_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/models/model_route.dart';
import 'package:firemax_football/services/rating_service.dart';
import 'package:firemax_football/views/pages/home_page/component/clip_background.dart';
import 'package:firemax_football/views/pages/home_page/component/home_allMatch_bar.dart';
import 'package:firemax_football/views/pages/home_page/component/home_header_bar.dart';
import 'package:firemax_football/views/pages/home_page/component/home_liga_bar.dart';
import 'package:firemax_football/views/pages/home_page/component/home_live_bar.dart';
import 'package:firemax_football/views/pages/home_page/component/home_native_bar.dart';
import 'package:firemax_football/views/pages/home_page/component/home_search_bar.dart';
import 'package:firemax_football/views/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final ModelRoute? modelRoute;
  const HomePage({Key? key, this.modelRoute}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  final RatingService _ratingService = RatingService();

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of(context);
    homeBloc.add(LoadHome());
    getIntValuesSF();
     if (widget.modelRoute!.modelValidation!.systemApp!.statusSystemApp == true) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        customDialog(context,
            title: widget.modelRoute!.modelValidation!.systemApp!.infoRedirectSystemApp!.title,
            content: widget.modelRoute!.modelValidation!.systemApp!
                .infoRedirectSystemApp!.content,
            img: widget.modelRoute!.modelValidation!.systemApp!
                .infoRedirectSystemApp!.imageurl,
            url: widget.modelRoute!.modelValidation!.systemApp!
                .infoRedirectSystemApp!.urlredirect);
      });
    }
  }

  Future refreshHome() async {
    homeBloc.add(LoadHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xColorSubPrimary,
      body: RefreshIndicator(
        onRefresh: refreshHome,
        color: xColorSubMain,
        child: Stack(
          children: [
            homeClipBg(context),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeHeaderBar(),
                    homeSearchBar(context),
                    homeLiveBar(context),
                    homeNativeBar(),
                    homeLigaBar(),
                    homeNativeBar(),
                    homeAllMatchBar(),
                  ],
                ),
              ),
            ),
          ],
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
