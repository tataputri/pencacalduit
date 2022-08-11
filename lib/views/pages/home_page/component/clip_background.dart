import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:flutter/cupertino.dart';

Widget homeClipBg(BuildContext context) => Container(
      width: xWidth(context),
      height: xHeight(context) * 0.45,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(0),
        ),
        color: xColorVariant,
      ),
    );
