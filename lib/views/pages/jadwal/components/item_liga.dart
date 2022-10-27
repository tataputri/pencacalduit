 
import 'package:firemax_football/constants/constant.dart';
import 'package:flutter/material.dart';

import '../../../../models/jadwal.dart';
 
class ItemLiga extends StatelessWidget {
  final Result itemLiga;
  const ItemLiga({super.key, required this.itemLiga});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Constant.xSpaceOnly(bottom: 5),
      padding: Constant.xSpaceSymetric(horizontal: Constant.xDefaultSize),
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
    );
  }
}
