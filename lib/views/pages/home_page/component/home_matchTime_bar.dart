// ignore_for_file: file_names

import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:firemax_football/views/widgets/card_glass_effect.dart';
import 'package:flutter/material.dart';

Widget homeMatchTimeBar() {
  return Column(
    children: [labelMatchTimeBar(), contentMathcTimeBar()],
  );
}

Widget labelMatchTimeBar() => Padding(
      padding: xSpaceSymetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hora da partida",
            style: xFontH1,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "Ver Tudo",
              style: xFontSmall,
            ),
          ),
        ],
      ),
    );

Widget contentMathcTimeBar() => Container(
      height: 60,
      margin: xSpaceOnly(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return CustomCardGlassEffect(
            child: Container(
              padding: xSpaceSymetric(horizontal: 10),
              child: Center(child: Text("12:00:00", style: xFontP,)),
            ),
          );
        },
      ),
    );
