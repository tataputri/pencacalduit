import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:flutter/material.dart';

Widget playClipBg(BuildContext context) => Positioned(
  bottom: 0,
      child: Container(
        width: xWidth(context),
        height: xHeight(context) * 0.2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: xColorVariant,
        ),
      ),
    );
