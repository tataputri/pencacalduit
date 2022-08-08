import 'package:flutter/material.dart';

dynamic xWidth(BuildContext context) => MediaQuery.of(context).size.width;

dynamic xHeight(BuildContext context) => MediaQuery.of(context).size.height;

dynamic xSpaceSymetric({
  double vertical = 0,
  double horizontal = 0,
}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

dynamic xSpaceOnly({
  double top = 0,
  double right = 0,
  double bottom = 0,
  double left = 0,
}) =>
    EdgeInsets.only(bottom: bottom, left: left, right: right, top: top);
