import 'package:flutter/material.dart';

dynamic tspWidth(BuildContext context) => MediaQuery.of(context).size.width;

dynamic tspHeight(BuildContext context) => MediaQuery.of(context).size.height;

dynamic tspSpaceSymetric({double vertical = 0, double horizontal = 0}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

dynamic tspSpaceOnly(
        {double top = 0,
        double right = 0,
        double bottom = 0,
        double left = 0}) =>
    EdgeInsets.only(bottom: bottom, left: left, right: right, top: top);
