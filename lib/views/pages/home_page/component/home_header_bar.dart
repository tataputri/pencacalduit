import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/fonts_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:flutter/material.dart';

Widget homeHeaderBar() => Padding(
      padding: xSpaceSymetric(vertical: 15),
      child: Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Fire",
                style: xFontH1.copyWith(fontSize: 24),
              ),
              TextSpan(
                text: "Max",
                style: xFontH1.copyWith(
                  fontSize: 24,
                  color: xColorSubVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          )),
    );
