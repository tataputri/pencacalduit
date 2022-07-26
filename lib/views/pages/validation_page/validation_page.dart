import 'package:audience_network/audience_network.dart';
import 'package:flutter/material.dart';
import 'package:template_spam_playtore/constants/colors_style.dart';
import 'package:template_spam_playtore/constants/space_style.dart';
import 'package:template_spam_playtore/controllers/fan_controller.dart';
import 'package:template_spam_playtore/dummy/listdummy.dart';
import 'package:template_spam_playtore/routes/route_constant.dart';
import 'package:template_spam_playtore/routes/routes_ads.dart';
import 'package:template_spam_playtore/views/widgets/banner_fan_widget.dart';
import 'package:template_spam_playtore/views/widgets/native_ad_widget.dart';
import 'package:template_spam_playtore/views/widgets/native_fan_widget.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  DataDummy? dataDummy;

  @override
  void initState() {
    dataDummy = DataDummy();
    dataDummy!.genereateListDummy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CostumBannerFan()
      ),
    );
  }
}
