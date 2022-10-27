import 'package:flutter/material.dart';

import '../../../../constants/constant.dart';
import '../../../../models/match.dart';
import '../../../widgets/cache_img_widget.dart';

Container infoScore(BuildContext context , ModelMatch modelMatch) {
  return Container(
    width: Constant.xSizeWidth(context),
    padding: Constant.xSpaceSymetric(horizontal: 10, vertical: 15),
    margin: Constant.xSpaceSymetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      color: Constant.xColorDarkSub,
      borderRadius: BorderRadius.circular(Constant.xDefaultSize),
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Constant.xSizeWidth(context) * 0.25,
              child: Column(
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: CustomCacheImg(
                        url: modelMatch.homeLogo!,
                        width: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    modelMatch.homeName!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: Constant.xSpaceSymetric(horizontal: 10),
                    child: Text(
                      modelMatch.homeScore.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    )),
                Text("VS", style: Theme.of(context).textTheme.headline4),
                Padding(
                  padding: Constant.xSpaceSymetric(horizontal: 10),
                  child: Text(
                    modelMatch.awayScore.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Constant.xSizeWidth(context) * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: CustomCacheImg(
                        url: modelMatch.awayLogo!,
                        width: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    modelMatch.awayName!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
