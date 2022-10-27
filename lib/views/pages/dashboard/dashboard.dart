// ignore_for_file: avoid_print
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/views/pages/home_page/home_page.dart';
import 'package:firemax_football/views/pages/jadwal/jadwal_view.dart';
import 'package:firemax_football/views/pages/liga/liga_view.dart';
import 'package:firemax_football/views/pages/score/score_view.dart';
import 'package:firemax_football/views/widgets/costum_bottom_bar.dart';
import 'package:firemax_football/views/widgets/costum_show_banner_applovin.dart';
import 'package:firemax_football/views/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, this.modelValidation});

  final ModelValidation? modelValidation;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static const List<Widget> _buildScreens = [
    HomePage(),
    JadwalView(),
    LigaView(),
    ScoreView(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.modelValidation!.systemAds!.status == true) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await customDialog(context,
              title: widget.modelValidation!.systemAds!.title,
              content: widget.modelValidation!.systemAds!.content,
              url: Uri.parse(widget.modelValidation!.systemAds!.url!));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomBar(),
      extendBody: true,
      floatingActionButton: const CostumShowBannerApplovin(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 55,
      backgroundColor: Constant.xColorDarkSub,
      selectedIndex: _selectedIndex,
      showElevation: true,
      itemCornerRadius: 12,
      curve: Curves.easeIn,
      onItemSelected: (index) {
        setState(() => _selectedIndex = index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: Text('Home',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Constant.xColorAccents)),
          activeColor: Constant.xColorAccents,
          inactiveColor: Constant.xColorAccentsSub,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.calendar_view_month),
          title: Text('Schedule',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Constant.xColorAccents)),
          activeColor: Constant.xColorAccents,
          inactiveColor: Constant.xColorAccentsSub,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.groups),
          title: Text('League',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Constant.xColorAccents)),
          activeColor: Constant.xColorAccents,
          inactiveColor: Constant.xColorAccentsSub,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.scoreboard_rounded),
          title: Text('Score',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Constant.xColorAccents)),
          activeColor: Constant.xColorAccents,
          inactiveColor: Constant.xColorAccentsSub,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
