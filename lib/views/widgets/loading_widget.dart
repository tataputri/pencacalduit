import 'package:flutter/material.dart';
import 'package:firemax_football/constants/colors_style.dart';

class CustomLoading extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final double? strokeWidth;
  const CustomLoading({Key? key, this.color, this.height, this.width, this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height?? 25,
      width: width ?? 25,
      child: CircularProgressIndicator(
        color: color ?? xColorVariant,
        strokeWidth: strokeWidth?? 3,
      ),
    );
  }
}
