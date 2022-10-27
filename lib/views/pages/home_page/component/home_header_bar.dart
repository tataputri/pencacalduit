import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:flutter/material.dart';

Widget homeHeaderBar(BuildContext context) => Padding(
      padding: xSpaceSymetric(vertical: 15),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Fire",
            style: Theme.of(context).textTheme.headline1!,
          ),
          TextSpan(
            text: "Max",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Constant.xColorAccents),
          ),
        ]),
      ),
    );
