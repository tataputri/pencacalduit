import 'package:flutter/cupertino.dart';

const Color xColorMain = Color(0xff100F0F);
const Color xColorSubMain = Color(0xff2C3333);
const Color xColorSubPrimary = Color(0xffF1F1F1);
const Color xColorPrimary = Color(0xffFFFFFF);
const Color xColorVariant = Color(0xff395B64);
const Color xColorSubVariant = Color(0xffA5C9CA);

LinearGradient xGradientLight = const LinearGradient(
  colors: [xColorVariant, xColorSubVariant],
  tileMode: TileMode.clamp,
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
LinearGradient xGradientDark = const LinearGradient(
  colors: [xColorMain, xColorSubMain],
  tileMode: TileMode.clamp,
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
