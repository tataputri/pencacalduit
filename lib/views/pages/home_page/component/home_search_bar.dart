import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/routes/route_constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget homeSearchBar(BuildContext context) =>
    BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        if (state is ValidationLoaded) {
          return InkWell(
            onTap: () => GoRoute.push(
                context: context,
                routeName: xRouteSearch,
                modelValidation: state.modelValidation),
            child: Container(
              width: xWidth(context),
              height: xHeight(context) * 0.07,
              margin: xSpaceSymetric(horizontal: 20, vertical: 10),
              padding: xSpaceSymetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: xColorSubVariant,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: xColorSubMain.withOpacity(0.15),
                        blurRadius: 4,
                        offset: const Offset(1, 2),
                        spreadRadius: 2)
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    color: xColorSubMain,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Pesquisar Times e Tigas...",
                    style: xFontP,
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
