import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemMatch extends StatelessWidget {
  final List<ModelMatch> match;
  const ItemMatch({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, indexSep) {
        return Container();
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: match.length,
      itemBuilder: (BuildContext context, int i) {
        var data = match[i];
        return BlocBuilder<ValidationBloc, ValidationState>(
          builder: (context, state) {
            if (state is ValidationLoaded) {
              return InkWell(
                onTap: () {
                  GoRoute.push(
                      context: context,
                      routeName: Constant.xScreenDetail,
                      modelValidation: state.modelValidation,
                      modelMatch: data,
                      );
                },
                child: Container(
                  width: Constant.xSizeWidth(context),
                  padding: Constant.xSpaceSymetric(horizontal: 8, vertical: 10),
                  margin: Constant.xSpaceSymetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      color: data.live!.status == "online"
                          ? Constant.xColorAccentsSub.withOpacity(0.9)
                          : Constant.xColorDarkSub,
                      borderRadius:
                          BorderRadius.circular(Constant.xDefaultSize)),
                  child: Column(
                    children: [
                      data.live!.status! == "online"
                          ? Text(
                              "Live",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Constant.xColorDark),
                            )
                          : Text(
                              data.matchTime!,
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
                                  backgroundColor: Constant.xColorLightSub,
                                  child: ClipOval(
                                    child: CustomCacheImg(
                                        fit: BoxFit.cover, url: data.homeLogo!),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(data.homeName!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: data.live!.status! == "online"
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  color: Constant.xColorDark)
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                ),
                              ],
                            ),
                          ),
                          Text(data.homeScore.toString(),
                              style: data.live!.status! == "online"
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Constant.xColorDark)
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
                                  backgroundColor: Constant.xColorLightSub,
                                  child: ClipOval(
                                    child: CustomCacheImg(
                                        fit: BoxFit.cover, url: data.awayLogo!),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(data.awayName!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: data.live!.status! == "online"
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  color: Constant.xColorDark)
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                ),
                              ],
                            ),
                          ),
                          Text(data.awayScore.toString(),
                              style: data.live!.status! == "online"
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Constant.xColorDark)
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
  }
}
