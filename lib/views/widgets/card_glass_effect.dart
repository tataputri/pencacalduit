import 'dart:ui';

import 'package:firemax_football/constants/colors_style.dart';
import 'package:firemax_football/constants/space_style.dart';
import 'package:flutter/material.dart';

class CustomCardGlassEffect extends StatelessWidget {
  final double? width;
  final Widget child;
  const CustomCardGlassEffect({
    Key? key,
    this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: xSpaceSymetric(horizontal: 8, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 15),
          child: Container(
            width: width,
            padding: xSpaceSymetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: xColorVariant, width: 1),
              color: xColorSubPrimary.withOpacity(0.3),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
