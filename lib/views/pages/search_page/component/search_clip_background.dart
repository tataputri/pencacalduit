import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:flutter/material.dart';

Widget searchClipBg(BuildContext context) => Container(
      width: xWidth(context),
      height: xHeight(context) * 0.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(150),
        ),
        color: xColorVariant,
      ),
    );
