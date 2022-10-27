import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/models/match.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/cache_img_widget.dart';
import 'package:firemax_football/views/widgets/costum_show_banner_applovin.dart';
import 'package:firemax_football/views/widgets/costum_show_native_ads_semua.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllLivePage extends StatelessWidget {
  final List<ModelMatch>? items;
  const AllLivePage({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: BlocBuilder<ValidationBloc, ValidationState>(
          builder: (context, state) {
            if (state is ValidationLoaded) {
              return InkWell(
                  onTap: () {
                    GoRoute.back(
                        context: context,
                        modelValidation: state.modelValidation);
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Constant.xColorLight,
                  ));
            }
            return Container();
          },
        ),
        title: Text(
          "All Live Now",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Constant.xSpaceOnly(bottom: 100),
          child: ListView.separated(
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
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: items!.length,
            itemBuilder: (BuildContext context, int index) {
              var data = items![index];
              return BlocBuilder<ValidationBloc, ValidationState>(
                builder: (context, stateVal) {
                  if (stateVal is ValidationLoaded) {
                    return InkWell(
                      onTap: () => GoRoute.push(
                          context: context,
                          routeName: Constant.xScreenDetail,
                          modelValidation: stateVal.modelValidation,
                          modelMatch: data),
                      child: Container(
                          width: Constant.xSizeWidth(context),
                          padding: Constant.xSpaceSymetric(
                              horizontal: 8, vertical: 10),
                          margin: Constant.xSpaceSymetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: Constant.xColorDarkSub,
                            borderRadius:
                                BorderRadius.circular(Constant.xDefaultSize),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  data.leagueName!,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [
                                        ClipOval(
                                          child: CustomCacheImg(
                                            url: data.homeLogo!,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          data.homeName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    data.homeScore.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Padding(
                                    padding: xSpaceSymetric(horizontal: 5),
                                    child: Text(
                                      "VS",
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                  Text(
                                    data.awayScore.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [
                                        ClipOval(
                                          child: CustomCacheImg(
                                            url: data.awayLogo!,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          data.awayName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
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
