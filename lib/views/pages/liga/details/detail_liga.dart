import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/costum_show_banner_applovin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailLiga extends StatelessWidget {
  const DetailLiga({super.key, required this.match});

  final List<ModelMatch> match;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(match[0].leagueName!),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Constant.xSpaceOnly(bottom: 100),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            separatorBuilder: (context, index) {
              return Container();
            },
            itemCount: match.length,
            itemBuilder: (BuildContext context, int index) {
              return BlocBuilder<ValidationBloc, ValidationState>(
                builder: (context, state) {
                  if (state is ValidationLoaded) {
                    return InkWell(
                      onTap: () {
                        GoRoute.push(
                            context: context,
                            routeName: Constant.xScreenDetail,
                            modelValidation: state.modelValidation,
                            modelMatch: match[index]);
                      },
                      child: Container(
                        width: Constant.xSizeWidth(context),
                        padding: Constant.xSpaceSymetric(
                            horizontal: 8, vertical: 10),
                        margin: Constant.xSpaceSymetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                            color: match[index].live!.status == "online"
                                ? Constant.xColorAccentsSub.withOpacity(0.9)
                                : Constant.xColorDarkSub,
                            borderRadius:
                                BorderRadius.circular(Constant.xDefaultSize)),
                        child: Column(
                          children: [
                            match[index].live!.status! == "online"
                                ? Text(
                                    "Live",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Constant.xColorDark),
                                  )
                                : Text(
                                    match[index].matchTime!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Constant.xColorLight),
                                  ),
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
                                              url: match[index].homeLogo!),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(match[index].homeName!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: match[index].live!.status! ==
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
                                Text(match[index].homeScore.toString(),
                                    style: match[index].live!.status! ==
                                            "online"
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
                                              fit: BoxFit.cover,
                                              url: match[index].awayLogo!),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(match[index].awayName!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: match[index].live!.status! ==
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
                                Text(match[index].awayScore.toString(),
                                    style: match[index].live!.status! ==
                                            "online"
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
          ),
        ),
      ),
      floatingActionButton: const CostumShowBannerApplovin(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
