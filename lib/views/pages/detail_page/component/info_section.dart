import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/models/match.dart';
import 'package:flutter/material.dart';

Widget infoSection(BuildContext context, ModelMatch item) {
  return Container(
    width: Constant.xSizeWidth(context),
    // height: 280,
    padding: Constant.xSpaceSymetric(horizontal: 10, vertical: 15),
    margin: Constant.xSpaceSymetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      color: Constant.xColorDarkSub,
      borderRadius: BorderRadius.circular(Constant.xDefaultSize),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Info  ", style: Theme.of(context).textTheme.headline3),
        const Divider(
          color: Constant.xColorLightSub,
        ),
        Column(
          children: [
            Container(
              margin: Constant.xSpaceOnly(bottom: 5, top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 8,
                    backgroundColor: Constant.xColorLight,
                    child: Icon(
                      Icons.groups,
                      color: Constant.xColorLightSub,
                      size: 10,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text("League Name  : ",
                      style: Theme.of(context).textTheme.subtitle1!),
                  Expanded(
                    child: Text(item.leagueName!,
                        style: Theme.of(context).textTheme.subtitle1!),
                  ),
                ],
              ),
            ),
            Container(
              margin: Constant.xSpaceOnly(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.stadium, size: 15),
                  const SizedBox(width: 5),
                  Text("Stadium : ",
                      style: Theme.of(context).textTheme.subtitle1!),
                  Expanded(
                    child: Text(
                        item.stadiumName! == "" ? "-" : item.stadiumName!,
                        style: Theme.of(context).textTheme.subtitle1!),
                  ),
                ],
              ),
            ),
            Container(
              margin: Constant.xSpaceOnly(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.device_thermostat, size: 15),
                  const SizedBox(width: 5),
                  Text("Temperature : ",
                      style: Theme.of(context).textTheme.subtitle1!),
                  Expanded(
                    child: Text(item.temperatur! == "" ? "-" : item.temperatur!,
                        style: Theme.of(context).textTheme.subtitle1!),
                  ),
                ],
              ),
            ),
            Container(
              margin: Constant.xSpaceOnly(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.air, size: 15),
                  const SizedBox(width: 5),
                  Text("Wheater : ",
                      style: Theme.of(context).textTheme.subtitle1!),
                  Expanded(
                    child: Text(item.wheater! == "" ? "-" : item.wheater!,
                        style: Theme.of(context).textTheme.subtitle1!),
                  ),
                ],
              ),
            ),
            Container(
              margin: Constant.xSpaceOnly(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.watch_later_rounded, size: 15),
                  const SizedBox(width: 5),
                  Text("Match Time : ",
                      style: Theme.of(context).textTheme.subtitle1!),
                  Expanded(
                    child: Text(item.matchTime! == "" ? "-" : item.matchTime!,
                        style: Theme.of(context).textTheme.subtitle1!),
                  ),
                ],
              ),
            ),
            Container(
              margin: Constant.xSpaceOnly(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.date_range, size: 15),
                  const SizedBox(width: 5),
                  Text("Match Date  : ",
                      style: Theme.of(context).textTheme.subtitle1!),
                  Expanded(
                    child: Text(
                        item.matchDate! == ""
                            ? "-"
                            : item.matchDate!.replaceAll("/", "-"),
                        style: Theme.of(context).textTheme.subtitle1!),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: Constant.xColorLightSub,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text("HOME ", style: Theme.of(context).textTheme.headline6!),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 10),
                  child: Text(
                    item.homeScore.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.homeYellowCard.toString() == ""
                            ? "-"
                            : item.homeYellowCard.toString(),
                        style: Theme.of(context).textTheme.subtitle1!,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.homeRedCard.toString() == ""
                            ? "-"
                            : item.homeRedCard.toString(),
                        style: Theme.of(context).textTheme.subtitle1!,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 5),
                  child: Container(
                    margin: Constant.xSpaceOnly(right: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.bar_chart_sharp, size: 18),
                        Text(
                          item.homeRedCard.toString() == ""
                              ? "-"
                              : item.homeRedCard.toString(),
                          style: Theme.of(context).textTheme.subtitle1!,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text("AWAY ", style: Theme.of(context).textTheme.headline6!),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 10),
                  child: Text(
                    item.awayScore.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.awayYellowCard.toString() == ""
                            ? "-"
                            : item.awayYellowCard.toString(),
                        style: Theme.of(context).textTheme.subtitle1!,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.awayRedCard.toString() == ""
                            ? "-"
                            : item.awayRedCard.toString(),
                        style: Theme.of(context).textTheme.subtitle1!,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: Constant.xSpaceSymetric(vertical: 5),
                  child: Container(
                    margin: Constant.xSpaceOnly(right: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.bar_chart_sharp, size: 18),
                        Text(
                          item.awayRedCard.toString() == ""
                              ? "-"
                              : item.awayRedCard.toString(),
                          style: Theme.of(context).textTheme.subtitle1!,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
