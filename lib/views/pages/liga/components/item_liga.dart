import 'package:firemax_football/bloc/validation/validation_bloc.dart';
import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/routes/routes_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/today.dart';

class ItemLiga extends StatelessWidget {
  const ItemLiga({
    Key? key,
    required this.itemLiga,
  }) : super(key: key);

  final Result itemLiga;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        if (state is ValidationLoaded) {
          return InkWell(
            onTap: () {
              GoRoute.push(
                  context: context,
                  routeName: Constant.xScreenDetailLiga,
                  modelValidation: state.modelValidation,
                  listMatch: itemLiga.match
                  );
            },
            child: Container(
              width: Constant.xSizeWidth(context),
              padding: Constant.xSpaceSymetric(horizontal: 8, vertical: 10),
              margin: Constant.xSpaceSymetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Constant.xColorDarkSub,
                borderRadius: BorderRadius.circular(Constant.xDefaultSize),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Constant.xColorAccentsSub,
                    child: Icon(
                      Icons.groups,
                      color: Constant.xColorAccents,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemLiga.leagueName!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          itemLiga.match![0].leagueNameShort!,
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
