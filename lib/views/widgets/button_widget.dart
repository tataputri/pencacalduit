import 'package:flutter/material.dart';
import 'package:template_spam_playtore/constants/fonts_style.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final Color? color;
  final double? elevation;
  const CustomButton({Key? key, this.child, this.onTap, this.color, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color??Colors.transparent,
        elevation: elevation ?? 0,
      ),
      onPressed: onTap,
      child: child ??
          Text(
            "Submit",
            style: tspFontP,
          ),
    );
  }
}
