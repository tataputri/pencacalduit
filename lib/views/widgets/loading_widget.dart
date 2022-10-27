import 'package:firemax_football/constants/constant.dart';
import 'package:flutter/material.dart'; 

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
        color: color ?? Constant.xColorAccents,
        strokeWidth: strokeWidth?? 3,
      ),
    );
  }
}
