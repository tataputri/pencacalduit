import 'package:firemax_football/bloc/home/home_bloc.dart';
import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:firemax_football/views/widgets/card_glass_effect.dart';
import 'package:firemax_football/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget homeLigaBar() {
  return Column(
    children: [
      labelLigaBar(),
      contentLigaBar(),
    ],
  );
}

Widget labelLigaBar() => Padding(
      padding: xSpaceSymetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "LIGA",
            style: xFontH1,
          ),
          BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, state) {
              if (state is ValidationLoaded) {
                return InkWell(
                  onTap: () {
                    GoRoute.push(
                      context: context,
                      routeName: xRouteALlLiga,
                      modelValidation: state.modelValidation,
                    );
                  },
                  child: Text(
                    "Ver Tudo",
                    style: xFontSmall,
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );

Widget contentLigaBar() => BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeWaiting) {
          return CustomCardGlassEffect(
            width: xWidth(context),
            child: const Center(
              child: CustomLoading(
                height: 30,
                width: 30,
                color: xColorSubMain,
              ),
            ),
          );
        }
        if (state is HomeLoaded) {
          return Container(
            height: 60,
            margin: xSpaceOnly(bottom: 10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount:
                  state.dataLiga!.length <= 5 ? state.dataLiga!.length : 5,
              itemBuilder: (BuildContext context, int index) {
                var data = state.dataLiga![index];
                return BlocBuilder<ValidationBloc, ValidationState>(
                  builder: (context, stateVal) {
                    if (stateVal is ValidationLoaded) {
                      return InkWell(
                        onTap: () { 
                          GoRoute.push(
                            context: context,
                            routeName: xRouteALlLiga,
                            modelValidation: stateVal.modelValidation,
                            index: index,
                            data1: data
                          );
                        },
                        child: CustomCardGlassEffect(
                          child: Container(
                            padding: xSpaceSymetric(horizontal: 10),
                            child: Center(
                                child: Text(
                              data,
                              style: xFontP,
                            )),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                );
              },
            ),
          );
        }
        return Container();
      },
    );
